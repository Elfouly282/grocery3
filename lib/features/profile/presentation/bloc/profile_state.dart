import 'package:grocery3/features/profile/domain/entities/profile.dart';

abstract class ProfileState {
  final ProfileEntity? profile;
  final String? message;

  const ProfileState({this.profile, this.message});
}

class ProfileInitial extends ProfileState {
  const ProfileInitial();
}

class GetProfileLoading extends ProfileState {
  const GetProfileLoading();
}

class GetProfileLoaded extends ProfileState {
  const GetProfileLoaded(ProfileEntity profile) : super(profile: profile);
}

class GetProfileError extends ProfileState {
  const GetProfileError({required super.message});
}

// update profile
class UpdateProfileLoading extends ProfileState {
  const UpdateProfileLoading();
}

class UpdateProfileLoaded extends ProfileState {
  const UpdateProfileLoaded(ProfileEntity profile) : super(profile: profile);
}

class UpdateProfileError extends ProfileState {
  const UpdateProfileError({required super.message});
}

class UpdateProfileImageLoading extends ProfileState {
  const UpdateProfileImageLoading();
}

class UpdateProfileImageLoaded extends ProfileState {
  const UpdateProfileImageLoaded(ProfileEntity profile)
    : super(profile: profile);
}

class UpdateProfileImageError extends ProfileState {
  const UpdateProfileImageError({required super.message});
}
