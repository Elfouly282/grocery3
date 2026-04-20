
import '../../domain/entity/contact_Us_Entity.dart';

class ContactModel {
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

  ContactModel({
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

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      subject: json['subject'],
      message: json['message'],
      status: json['status'],
      adminNotes: json['admin_notes'],
      createdAt: json['created_at'],
      humanDate: json['human_date'],
    );
  }

  /// 🔄 to Entity
  ContactEntity toEntity() {
    return ContactEntity(
      id: id,
      name: name,
      email: email,
      phone: phone,
      subject: subject,
      message: message,
      status: status,
      adminNotes: adminNotes,
      createdAt: createdAt,
      humanDate: humanDate,
    );
  }
}

class ContactResponseModel {
  final String message;
  final ContactModel data;

  ContactResponseModel({
    required this.message,
    required this.data,
  });

  factory ContactResponseModel.fromJson(Map<String, dynamic> json) {
    return ContactResponseModel(
      message: json['message'],
      data: ContactModel.fromJson(json['data']),
    );
  }
}