import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/pages/splash/presentation/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fusion_warehouses/resources/assets_generated.dart';
import 'package:get/get.dart';


class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(ColorCode.gray),
      body: Container(
            width: Get.width,
          height: Get.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AppAssets.splash,
              fit: BoxFit.fill,
            )
          ),
      )
    );
  }
}
