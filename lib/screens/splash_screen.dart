import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trainings_app/routes/app_routes.dart';
import 'package:sizer/sizer.dart';

import '../constants/asset_constants.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    navigateToScreen();
    super.initState();
  }

  ///
  ///  decide navigation
  navigateToScreen() async {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Get.offAllNamed(AppRoutes.homeScreen);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  AssetConstant.appLogo,
                  width: 45.w,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
