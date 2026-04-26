import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/core/utils/get_it_server_locator.dart';
import 'package:grocery3/features/smart_lists/domain/usecases/get_smart_list_details.dart';
import 'package:grocery3/features/smart_lists/domain/usecases/get_smart_lists.dart';
import 'package:grocery3/features/smart_lists/presentation/bloc/smart_lists_bloc.dart';
import 'package:grocery3/features/smart_lists/presentation/bloc/smart_lists_event.dart';
import 'package:grocery3/features/smart_lists/presentation/screens/smart_lists_screen.dart';

class SmartListScreenBlocProvide extends StatelessWidget {
  const SmartListScreenBlocProvide({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SmartListsBloc>(),
      child: SmartListsScreen(),
    );
  }
}
