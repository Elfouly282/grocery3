import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/theme/app_colors.dart';
import '../../../product_details/presentation/widgets/product_card.dart';
import '../bloc/smart_lists_bloc.dart';
import '../bloc/smart_lists_event.dart';
import '../bloc/smart_lists_state.dart';

class SmartListDetailsScreen extends StatefulWidget {
  final int listId;
  const SmartListDetailsScreen({super.key, required this.listId});

  @override
  State<SmartListDetailsScreen> createState() => _SmartListDetailsScreenState();
}

class _SmartListDetailsScreenState extends State<SmartListDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SmartListsBloc>().add(GetSmartListDetailsEvent(widget.listId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'List Details',
          style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<SmartListsBloc, SmartListsState>(
        builder: (context, state) {
          if (state is SmartListsLoading) {
            return const Center(child: CircularProgressIndicator(color: AppColors.primary));
          } else if (state is SmartListsError) {
            return Center(child: Text(state.message, style: const TextStyle(color: AppColors.error)));
          } else if (state is SmartListDetailsLoaded) {
            final list = state.smartList;
            if (list.products.isEmpty) {
              return const Center(child: Text('No products in this list'));
            }
            return GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: list.products.length,
              itemBuilder: (context, index) {
                final product = list.products[index];
                return ProductCard(
                  product: product,
                  onAddToCart: () {},
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
