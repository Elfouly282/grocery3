import 'package:grocery3/features/profile/domain/usecases/update_profile.dart';

abstract class ProfileEvent {}

class GetProfileEvent extends ProfileEvent {}

class UpdateProfileEvent extends ProfileEvent {
  final UpdateProfileParams params;

  UpdateProfileEvent(this.params);
}

class UpdateProfileImageEvent extends ProfileEvent {
  final String imagePath;

  UpdateProfileImageEvent(this.imagePath);
}
