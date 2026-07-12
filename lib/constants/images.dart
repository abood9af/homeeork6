import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

  imageUrl(String url) {
    return CachedNetworkImage(
      imageUrl: url,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) => Icon(Icons.image_not_supported),
      height: 50,
      width: 50,
      
    );
  }