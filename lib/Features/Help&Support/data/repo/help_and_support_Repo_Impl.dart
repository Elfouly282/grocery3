import 'package:dartz/dartz.dart';
import 'package:grocery3/Features/Help&Support/data/model/PrivacyPolicyModel.dart';
import 'package:grocery3/Features/Help&Support/domain/entity/TermsEntity.dart';
import 'package:grocery3/Features/Help&Support/domain/entity/contact_Us_Entity.dart';
import 'package:grocery3/Features/Help&Support/domain/entity/privacy_Policy_Entity.dart';
import 'package:grocery3/Features/Help&Support/domain/repo/help_and_support_repo.dart';
import 'package:grocery3/core/api/api_consumer.dart';

import '../../../../core/api/api_keys.dart';
import '../../../../core/error/error_model.dart';
import '../../../../core/error/exception.dart';
import '../../domain/entity/faqEntity.dart';
import '../model/contact_Us_Model.dart';
import '../model/faqModel.dart';
import '../model/termsModel.dart';

class Help_and_Support_Repo_Impl extends HelpAndSupportRepo {
  final ApiConsumer api;
  Help_and_Support_Repo_Impl(this.api);

  @override
  Future<Either<ServerException, List<FaqEntity>>> getFaqs() async {
    try {
      final response = await api.get(EndPoint.faqs);

      final model = FaqResponseModel.fromJson(response);

      final result = model.faqs.map((e) => e.toEntity()).toList();

      return Right(result);
    } catch (e) {
      return Left(ServerException(errModel: ErrorModel(message: e.toString())));
    }
  }

  @override
  Future<Either<ServerException, ContactEntity>> contactUs({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    try {
      final response = await api.post(
        EndPoint.contact_Us,
        data: {
          "name": name,
          "email": email,
          "subject": subject,
          "message": message,
        },
      );

      final model = ContactResponseModel.fromJson(response);

      return Right(model.data.toEntity());
    } catch (e) {
      return Left(ServerException(errModel: ErrorModel(message: e.toString())));
    }
  }

  @override
  Future<Either<ServerException, TermsEntity>> getTerms() async{
    try {
      final response = await api.get(EndPoint.terms);

      final model = TermsModel.fromJson(response);

      return Right(model.toEntity());
    } catch (e) {
      return Left(
        ServerException(errModel: ErrorModel(message: e.toString())),
      );
    }
  }

  @override
  Future<Either<ServerException, PrivacyPolicyEntity>> getPrivacyAndPolicy() async{
    try {
      final response = await api.get(
        "${EndPoint.privacy_policy}",
      );

      final model = Privacypolicymodel.fromJson(response);

      return Right(model.toEntity());
    } on ServerException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        ServerException(
          errModel: ErrorModel(message: e.toString()),
        ),
      );
    }
  }

  @override
  Future<Either<ServerException, PrivacyPolicyEntity>> aboutUs() async {
    try {
      final response = await api.get(
        "${EndPoint.about_Us}",
      );

      final model = Privacypolicymodel.fromJson(response);

      return Right(model.toEntity());
    } on ServerException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        ServerException(
          errModel: ErrorModel(message: e.toString()),
        ),
      );
    }
  }
}
