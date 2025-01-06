import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../constants/color_constants.dart';
import '../models/training_model.dart';

Widget highlightCardWidget(TrainingModel training) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: CachedNetworkImage(
            imageUrl: training.image,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      ColorConstants.blackColor.withOpacity(0.5),
                      BlendMode.darken),
                ),
              ),
            ),
            placeholder: (context, url) =>
                const Center(child: CupertinoActivityIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Positioned(
          bottom: 2.h,
          left: 4.w,
          right: 4.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                training.title,
                style: TextStyle(
                  color: ColorConstants.whiteColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${training.location}, ${training.date}',
                style: TextStyle(
                  color: ColorConstants.whiteColor,
                  fontSize: 10.sp,
                ),
              ),
              SizedBox(height: 1.h),
              Row(
                children: [
                  Text(
                    training.price,
                    style: TextStyle(
                      color: ColorConstants.redColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  SizedBox(width: 8.sp),
                  Text(
                    '\$${int.parse(training.price.replaceAll("\$", "")) * 0.8}',
                    style: TextStyle(
                      color: ColorConstants.redColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'View Details',
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 12.sp,
                      color: Colors.white60,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
