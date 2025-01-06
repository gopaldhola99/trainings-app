import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../constants/color_constants.dart';
import '../controllers/home_controller.dart';
import '../widgets/highlight_card.dart';
import '../widgets/training_card.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.darkGreyColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 100.h,
                child: Column(
                  children: [
                    Container(
                      height: 30.h,
                      color: ColorConstants.redColor,
                    ),
                    Container(
                      height: 18.h,
                      color: ColorConstants.whiteColor,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Obx(() {
                          return controller.filteredTrainings.isEmpty
                              ? const Center(child: Text('No Data'))
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      controller.filteredTrainings.length,
                                  itemBuilder: (context, index) {
                                    final training =
                                        controller.filteredTrainings[index];
                                    return trainingCardWidget(training);
                                  },
                                );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 3.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Trainings',
                            style: TextStyle(
                                fontSize: 22.sp,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold,
                                color: ColorConstants.whiteColor),
                          ),
                          const Icon(
                            Icons.menu,
                            color: ColorConstants.whiteColor,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.sp, bottom: 4.sp),
                      child: Text(
                        'Highlights',
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorConstants.whiteColor),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.pageController!.page!.toInt() > 0
                              ? controller.pageController?.previousPage(
                                  duration: const Duration(microseconds: 1000),
                                  curve: Curves.bounceIn)
                              : null;
                        },
                        child: Container(
                            color: Colors.black26,
                            child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 16.sp),
                                child: const Icon(
                                  Icons.arrow_back_ios_new,
                                  color: ColorConstants.whiteColor,
                                ))),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 25.h,
                            child: PageView.builder(
                              controller: controller.pageController,
                              itemCount: controller.trainings.length,
                              itemBuilder: (context, index) {
                                final training = controller.trainings[index];
                                return GestureDetector(
                                    onTap: () => controller
                                        .openTrainingDetails(training),
                                    child: highlightCardWidget(training));
                              },
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            controller.pageController!.page!.toInt() <
                                    controller.trainings.length
                                ? controller.pageController?.nextPage(
                                    duration:
                                        const Duration(microseconds: 1000),
                                    curve: Curves.bounceIn)
                                : null;
                          },
                          child: Container(
                              color: Colors.black26,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 16.sp),
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: ColorConstants.whiteColor,
                                ),
                              ))),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.all(12),
                      child: Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.openFilterModal();
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color:
                                          controller.selectedLocation.isEmpty &&
                                                  controller.selectedTrainerName
                                                      .isEmpty &&
                                                  controller
                                                      .selectedTrainingName
                                                      .isEmpty
                                              ? Colors.transparent
                                              : ColorConstants.redColor,
                                      border: Border.all(
                                          color: ColorConstants.greyColor),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.tune, size: 16.sp),
                                        Text(
                                          'Filter',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                            Visibility(
                              visible: controller.selectedLocation.isNotEmpty ||
                                  controller.selectedTrainerName.isNotEmpty ||
                                  controller.selectedTrainingName.isNotEmpty,
                              child: TextButton(
                                  onPressed: () {
                                    controller.selectedLocation.value = '';
                                    controller.selectedTrainerName.value = '';
                                    controller.selectedTrainingName.value = '';
                                    controller.applyFilters();
                                    Get.back();
                                  },
                                  child: const Text("Clear Filter")),
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
