import 'package:flutter/material.dart';
import 'package:musmeramedya/core/extension/context_extension.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerWidget extends StatelessWidget {

  final double width;
  final double heigth;
  final ShapeBorder shapeBorder;

  ShimmerWidget.rectangular({
   this.width = double.infinity,
    required this.heigth,
}):this.shapeBorder =  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));

  const ShimmerWidget.circular({
    required this.width,
    required this.heigth,
    this.shapeBorder = const CircleBorder()
  });



  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
    baseColor: context.theme.colorScheme.primary,
    highlightColor: context.theme.colorScheme.secondary,
    child: Container(
      width: width,
      height: heigth,
      //height: 50,
      decoration:  ShapeDecoration(color:context.theme.colorScheme.primary,shape: shapeBorder)),
  );
}
