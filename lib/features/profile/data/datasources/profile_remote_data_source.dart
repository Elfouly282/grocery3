import 'package:dio/dio.dart';
import 'package:grocery3/core/api/api_consumer.dart';
import 'package:grocery3/core/api/api_keys.dart';
import 'package:grocery3/features/profile/data/models/profile_model.dart';
import 'package:grocery3/features/profile/domain/usecases/update_profile.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> getProfile();
  Future<ProfileModel> updateProfile(UpdateProfileParams params);
  Future<ProfileModel> updateImage(String imagePath);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiConsumer api;

  ProfileRemoteDataSourceImpl({required this.api});

  @override
  Future<ProfileModel> getProfile() async {
    final response = await api.get(EndPoint.profile);
    return ProfileModel.fromJson(response);
  }

  @override
  Future<ProfileModel> updateProfile(UpdateProfileParams params) async {
    final response = await api.patch(
      EndPoint.profileUpdate,
      data: params.toJson(),
    );
    return ProfileModel.fromJson(response);
  }

  @override
  Future<ProfileModel> updateImage(String imagePath) async {
    try {
      final file = await MultipartFile.fromFile(imagePath);

      final response = await api.post(
        EndPoint.profileImageUpdate,
        isFromData: true,
        data: {'image': file},
      );

      return ProfileModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
