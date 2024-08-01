import 'package:fusion_warehouses/pages/product_details/data/product_details_repository.dart';
import 'package:fusion_warehouses/pages/product_details/models/bc_product_details_model.dart';
import 'package:fusion_warehouses/pages/product_details/models/sh_product_details_model.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:get/get.dart';

class ShProductDetailsController extends SuperController<bool> {
  ShProductDetailsController({required this.productDetailsRepository});

  final IProductDetailsRepository productDetailsRepository;
  var args;
  SHProductDetailsModel? productDetailsModel;

  @override
  void onInit() async {
    args= Get.rootDelegate.arguments();
    productDetailsModel = args[0]['product'];
    change(true, status: RxStatus.success());
    super.onInit();
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
}
