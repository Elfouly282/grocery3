import 'package:flutter/material.dart';
import 'cached_image_widget.dart';

class ZoomableImageViewer extends StatelessWidget {
  final String imageUrl;

  const ZoomableImageViewer({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.transparent, iconTheme: const IconThemeData(color: Colors.white)),
      body: Center(
        child: InteractiveViewer(
          clipBehavior: Clip.none,
          minScale: 1.0,
          maxScale: 4.0,
          child: CachedImageWidget(imageUrl: imageUrl, fit: BoxFit.contain),
        ),
      ),
    );
  }
}