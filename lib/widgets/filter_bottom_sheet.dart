import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constants/color_constants.dart';
import '../controllers/home_controller.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  final HomeController controller = Get.find();

  int selectedTab = 0; // To track active tab
  String searchText = ''; // To filter items dynamically

  @override
  Widget build(BuildContext context) {
    // Extract unique values for filters dynamically from training data
    final locations = controller.trainings
        .map((training) => training.location)
        .toSet()
        .toList();
    final trainingNames =
        controller.trainings.map((training) => training.title).toSet().toList();
    final trainers = controller.trainings
        .map((training) => training.trainerName)
        .toSet()
        .toList();
    return Container(
      height: 70.h,
      decoration: const BoxDecoration(
        color: ColorConstants.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Close and Title Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sort and Filters',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(Icons.close, size: 18.sp),
                ),
              ],
            ),
          ),
          const Divider(height: 0),

          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 3,
                  child: Container(
                    color: ColorConstants.veryLightGreyColor,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTab('Sort by', 0),
                        _buildTab('Location', 1),
                        _buildTab('Training Name', 2),
                        _buildTab('Trainer', 3),
                        SizedBox(height: 2.h),
                        TextButton(
                            onPressed: () {
                              controller.selectedLocation.value = '';
                              controller.selectedTrainerName.value = '';
                              controller.selectedTrainingName.value = '';
                              controller.applyFilters();
                              Get.back();
                            },
                            child: const Text("Clear Filter"))
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Column(
                    children: [
                      Visibility(
                        visible: selectedTab != 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 3.w),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: ColorConstants.greyColor),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.sp),
                              child: Row(
                                children: [
                                  Icon(Icons.search,
                                      size: 18.sp,
                                      color: ColorConstants.greyColor),
                                  SizedBox(width: 3.w),
                                  Flexible(
                                    child: TextField(
                                      onChanged: (value) {
                                        setState(() {
                                          searchText = value.toLowerCase();
                                        });
                                      },
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText: 'Search',
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                            fontSize: 16.sp,
                                            color: ColorConstants.greyColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      selectedTab == 0
                          ? Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 15.h),
                                Center(
                                  child: Text(
                                    'Sort functionality goes here. \n(Currently not implemented)',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: ColorConstants.greyColor),
                                  ),
                                ),
                              ],
                            )
                          : _buildFilterList(
                              selectedTab == 1
                                  ? locations
                                  : selectedTab == 2
                                      ? trainers
                                      : trainingNames,
                              selectedTab == 1
                                  ? controller.selectedLocation.value
                                  : selectedTab == 2
                                      ? controller.selectedTrainerName.value
                                      : controller.selectedTrainingName.value,
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Build Tab Widget
  Widget _buildTab(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = index;
        });
      },
      child: Container(
        width: 100.w,
        decoration: BoxDecoration(
          color: selectedTab == index ? ColorConstants.whiteColor : null,
          border: selectedTab == index
              ? const Border(
                  left: BorderSide(color: ColorConstants.redColor, width: 5),
                )
              : null,
        ),
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight:
                  selectedTab == index ? FontWeight.bold : FontWeight.normal,
              color: selectedTab == index
                  ? ColorConstants.blackColor
                  : ColorConstants.greyColor,
            ),
          ),
        ),
      ),
    );
  }

  // Build Filter List (Dynamic Items)
  Widget _buildFilterList(List<String> items, String selectedValue) {
    final filteredItems =
        items.where((item) => item.toLowerCase().contains(searchText)).toList();

    return Expanded(
      child: ListView.builder(
        itemCount: filteredItems.length,
        itemBuilder: (context, index) {
          final item = filteredItems[index];
          return CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            value: selectedValue == item,
            activeColor: ColorConstants.redColor,
            onChanged: (bool? value) {
              setState(() {
                if (selectedTab == 1) {
                  controller.selectedLocation.value = item;
                } else if (selectedTab == 2) {
                  controller.selectedTrainerName.value = item;
                } else {
                  controller.selectedTrainingName.value = item;
                }
              });

              controller.applyFilters();
            },
            title: Text(item, style: TextStyle(fontSize: 14.sp)),
          );
        },
      ),
    );
  }
}
