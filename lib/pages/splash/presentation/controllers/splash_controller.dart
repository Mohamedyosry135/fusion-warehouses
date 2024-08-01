import 'package:fusion_warehouses/pages/splash/data/splash_repository.dart';
import 'package:fusion_warehouses/routes/app_pages.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SplashController extends SuperController<dynamic> {
  SplashController({required this.splashRepository});

  final ISplashRepository splashRepository;
  @override
  void onInit() async {
    super.onInit();

    SystemChannels.textInput.invokeMethod('TextInput.hide');
    Future.delayed(const Duration(seconds: 3)).then((value) {
      final isLoggedIn = AuthService.to.isLoggedIn.value;
      final isSelectedLanguage = AuthService.to.isSelectedLanguage.value;
      if (isLoggedIn) {
        print(AuthService.to.userInfo?.data?.authToken ??"");
        Get.rootDelegate.offNamed(Routes.BOTTOM_NAVIGATION_SCREEN);
        print("LOL");
      } else {
        print("to login");
        Get.rootDelegate.offNamed(Routes.LOGIN);
      }
    });
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }
}
