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

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ProfileUserEntity? user;
  final UpdateProfileEntity? updateProfileModel;
  final String? imageUrl;

  const ProfileLoaded({this.user, this.imageUrl, this.updateProfileModel});

  @override
  List<Object?> get props => [user];
}

class ProfileError extends ProfileState {
  final String message;

  const ProfileError({required this.message});

  @override
  List<Object?> get props => [message];
}
