import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/theme/app_colors.dart';
import '../../../favorites/presentation/screens/favorites_screen.dart';
import '../../../orders/presentation/screens/orders_screen.dart';
import '../../../smart_lists/presentation/screens/smart_lists_screen.dart';
import '../../../cards/presentation/screens/my_cards_screen.dart';
import '../../../product_details/presentation/screens/product_details_screen.dart';
import '../../../home/presentation/screens/home_view.dart';
import '../cubit/layout_cubit.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  final List<Widget> screens = const [
    HomeView(), // The actual HomeView with APIs
    SmartListsScreen(),
    OrdersScreen(),
    Center(child: Text('Profile Screen')), // Placeholder for Profile
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          body: screens[currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) => context.read<LayoutCubit>().changeIndex(index),
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.primary,
              unselectedItemColor: const Color(0xFF9CA3AF),
              showUnselectedLabels: true,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              backgroundColor: Colors.white,
              elevation: 0,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt_outlined),
                  activeIcon: Icon(Icons.list_alt),
                  label: 'My List',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.directions_car_outlined),
                  activeIcon: Icon(Icons.directions_car),
                  label: 'My Order',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  activeIcon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(color: AppColors.primary),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(radius: 30, backgroundColor: Colors.white, child: Icon(Icons.person, color: AppColors.primary, size: 40)),
                      SizedBox(height: 10),
                      Text('User Name', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('user@example.com', style: TextStyle(color: Colors.white70, fontSize: 14)),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {
                    context.read<LayoutCubit>().changeIndex(0);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.favorite),
                  title: const Text('Favorites'),
                  onTap: () {
                    context.read<LayoutCubit>().changeIndex(1);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.list_alt),
                  title: const Text('Smart Lists'),
                  onTap: () {
                    context.read<LayoutCubit>().changeIndex(2);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.shopping_bag),
                  title: const Text('Orders'),
                  onTap: () {
                    context.read<LayoutCubit>().changeIndex(3);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.credit_card),
                  title: const Text('My Cards'),
                  onTap: () {
                    context.read<LayoutCubit>().changeIndex(4);
                    Navigator.pop(context);
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () => Navigator.pop(context),
                ),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: const Text('Logout', style: TextStyle(color: Colors.red)),
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
