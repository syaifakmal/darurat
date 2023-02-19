import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BuildShimmer extends StatelessWidget {
  final Widget? child;
  final double? height;
  final double? width;
  final double? borderRadius;

  const BuildShimmer({
    Key? key,
    this.child,
    this.height = 18,
    this.width = 80,
    this.borderRadius = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: Duration(seconds: 1),
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade50,
      enabled: true,
      child: child ??
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius!),
              ),
              color: Colors.white,
            ),
            height: height,
            width: width,
          ),
    );
  }
}
