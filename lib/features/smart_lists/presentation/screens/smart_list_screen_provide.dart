import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/core/utils/get_it_server_locator.dart';
import 'package:grocery3/features/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:grocery3/features/orders/presentation/bloc/orders_bloc.dart';

import 'package:grocery3/features/smart_lists/presentation/bloc/smart_lists_bloc.dart';

import 'package:grocery3/features/smart_lists/presentation/screens/smart_lists_screen.dart';

class SmartListScreenBlocProvide extends StatelessWidget {
  const SmartListScreenBlocProvide({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<SmartListsBloc>()),
        BlocProvider(create: (context) => getIt<FavoritesBloc>()),
        BlocProvider(create: (context) => getIt<OrdersBloc>()),
      ],
      child: SmartListsScreen(),
    );
  }
}
