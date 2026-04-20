class ContactEntity {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String subject;
  final String message;
  final String? status;
  final String? adminNotes;
  final String createdAt;
  final String humanDate;

  ContactEntity({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    required this.subject,
    required this.message,
    this.status,
    this.adminNotes,
    required this.createdAt,
    required this.humanDate,
  });
}