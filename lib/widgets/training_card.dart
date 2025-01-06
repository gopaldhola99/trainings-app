import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../constants/color_constants.dart';
import '../models/training_model.dart';
import '../controllers/home_controller.dart';

Widget trainingCardWidget(TrainingModel training) {
  final HomeController controller = Get.find();
  return Card(
    margin: EdgeInsets.only(bottom: 2.h),
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    ),
    child: Padding(
      padding: EdgeInsets.all(3.w),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    training.date,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    training.time,
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    training.location,
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ],
              ),
            ),
            const VerticalDivider(),
            Flexible(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (training.isFillingFast)
                        _buildBadge('Filling Fast', ColorConstants.redColor),
                      if (training.isEarlyBird)
                        _buildBadge('Early Bird', Colors.green),
                    ],
                  ),
                  Text(
                    training.title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 0.5.h),
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
                      SizedBox(width: 12.sp),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Keynote Speaker',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            training.trainerName,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => controller.openTrainingDetails(training),
                      child: Container(
                        color: ColorConstants.redColor,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 14.sp, vertical: 10.sp),
                          child: Text(
                            'Enroll Now',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                                color: ColorConstants.whiteColor),
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
    ),
  );
}

Widget _buildBadge(String label, Color color) {
  return Text(
    label,
    style:
        TextStyle(color: color, fontSize: 13.sp, fontWeight: FontWeight.bold),
  );
}
