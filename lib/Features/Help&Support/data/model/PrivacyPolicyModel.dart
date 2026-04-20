
import '../../domain/entity/privacy_Policy_Entity.dart';

class Privacypolicymodel {
  final int id;
  final String title;
  final String content;

  Privacypolicymodel({
    required this.id,
    required this.title,
    required this.content,
  });

  factory Privacypolicymodel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};

    return Privacypolicymodel(
      id: data['id'] ?? 0,
      title: data['title'] ?? '',
      content: data['content'] ?? '',
    );
  }

  PrivacyPolicyEntity toEntity() {
    return PrivacyPolicyEntity(
      id: id,
      title: title,
      content: content,
    );
  }
}