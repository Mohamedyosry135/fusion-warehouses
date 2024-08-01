import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/pages/profile/presentation/controllers/profile_controller.dart';
import 'package:fusion_warehouses/resources/assets_generated.dart';
import 'package:get/get.dart';

class PhotoWidget extends GetView<ProfileController> {
  const PhotoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(height: 140.h, width: Get.width),
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: Get.width,
              height: 100,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AppAssets.blackRect,
                fit: BoxFit.fill,
              )),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image(
                  width: Get.width * .6,
                  image: AppAssets.yellowRect,
                  fit: BoxFit.fill,
                ),
              ),
            )),
        Positioned(
          bottom: 0,
          top: 50.h,
          left: 120.w,
          right: 120.w,
          child: Container(
            padding: EdgeInsets.all(4),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: const BoxDecoration(
              color: Color(ColorCode.yellow),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 75,
              backgroundColor: Color(ColorCode.yellow),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  controller.profileData.value.data?.imageUrl ?? "",
                  fit: BoxFit.fill,
                  loadingBuilder: (context, child, loadingProgress) =>
                      (loadingProgress == null)
                          ? child
                          : const CircularProgressIndicator(),
                  errorBuilder: (context, error, stackTrace) => const Image(
                    image: AppAssets.logoInCircle,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
