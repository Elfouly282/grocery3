// import 'package:flutter/material.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

// class CustomPagedListView<T> extends StatelessWidget {
//   const CustomPagedListView({
//     super.key,
//     required this.pagingController,
//     required this.itemBuilder,
//     this.emptyMessage = "No items found",
//     this.padding,
//     this.shrinkWrap = false,
//     this.physics,
//     this.skeletonItem,
//     this.skeletonCount,
//   });

//   final PagingController<int, T> pagingController;

//   final Widget Function(BuildContext context, T item, int index) itemBuilder;

//   final String emptyMessage;
//   final EdgeInsetsGeometry? padding;
//   final bool shrinkWrap;
//   final ScrollPhysics? physics;

//   final Widget? skeletonItem;
//   final int? skeletonCount;

//   @override
//   Widget build(BuildContext context) {
//     return PagedListView<int, T>(
//       scrollController:  pagingController,
//       state: pagingController.value,
//       fetchNextPage: pagingController.fetchNextPage,
//       padding: padding,
//       shrinkWrap: shrinkWrap,
//       physics: physics,

//       builderDelegate: PagedChildBuilderDelegate<T>(
//         itemBuilder: (context, item, index) {
//           return itemBuilder(context, item, index);
//         },

//         noItemsFoundIndicatorBuilder:
//             (_) => _EmptyWidget(message: emptyMessage),

//         firstPageErrorIndicatorBuilder:
//             (_) => _ErrorWidget(onRetry: pagingController.refresh),

//         newPageErrorIndicatorBuilder:
//             (_) =>
//                 _ErrorWidget(onRetry: pagingController.retryLastFailedRequest),

//         firstPageProgressIndicatorBuilder: (_) => _buildSkeletonList(),

//         newPageProgressIndicatorBuilder:
//             (_) => const Padding(
//               padding: EdgeInsets.all(16),
//               child: Center(child: CircularProgressIndicator()),
//             ),
//       ),
//     );
//   }

//   Widget _buildSkeletonList() {
//     if (skeletonItem == null) {
//       return const Center(child: CircularProgressIndicator());
//     }

//     return ListView.builder(
//       itemCount: skeletonCount,
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemBuilder: (_, _) => skeletonItem!,
//     );
//   }
// }

// class _EmptyWidget extends StatelessWidget {
//   final String message;

//   const _EmptyWidget({required this.message});

//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text(message));
//   }
// }

// class _ErrorWidget extends StatelessWidget {
//   final VoidCallback onRetry;

//   const _ErrorWidget({required this.onRetry});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Text("Something went wrong"),
//           const SizedBox(height: 8),
//           ElevatedButton(onPressed: onRetry, child: const Text("Retry")),
//         ],
//       ),
//     );
//   }
// }
