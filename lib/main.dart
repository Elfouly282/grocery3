import 'package:flutter/material.dart';
import 'package:grocery3/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:grocery3/features/profile/presentation/screens/profile_screen.dart';
import 'injection_container.dart' as di;
import 'core/helper/cache/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ProfileScreen(),
      // home: BlocProvider(
      //   create: (context) => di.sl<ProductBloc>(),
      //   child: const ProductDetailsScreen(productId: 1),
      // ),
    );
  }
}
