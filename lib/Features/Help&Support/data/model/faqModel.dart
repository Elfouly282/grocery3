import '../../domain/entity/faqEntity.dart';

class FaqModel {
  final int id;
  final String question;
  final String answer;
  final String? category;

  FaqModel({
    required this.id,
    required this.question,
    required this.answer,
    this.category,
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) {
    return FaqModel(
      id: json['id'],
      question: json['question'],
      answer: json['answer'],
      category: json['category'],
    );
  }
  FaqEntity toEntity() {
    return FaqEntity(
      id: id,
      question: question,
      answer: answer,
      category: category,
    );
  }
}

class FaqResponseModel {
  final List<FaqModel> faqs;

  FaqResponseModel({required this.faqs});

  factory FaqResponseModel.fromJson(Map<String, dynamic> json) {
    final list = json['data']['data'] as List;

    return FaqResponseModel(
      faqs: list.map((e) => FaqModel.fromJson(e)).toList(),
    );
  }
}