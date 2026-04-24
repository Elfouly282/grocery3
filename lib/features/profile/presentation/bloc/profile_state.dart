import 'package:equatable/equatable.dart';
import 'package:grocery3/features/profile/data/models/update_profile_mode.dart';
import 'package:grocery3/features/profile/domain/entities/profile_user_entity.dart';
import 'package:grocery3/features/profile/domain/entities/update_profile_entity.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

// Get Profile States
class GetProfileLoading extends ProfileState {}

class GetProfileLoaded extends ProfileState {
  final ProfileUserEntity user;

  const GetProfileLoaded({required this.user});

  @override
  List<Object?> get props => [user];
}

class GetProfileError extends ProfileState {
  final String message;

  const GetProfileError({required this.message});

  @override
  List<Object?> get props => [message];
}

// Update Profile States
class UpdateProfileLoading extends ProfileState {}

class UpdateProfileLoaded extends ProfileState {
  final UpdateProfileEntity updateProfileModel;

  const UpdateProfileLoaded({required this.updateProfileModel});

  @override
  List<Object?> get props => [updateProfileModel];
}

class UpdateProfileError extends ProfileState {
  final String message;

  const UpdateProfileError({required this.message});

  @override
  List<Object?> get props => [message];
}

// Update Image States
class UpdateImageLoading extends ProfileState {}

class UpdateImageLoaded extends ProfileState {
  final String imageUrl;

  const UpdateImageLoaded({required this.imageUrl});

  @override
  List<Object?> get props => [imageUrl];
}

class UpdateImageError extends ProfileState {
  final String message;

  const UpdateImageError({required this.message});

  @override
  List<Object?> get props => [message];
}
