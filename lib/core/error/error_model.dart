import '../api/api_keys.dart';

class ErrorModel {
  final int? code;
  final String? message;
  final Map<String, List<String>>? errors;
  final dynamic data;

  const ErrorModel({this.code, this.message, this.errors, this.data});

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    // 1. Safely parse the complex validation errors map
    Map<String, List<String>>? parsedErrors;

    if (jsonData[ApiKeys.errors] != null && jsonData[ApiKeys.errors] is Map) {
      parsedErrors = {};
      final errorsMap = jsonData[ApiKeys.errors] as Map<String, dynamic>;

      errorsMap.forEach((key, value) {
        if (value is List) {
          parsedErrors![key] = List<String>.from(value);
        } else if (value is String) {
          // Fallback just in case the API sends a single string instead of a list
          parsedErrors![key] = [value];
        }
      });
    }

    return ErrorModel(
      // 2. Safely cast simple types
      code: jsonData[ApiKeys.statusCode] as int?,
      message: jsonData[ApiKeys.message] as String?,
      errors: parsedErrors,
      data:
          jsonData[ApiKeys
              .data], // dynamic handles maps, lists, or nulls safely
    );
  }

  /// Helper method to extract the most relevant error message for the UI.
  /// It prioritizes specific validation errors over the generic server message.
  String get uiErrorMessage {
    // If there are specific validation errors, return the first one found
    if (errors != null && errors!.isNotEmpty) {
      return errors!.values.first.first;
    }

    // Otherwise, return the generic message, or a fallback default
    return message ?? 'An unexpected error occurred. Please try again.';
  }
}
