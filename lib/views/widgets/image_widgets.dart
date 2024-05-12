import 'package:flutter/material.dart';

import '../../constants.dart';

class FittedImage extends StatelessWidget {
  final double? height;
  final double? width;
  final String path;

  const FittedImage({
    super.key,
    this.height,
    this.width,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Image.asset('$kAssetsImages$path'),
      ),
    );
  }
}