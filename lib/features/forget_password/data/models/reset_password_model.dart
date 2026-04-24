import 'package:grocery3/features/forget_password/domain/entities/reset_password_entity.dart';

class ResetPasswordModel extends ResetPasswordEntity{
  ResetPasswordModel({required super.otp, required super.identifier, required super.password, required super.confirmPassword});

}
