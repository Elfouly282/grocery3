import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage( {
    super.key,
    required this.imageUrl,
    this.scaleValue,
  });

  final String imageUrl;
  final double? scaleValue;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),

      child: CachedNetworkImage(
        imageUrl: imageUrl,
        scale: 1,

        placeholder:
            (context, url) => Skeletonizer(
              enabled: true,
              child: Container(
                color: Colors.grey,
                width: width * 22,
                height: height * 7,
              ),
            ),

        errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
        fit: BoxFit.cover,
      ),
    );
    // return Image.network(imageUrl);
  }
}
