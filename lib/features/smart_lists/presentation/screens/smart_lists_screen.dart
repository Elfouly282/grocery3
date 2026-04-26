import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/theme/app_colors.dart';
import '../bloc/smart_lists_bloc.dart';
import '../bloc/smart_lists_event.dart';
import '../bloc/smart_lists_state.dart';
import 'smart_list_details_screen.dart';

class SmartListsScreen extends StatefulWidget {
  const SmartListsScreen({super.key});

  @override
  State<SmartListsScreen> createState() => _SmartListsScreenState();
}

class _SmartListsScreenState extends State<SmartListsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SmartListsBloc>().add(GetSmartListsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Smart Lists',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<SmartListsBloc, SmartListsState>(
        builder: (context, state) {
          if (state is SmartListsLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          } else if (state is SmartListsError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: AppColors.error),
              ),
            );
          } else if (state is SmartListsLoaded) {
            // print(state.smartLists);
            if (state.smartLists.isEmpty) {
              return const Center(child: Text('No smart lists found'));
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.smartLists.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final list = state.smartLists[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  tileColor: AppColors.background,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(color: AppColors.border),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: AppColors.primary.withOpacity(0.1),
                    child: Text(list.icon.isNotEmpty ? list.icon : '📝'),
                  ),
                  title: Text(
                    list.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('${list.itemsCount} Items'),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: AppColors.grey,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                SmartListDetailsScreen(listId: list.id),
                      ),
                    );
                  },
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
