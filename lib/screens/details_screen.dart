import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../constants/color_constants.dart';
import '../models/training_model.dart';

class TrainingDetailsScreen extends StatelessWidget {
  TrainingDetailsScreen({super.key});
  final TrainingModel training = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightGreyColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.redColor,
        title: Text(
          training.title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: ColorConstants.whiteColor,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 18.sp,
            color: ColorConstants.whiteColor,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 30.h,
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(bottom: Radius.circular(0)),
                    child: CachedNetworkImage(
                      imageUrl: training.image,
                      width: 100.w,
                      height: 25.h,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const Center(child: CupertinoActivityIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 2.h,
                  left: 4.w,
                  child: Container(
                    padding: EdgeInsets.all(4.sp),
                    color: Colors.black54,
                    child: Text(
                      training.date,
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: ColorConstants.whiteColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    training.title,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              color: ColorConstants.redColor),
                          SizedBox(width: 2.w),
                          Text(
                            training.location,
                            style: TextStyle(fontSize: 12.sp),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.access_time,
                              color: ColorConstants.redColor),
                          SizedBox(width: 2.w),
                          Text(
                            training.time,
                            style: TextStyle(fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CachedNetworkImage(
                          imageUrl: training.trainerProfile,
                          height: 5.h,
                          width: 5.h,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const Center(child: CupertinoActivityIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Trainer',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            training.trainerName,
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  const Divider(),
                  Text(
                    'About the Training',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    'This training session provides in-depth knowledge and hands-on experience on various aspects of ${training.title}. It is designed to enhance your skills and offer valuable insights from our expert trainer.',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  SizedBox(height: 2.h),
                  const Divider(),
                  Text(
                    'Price Details',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Original Price:',
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      Text(
                        training.price,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: ColorConstants.greyColor,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discounted Price:',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${int.parse(training.price.replaceAll("\$", "")) * 0.8}',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 3.h),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        // Enroll Action
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorConstants.redColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 2.h,
                        ),
                        child: Text(
                          'Enroll Now',
                          style: TextStyle(
                            color: ColorConstants.whiteColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
