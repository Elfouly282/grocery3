import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentScreen extends StatefulWidget {
  final String url;

  const PaymentScreen({super.key, required this.url});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late final WebViewController _controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  void _initializeController() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint("WebView Error: ${error.description}");
          },
          onNavigationRequest: (NavigationRequest request) {
             if (request.url.contains('success')) {
              Navigator.of(context).pop(true); 
              return NavigationDecision.prevent;
            }
           if (request.url.contains('cancel')) {
              Navigator.of(context).pop(false); 
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );

     if (widget.url.isNotEmpty && widget.url.startsWith('http')) {
      _controller.loadRequest(Uri.parse(widget.url));
    } else {
      debugPrint("Invalid or Empty URL provided to PaymentScreen");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stripe Payment'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(false),
        ),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          
           if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}