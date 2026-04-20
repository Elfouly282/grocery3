class FaqEntity {
  final int id;
  final String question;
  final String answer;
  final String? category;

  FaqEntity({
    required this.id,
    required this.question,
    required this.answer,
    this.category,
  });
}