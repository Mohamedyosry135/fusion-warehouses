import 'package:fusion_warehouses/pages/login/data/login_repository.dart';
import 'package:fusion_warehouses/pages/login/model/individual.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/routes/app_pages.dart';
import 'package:get/get.dart';


class LoginController extends SuperController<bool> {
  LoginController({required this.loginRepository});

  final ILoginRepository loginRepository;

  RxBool isHiddenPassword = true.obs;
  String phone = "", password = "";
  RxString codeCountry = '+966'.obs;
Rx<LoginResponeModel> loginRes = LoginResponeModel().obs;
  changeIsHiddenPassword() => isHiddenPassword.toggle();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    change(null, status: RxStatus.success());
  }

  onLoginClicked() {
    change(false, status: RxStatus.loading());
   var apiResp = loginRepository.login("${codeCountry.value}$phone", password).then((value) {
      final thenTo = Get.rootDelegate.currentConfiguration!.currentPage!.parameters?['then'];
      Get.rootDelegate.offNamed(thenTo ?? Routes.BOTTOM_NAVIGATION_SCREEN);
      change(true, status: RxStatus.success());
    }, onError: (err) {
      print( "ya mosahel ${err.toString()}");
      //use success status to display the login button again
      Get.snackbar("", err.toString());
      change(true, status: RxStatus.success());
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
