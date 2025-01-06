import 'package:get/get.dart';
import 'package:my_trainings_app/screens/home_screen.dart';
import 'package:my_trainings_app/screens/details_screen.dart';

import '../screens/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.splashScreen;

  static final routes = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SpalshScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => HomeScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.trainingDetailScreen,
      page: () => TrainingDetailsScreen(),
      transition: Transition.cupertino,
    ),
  ];
}
