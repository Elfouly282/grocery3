import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/core/api/dio_consumer.dart';
import 'package:grocery3/core/connection/network_info.dart';
import 'package:grocery3/features/login/data/datasources/login_remote_data_source.dart';
import 'package:grocery3/features/login/data/repositories/login_repository_impl.dart';
import 'package:grocery3/features/login/domain/usecases/login_usecase.dart';
import 'package:grocery3/features/login/presentation/cubit/login_cubit.dart';
import 'package:grocery3/features/login/presentation/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(
          LoginUseCase(
            LoginRepositoryImpl(
              remoteDataSource: LoginRemoteDataSource(
                api: DioConsumer(dio: Dio()),
              ),
              networkInfo: NetworkInfoImpl(DataConnectionChecker()),
            ),
          ),
        ),
        child: LoginViewBody(),
      ),
    );
  }
}
