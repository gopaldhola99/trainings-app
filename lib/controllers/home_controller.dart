import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trainings_app/data/mock_data.dart';
import 'package:my_trainings_app/routes/app_routes.dart';
import '../models/training_model.dart';
import '../widgets/filter_bottom_sheet.dart';

class HomeController extends GetxController {
  final trainings = <TrainingModel>[].obs;
  PageController? pageController;

  final filteredTrainings = <TrainingModel>[].obs;

  var selectedLocation = ''.obs;
  var selectedTrainingName = ''.obs;
  var selectedTrainerName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(viewportFraction: 1, keepPage: true);
    loadMockTrainings();
    applyInitialFilters();
  }

  void loadMockTrainings() {
    trainings.value = mockTrainings;
  }

  void applyInitialFilters() {
    filteredTrainings.assignAll(trainings);
  }

  void openFilterModal() {
    Get.bottomSheet(const FilterBottomSheet());
  }

  void openTrainingDetails(TrainingModel training) {
    Get.toNamed(AppRoutes.trainingDetailScreen, arguments: training);
  }

  void applyFilters() {
    filteredTrainings.value = trainings.where((training) {
      final matchesLocation = selectedLocation.value.isEmpty ||
          training.location == selectedLocation.value;
      final matchesTrainingName = selectedTrainingName.value.isEmpty ||
          training.title == selectedTrainingName.value;
      final matchesTrainerName = selectedTrainerName.value.isEmpty ||
          training.trainerName == selectedTrainerName.value;

      return matchesLocation && matchesTrainingName && matchesTrainerName;
    }).toList();
  }
}
