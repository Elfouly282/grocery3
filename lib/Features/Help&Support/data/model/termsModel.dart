import '../../domain/entity/TermsEntity.dart';

class TermsModel {
  final int id;
  final String title;
  final String content;

  TermsModel({
    required this.id,
    required this.title,
    required this.content,
  });

  factory TermsModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];

    return TermsModel(
      id: data['id'],
      title: data['title'],
      content: data['content'],
    );
  }

  TermsEntity toEntity() {
    return TermsEntity(
      id: id,
      title: title,
      content: content,
    );
  }
}