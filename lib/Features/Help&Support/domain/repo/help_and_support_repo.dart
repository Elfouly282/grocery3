import 'package:dartz/dartz.dart';
import 'package:grocery3/Features/Help&Support/domain/entity/TermsEntity.dart';
import 'package:grocery3/Features/Help&Support/domain/entity/faqEntity.dart';
import 'package:grocery3/Features/Help&Support/domain/entity/privacy_Policy_Entity.dart';

import '../../../../core/error/exception.dart';
import '../../../notification/domain/Entity/notification_Entity.dart';
import '../entity/contact_Us_Entity.dart';

abstract class HelpAndSupportRepo {
  Future<Either<ServerException, List<FaqEntity>>> getFaqs();
  Future<Either<ServerException, PrivacyPolicyEntity>> getPrivacyAndPolicy();
  Future<Either<ServerException, PrivacyPolicyEntity>> aboutUs();
  Future<Either<ServerException, TermsEntity>> getTerms();
  Future<Either<ServerException, ContactEntity>> contactUs({
    required String name,
    required String email,
    required String subject,
    required String message,
  });
}
