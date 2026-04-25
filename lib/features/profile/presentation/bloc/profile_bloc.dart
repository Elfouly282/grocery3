import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/features/profile/domain/entities/profile_user_entity.dart';
import 'package:grocery3/features/profile/domain/usecases/add_address.dart';
import 'package:grocery3/features/profile/domain/usecases/get_addresses.dart';
import 'package:grocery3/features/profile/domain/usecases/get_profile.dart';
import 'package:grocery3/features/profile/domain/usecases/update_image.dart';
import 'package:grocery3/features/profile/domain/usecases/update_profile.dart';
import 'package:grocery3/features/profile/presentation/bloc/profile_event.dart';
import 'package:grocery3/features/profile/presentation/bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase getProfileUseCase;
  final GetAddressesUseCase getAddressesUseCase;
  final AddAddressUseCase addAddressUseCase;
  final UpdateImageUseCase updateImageUseCase;
  final UpdateProfileUseCase updateProfileUseCase;

  ProfileBloc({
    required this.getProfileUseCase,
    required this.getAddressesUseCase,
    required this.addAddressUseCase,
    required this.updateImageUseCase,
    required this.updateProfileUseCase,
  }) : super(ProfileInitial()) {
    on<GetProfileEvent>(_onGetProfile);
    on<GetAddressesEvent>(_onGetAddresses);
    on<AddAddressEvent>(_onAddAddress);
    on<UpdateProfileImageEvent>(_onUpdateProfileImage);
    on<UpdateProfileEvent>(_onUpdateProfile);
  }

  Future<void> _onGetProfile(
    GetProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(GetProfileLoading());
    final failureOrUser = await getProfileUseCase();
    failureOrUser.fold(
      (failure) => emit(GetProfileError(message: failure.message)),
      (user) => emit(GetProfileLoaded(user: user)),
    );
  }

  Future<void> _onUpdateProfileImage(
    UpdateProfileImageEvent event,
    Emitter<ProfileState> emit,
  ) async {
    final currentState = state;
    ProfileUserEntity? currentUser;
    
    // Get current user from any loaded state
    if (currentState is GetProfileLoaded) {
      currentUser = currentState.user;
    }

    emit(UpdateImageLoading());
    final failureOrUser = await updateImageUseCase(event.imagePath);
    failureOrUser.fold(
      (failure) => emit(UpdateImageError(message: failure.message)),
      (img) {
        if (currentUser != null) {
          // Update the current user with new image and return to GetProfileLoaded state
          final updatedUser = currentUser.copyWith(profilePicture: img);
          emit(GetProfileLoaded(user: updatedUser));
        } else {
          emit(UpdateImageLoaded(imageUrl: img));
        }
      },
    );
  }

  Future<void> _onUpdateProfile(
    UpdateProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(UpdateProfileLoading());
    final failureOrUser = await updateProfileUseCase(event.params);
    failureOrUser.fold(
      (failure) => emit(UpdateProfileError(message: failure.message)),
      (user) => emit(UpdateProfileLoaded(updateProfileModel: user)),
    );
  }

  Future<void> _onGetAddresses(
    GetAddressesEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(GetAddressesLoading());
    final failureOrAddresses = await getAddressesUseCase();
    failureOrAddresses.fold(
      (failure) => emit(GetAddressesError(message: failure.message)),
      (addresses) => emit(GetAddressesLoaded(addresses: addresses)),
    );
  }

  Future<void> _onAddAddress(
    AddAddressEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(AddAddressLoading());
    final failureOrAddress = await addAddressUseCase(event.params);
    failureOrAddress.fold(
      (failure) => emit(AddAddressError(message: failure.message)),
      (address) => emit(AddAddressLoaded(address: address)),
    );
  }
}
