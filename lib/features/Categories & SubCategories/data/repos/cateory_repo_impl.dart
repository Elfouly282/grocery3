import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:grocery3/core/api/api_consumer.dart';
import 'package:grocery3/core/error/error_model.dart';
import 'package:grocery3/core/error/failures.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/data/models/categories_model/categories_model.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/data/models/sub_categores_item_model/sub_categores_item_model.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/domin/entities/categores_entity.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/domin/entities/sub_categores_item_entity.dart';
import 'package:grocery3/features/Categories%20&%20SubCategories/domin/repos/sub_categry_repo.dart';

class CategoryRepoImpl implements CategoryRepo {
  final ApiConsumer apiConsumer;
  CategoryRepoImpl(this.apiConsumer);
  @override
  Future<Either<ServerException, List<CategoriesItemEntity>>>
  getCategories() async {
    try {
      var response = await apiConsumer.get(
        'https://grocery.newcinderella.online/api/categories',
      );
      if (response["success"] == true) {
        List<dynamic> data = response["data"];

        List<CategoriesItemEntity> categories = [];
        for (var item in data) {
          categories.add(
            CategoriesItemEntity.fromModel(CategoriesItemModel.fromJson(item)),
          );
        }

        return right(categories);
      } else {
        debugPrint(response["message"]);
      }
      return left(
        ServerException(
          response["message"],
          errModel: ErrorModel(message: response["message"]),
        ),
      );
    } catch (e) {
      debugPrint('error  in  categories impl  : ${e.toString()}');
      if (e is DioException) {
        return left(
          ServerException(
            e.response?.data['message'] ?? 'An error occurred',
            errModel: ErrorModel(
              message: e.response?.data['message'] ?? 'An error occurred',
            ),
          ),
        );
      }
      return left(
        ServerException(
          e.toString(),
          errModel: ErrorModel(message: e.toString()),
        ),
      );
    }
  }

  @override
  Future<Either<ServerException, List<SubCategoresItemEntity>>>
  getSubCategories(String id) async {
    try {
      var response = await apiConsumer.get(
        'https://grocery.newcinderella.online/api/categories/$id',
      );
      if (response["success"] == true) {
        List<dynamic> data = response["data"]["meals"];

        List<SubCategoresItemEntity> subCategories = [];
        for (var item in data) {
          subCategories.add(
            SubCategoresItemEntity.fromModel(
              SubCategoresItemModel.fromJson(item),
            ),
          );
        }

        return right(subCategories);
      } else {
        debugPrint(response["message"]);
      }
      return left(
        ServerException(
          response["message"],
          errModel: ErrorModel(message: response["message"]),
        ),
      );
    } catch (e) {
      debugPrint('error  in  categories impl  : ${e.toString()}');
      if (e is DioException) {
        return left(
          ServerException(
            e.response?.data['message'] ?? 'An error occurred',
            errModel: ErrorModel(
              message: e.response?.data['message'] ?? 'An error occurred',
            ),
          ),
        );
      }
      return left(
        ServerException(
          e.toString(),
          errModel: ErrorModel(message: e.toString()),
        ),
      );
    }
  }
}
