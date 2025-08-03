import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    Key? key,
    this.imageUrl,
    this.height,
    this.width,
    this.boxFit = BoxFit.cover,
    this.borderRadius = 12,
  }) : super(key: key);

  final String? imageUrl;
  final double? height;
  final double? width;
  final BoxFit boxFit;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        height: height ?? size.height * 0.3,
        width: width ?? size.width * 0.4,
        fit: boxFit,
        imageUrl: imageUrl ?? "https://i.ibb.co/FwTPCCc/Ultra-Linx.jpg",
        placeholder: (context, url) => Container(
          color: Colors.grey[300],
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
