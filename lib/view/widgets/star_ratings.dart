

import 'package:flutter/material.dart';
import 'package:apc_pro/generated/assets.dart';



class StarRating extends StatelessWidget {
  final double rating;
  final int starCount;
  final double? size;
final Color? color;
final String? image;
  StarRating({required this.rating, this.starCount = 5, this.size = 15.0, this.color, this.image});

  @override
  Widget build(BuildContext context) {
    int fullStars = rating.floor();
    double remainingRating = rating - fullStars;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount, (index) {
        if (index < fullStars) {
          // Full star
          return Padding(
            padding: const EdgeInsets.only(top:3.0,bottom: 6,right: 5),
            child: Image.asset(
          image?? Assets.imagesStar2,
              fit: BoxFit.contain,
              width: size,
              height: size,
            ),
          );
        } else if (index == fullStars && remainingRating > 0) {
          // Partial star
          return Padding(
          padding: const EdgeInsets.only(top:3.0,bottom: 6,right:5),
            child: Image.asset(
          image?? Assets.imagesStar2,
              height: size,
              width: size,
              color: color??null,
            ),
          );
        } else {
          // Empty star
          return Padding(
            padding: const EdgeInsets.only(top:3.0,bottom: 6,right: 5),
            child: Image.asset(
          image?? Assets.imagesStar2,
              height: size,
              width: size,
              color: color??null,
            ),
          );
        }
      }),
    );
  }
}
