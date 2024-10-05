import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '/constant/colors.dart';

class CacheImage extends StatelessWidget {
  final String image;
  final double? height, width;
  const CacheImage({required this.image, this.height, this.width, super.key});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      cacheKey: image,
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: errorColor,
      ),
      imageUrl: image,
      imageBuilder: (context, image) => ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image(
          image: image,
          fit: BoxFit.contain,
        ),
      ),
      progressIndicatorBuilder: (context, url, progress) => Center(
        child: CircularProgressIndicator(
          value: progress.progress,
        ),
      ),
    );
  }
}
