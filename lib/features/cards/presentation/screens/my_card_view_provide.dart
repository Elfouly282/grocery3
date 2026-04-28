import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery3/core/utils/get_it_server_locator.dart';
import 'package:grocery3/features/cards/presentation/bloc/cards_bloc.dart';
import 'package:grocery3/features/cards/presentation/screens/my_cards_screen.dart';

class MyCardViewProvide extends StatelessWidget {
  const MyCardViewProvide({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider( 
      create: (context) => getIt<CardsBloc>(), // Replace with your actual Bloc
      child: MyCardsScreen(), // Replace with your actual UI widget
    );
  }
}