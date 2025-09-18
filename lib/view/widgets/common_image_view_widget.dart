import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:apc_pro/consts/app_colors.dart';







class CommonImageView extends StatelessWidget {
// ignore_for_file: must_be_immutable
  String? url;
  String? imagePath;
  String? svgPath;
  File? file;
  double? height;
  double? width;
  double? radius;
  final BoxFit fit;
  final String placeHolder;

  CommonImageView({
    this.url,
    this.imagePath,
    this.svgPath,
    this.file,
    this.height,
    this.width,
    this.radius = 0.0,
    this.fit = BoxFit.cover,
    this.placeHolder = 'assets/images/no_image_found.png',
  });

  @override
  Widget build(BuildContext context) {
    return _buildImageView();
  }

  Widget _buildImageView() {
    if (svgPath != null && svgPath!.isNotEmpty) {
      return Container(
        height: height,
        width: width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius!),
          child: SvgPicture.asset(
            svgPath!,
            height: height,
            width: width,
            fit: fit,
          ),
        ),
      );
    } else if (file != null && file!.path.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(radius!),
        child: Image.file(
          file!,
          height: height,
          width: width,
          fit: fit,
        ),
      );
    } else if (url != null && url!.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(radius!),
        child: CachedNetworkImage(
          height: height,
          width: width,
          fit: fit,
          imageUrl: url!,
          placeholder: (context, url) => Container(
            height: 23,
            width: 23,
            child: Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color:ksecondary,
                  backgroundColor: Colors.grey.shade100,
                ),
              ),
            ),
          ),
          errorWidget: (context, url, error) => Image.asset(
            placeHolder,
            height: height,
            width: width,
            fit: fit,
          ),
        ),
      );
    } else if (imagePath != null && imagePath!.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(radius!),
        child: Image.asset(
          imagePath!,
          height: height,
          width: width,
          fit: fit,
        ),
      );
    }
    return SizedBox();
  }
}


//

// class bordered_common_image_view extends StatelessWidget {
//   final String? url;
//   final double? width,height,borderWidth;
//   final Color? borderColor;
//   const bordered_common_image_view({
//     super.key, this.url, this.width, this.height, this.borderColor, this.borderWidth,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           border: Border.all(color:borderColor?? ktertiary,width: borderWidth??1)),
//       child: CommonImageView(
//         url:url?? dummyImage2,
//         width:width?? 108,
//         height:height?? 108,
//         radius: 100,
//       ),
//     );
//   }
// }


// //
// class gradient_border_commonImage extends StatelessWidget {

//   const gradient_border_commonImage({
//     super.key,
//     required this.image, this.width, this.height, this.borderWidth,
//   });
//   final double? width,height,borderWidth;
//   final String? image;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             border: GradientBoxBorder(
//                 gradient: kbordergrad, width:borderWidth?? 2)),
//         child: CommonImageView(
//           url:image?? dummyImage2,
//           width:width?? 60,
//           height:height?? 60,
//           radius: 100,
//         ));
//   }
// }
