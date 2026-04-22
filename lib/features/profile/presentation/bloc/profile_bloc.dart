import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/features/profile/domain/entities/profile.dart';
import 'package:grocery3/features/profile/domain/usecases/get_profile.dart';
import 'package:grocery3/features/profile/domain/usecases/update_image.dart';
import 'package:grocery3/features/profile/domain/usecases/update_profile.dart';
import 'package:grocery3/features/profile/presentation/bloc/profile_event.dart';
import 'package:grocery3/features/profile/presentation/bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  final UpdateImageUseCase updateImageUseCase;

  ProfileBloc({
    required this.getProfileUseCase,
    required this.updateProfileUseCase,
    required this.updateImageUseCase,
  }) : super(const ProfileInitial()) {
    on<GetProfileEvent>(onGetProfile);
    on<UpdateProfileEvent>(onUpdateProfile);
    on<UpdateProfileImageEvent>(onUpdateImage);
  }

  Future<void> onGetProfile(
    GetProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const GetProfileLoading());
    final result = await getProfileUseCase();
    result.fold(
      (failure) => emit(GetProfileError(message: failure.message)),
      (profile) => emit(GetProfileLoaded(profile)),
    );
  }

  Future<void> onUpdateProfile(
    UpdateProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    final currentProfile = _currentProfile;
    if (currentProfile != null) {
      emit(GetProfileLoaded(currentProfile));
    }

    final result = await updateProfileUseCase(event.params);
    result.fold((failure) => emit(GetProfileError(message: failure.message)), (
      profile,
    ) {
      emit(GetProfileLoaded(profile));
    });
  }

  Future<void> onUpdateImage(
    UpdateProfileImageEvent event,
    Emitter<ProfileState> emit,
  ) async {
    final currentProfile = _currentProfile;
    if (currentProfile != null) {
      emit(UpdateProfileImageLoaded(currentProfile));
    }

    final result = await updateImageUseCase(event.imagePath);
    result.fold(
      (failure) {
        emit(UpdateProfileImageError(message: failure.message));
      },
      (profile) {
        emit(UpdateProfileImageLoaded(profile));
      },
    );
  }

  ProfileEntity? get _currentProfile => state.profile;
}
