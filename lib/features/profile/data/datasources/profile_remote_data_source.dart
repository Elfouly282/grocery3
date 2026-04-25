import 'package:dio/dio.dart';
import 'package:grocery3/core/api/api_consumer.dart';
import 'package:grocery3/core/api/api_keys.dart';
import 'package:grocery3/features/profile/data/models/add_address_params_model.dart';
import 'package:grocery3/features/profile/data/models/address_model.dart';
import 'package:grocery3/features/profile/data/models/profile_user_model.dart';
import 'package:grocery3/features/profile/data/models/update_profile_mode.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileUserModel> getProfile();
  Future<UpdateProfileModel> updateProfile(UpdateProfileModel params);
  Future<String> updateImage(String imagePath);
  Future<List<AddressModel>> getAddresses();
  Future<AddressModel> addAddress(AddAddressParamsModel params);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiConsumer api;

  ProfileRemoteDataSourceImpl({required this.api});

  @override
  Future<ProfileUserModel> getProfile() async {
    final response = await api.get(EndPoint.profile);
    final profile = ProfileUserModel.fromJson(response[ApiKeys.data]['me']);

    return profile;
  }

  @override
  Future<UpdateProfileModel> updateProfile(UpdateProfileModel params) async {
    final response = await api.put(
      EndPoint.updateProfile,
      data: params.toJson(),
    );

    final updateUserProfile = UpdateProfileModel.fromJson(response['data']);

    return updateUserProfile;
  }

  @override
  Future<String> updateImage(String imagePath) async {
    try {
      final file = await MultipartFile.fromFile(imagePath);
      final response = await api.post(
        EndPoint.updateProfileImage,
        isFromData: true,
        data: {'image': file},
      );
      final img = response['data']['profile_image_url'];
      return img;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<AddressModel>> getAddresses() async {
    final response = await api.get(EndPoint.addresses);
    final data = response[ApiKeys.data];

    if (data is List) {
      return data.map((e) => AddressModel.fromJson(e)).toList();
    }

    if (data is Map<String, dynamic>) {
      return [AddressModel.fromJson(data)];
    }

    return [];
  }

  @override
  Future<AddressModel> addAddress(AddAddressParamsModel params) async {
    final response = await api.post(EndPoint.addresses, data: params.toJson());
    return AddressModel.fromJson(response[ApiKeys.data]);
  }
}
