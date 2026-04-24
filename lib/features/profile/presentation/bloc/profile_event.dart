import 'package:equatable/equatable.dart';
import 'package:grocery3/features/profile/domain/entities/update_profile_entity.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class GetProfileEvent extends ProfileEvent {}

class UpdateProfileImageEvent extends ProfileEvent {
  final String imagePath;

  const UpdateProfileImageEvent({required this.imagePath});

  @override
  List<Object> get props => [imagePath];
}

class UpdateProfileEvent extends ProfileEvent {
  final UpdateProfileEntity params;

  const UpdateProfileEvent({required this.params});

  @override
  List<Object> get props => [params];
}
