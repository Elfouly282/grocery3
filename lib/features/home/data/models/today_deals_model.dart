import 'package:grocery3/features/home/domain/entities/today_deal_entity.dart';

class DealResponseModel {
  final bool success;
  final String message;
  final List<DealModel> data;

  DealResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory DealResponseModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return DealResponseModel(success: false, message: '', data: []);
    }
    
    return DealResponseModel(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: (json['data'] as List?)
              ?.map((i) => DealModel.fromJson(i as Map<String, dynamic>))
              .toList() ?? 
          [], // Fallback to an empty list if data is null
    );
  }
}

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required super.id, 
    required super.name,
  });

  factory CategoryModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return CategoryModel(id: 0, name: ''); // Fallback if the whole object is null
    }
    
    return CategoryModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
    );
  }
}

class DealModel extends DealEntity {
  DealModel({
    required super.id,
    required super.title,
    required super.slug,
    required super.description,
    required super.imageUrl,
    required super.offerTitle,
    required super.price,
    required super.discountPrice,
    required super.finalPrice,
    required super.hasOffer,
    required super.category,
    required super.features,
    required super.availableDate,
    required super.createdAt,
  });

  factory DealModel.fromJson(Map<String, dynamic>? json) {
    // If the entire deal object is null for some reason, return a safe default
    if (json == null) {
      return DealModel(
        id: 0,
        title: '',
        slug: '',
        description: '',
        imageUrl: '',
        offerTitle: '',
        price: 0.0,
        discountPrice: 0.0,
        finalPrice: 0.0,
        hasOffer: false,
        category: CategoryModel(id: 0, name: ''),
        features: '',
        availableDate: DateTime.now(),
        createdAt: DateTime.now(),
      );
    }

    // Helper to safely parse dates and avoid FormatExceptions
    DateTime parseDate(dynamic dateString) {
      if (dateString != null) {
        try {
          return DateTime.parse(dateString.toString());
        } catch (_) {}
      }
      return DateTime.now(); // Fallback date
    }

    return DealModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      description: json['description'] as String? ?? '',
      imageUrl: json['image_url'] as String? ?? '',
      offerTitle: json['offer_title'] as String? ?? '',
      
      // Safely handle numbers that could be parsed as int or double by the API
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      discountPrice: (json['discount_price'] as num?)?.toDouble() ?? 0.0,
      finalPrice: (json['final_price'] as num?)?.toDouble() ?? 0.0,
      
      hasOffer: json['has_offer'] as bool? ?? false,
      
      // Safely parse the nested CategoryModel, providing a dummy model if null
      category: json['category'] != null 
          ? CategoryModel.fromJson(json['category'] as Map<String, dynamic>)
          : CategoryModel(id: 0, name: ''),
          
      features: json['features'] as String? ?? '',
      availableDate: parseDate(json['available_date']),
      createdAt: parseDate(json['created_at']),
    );
  }
}