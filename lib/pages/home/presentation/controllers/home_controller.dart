import 'package:fusion_warehouses/pages/home/data/home_repository.dart';
import 'package:fusion_warehouses/pages/product_details/data/product_details_repository.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/routes/app_pages.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:get/get.dart';

class HomeController extends SuperController<bool> {
  HomeController(
      {required this.homeRepository, required this.productDetailsRepository});

  final IHomeRepository homeRepository;
  final IProductDetailsRepository productDetailsRepository;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    change(null, status: RxStatus.success());
  }

  getProductDetails(String code) {
    change(false, status: RxStatus.loading());
    if(code.contains("bc")){
      print("bc-dsh");
      productDetailsRepository.getProductDetails(code.trim()).then((value) {
        print("20valueproductDetailsRepository ${value}");
        if (value.data?.items?.isNotEmpty ?? false) {
          print("21");

          Get.rootDelegate.toNamed(Routes.PRODUCT_DETAILS, arguments: [
            {"product": value}
          ]);
        } else if (value.data?.items?.isEmpty ?? false) {
          Get.snackbar("", AppStrings.noProductFound);
        }

        change(true, status: RxStatus.success());
      }).onError((error, stackTrace) {
        print(error.toString());
        Get.snackbar("", error.toString());
        change(true, status: RxStatus.success());
      });
    }else{
      print('sh');
      productDetailsRepository.getSHProductDetails(code.trim()).then((value) {
        print("20valueproductDetailsRepository ${value}");
        if (value.data?.items?.isNotEmpty ?? false) {
          print("21");

          Get.rootDelegate.toNamed(Routes.SH_PRODUCT_VIEW, arguments: [
            {"product": value}
          ]);
        } else if (value.data?.items?.isEmpty ?? false) {
          Get.snackbar("", AppStrings.noProductFound);
        }

        change(true, status: RxStatus.success());
      }).onError((error, stackTrace) {
        print(error.toString());
        Get.snackbar("", error.toString());
        change(true, status: RxStatus.success());
      });
    }

  }

  bool permissionUser(List<String> roles) {
    bool refuse = false;
    AuthService.to.userInfo?.data?.user?.roles?.forEach((element) {
      String roleArr = element.key!;
      roles.forEach((role) {
            if(roleArr.contains(role)){
              refuse = true;
              return;
            }
      });
      if(refuse){
        return;
      }
    });
    return refuse;
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
