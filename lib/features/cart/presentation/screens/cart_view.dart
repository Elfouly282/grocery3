// presentation/cart_view.dart
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/core/api/dio_consumer.dart';
import 'package:grocery3/core/connection/network_info.dart';
import 'package:grocery3/features/cart/data/data_source/cart_local_data_source.dart';
import 'package:grocery3/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:grocery3/features/cart/data/repo/cart_repository_impl.dart';
import 'package:grocery3/features/cart/domain/usecase/get_cart_usecase.dart';
import 'package:grocery3/features/cart/domain/usecase/remove_from_cart_usecase.dart';
import 'package:grocery3/features/cart/domain/usecase/update_cart_item_usecase.dart';

import 'package:grocery3/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:grocery3/features/cart/presentation/screens/widgets/cart_view_body.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  
  static String cartId = 'cart_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Search functionality
            },
          ),
        ],
      ),
      body: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final repository = CartRepositoryImpl(
            remoteDataSource: CartRemoteDataSource(
              api: DioConsumer(dio: Dio()),
            ),
            localDataSource: CartLocalDataSource(
              sharedPreferences: snapshot.data!,
            ),
            networkInfo: NetworkInfoImpl(DataConnectionChecker()),
          );

          return BlocProvider(
            create: (context) => CartCubit(
              getCartUseCase: GetCartUseCase(repository),
              updateCartItemUseCase: UpdateCartItemUseCase(repository),
              removeFromCartUseCase: RemoveFromCartUseCase(repository),
            )..loadCart(),
            child: const CartViewBody(),
          );
        },
      ),
    );
  }
}
