

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 50,
      itemBuilder: (context, index) {
      return Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 25,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20)
            ),
          ),
        ),
      );
    },);
  }
}