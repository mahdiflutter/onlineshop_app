import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  String? imageUrl;
  double? radius;
  CachedImage({
    super.key,
    required this.imageUrl,
    this.radius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(radius!),
      ),
      child: CachedNetworkImage(
      
        errorWidget: (context, url, error) => Container(
          color: Colors.red[200],
        ),
        fit: BoxFit.cover,
        imageUrl: imageUrl!,
      ),
    );
  }
}
