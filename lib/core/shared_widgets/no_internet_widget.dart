import 'package:flutter/material.dart';
import 'custom_button.dart';

class NoInternetWidget extends StatelessWidget {
  final VoidCallback onRetry;

  const NoInternetWidget({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.wifi_off, size: 80, color: Colors.grey),
          const SizedBox(height: 16),
          const Text("لا يوجد اتصال بالإنترنت"),
          const SizedBox(height: 24),
          CustomButton(text: "إعادة المحاولة", width: 200, onPressed: onRetry),
        ],
      ),
    );
  }
}
