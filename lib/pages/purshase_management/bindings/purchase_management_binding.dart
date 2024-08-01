import 'package:get/get.dart';

import '../data/purchase_management_api_provider.dart';
import '../data/purchase_management_repository.dart';
import '../presentation/controllers/purchase_management_controller.dart';

class PurchaseManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IPurchaseManagementProvider>(PurchaseManagementProvider());
    Get.put<IPurchaseManagementRepository>(
        PurchaseManagementRepository(provider: Get.find()));
    Get.put(PurchaseManagementController(purchaseManagementRepository: Get.find()));
  }
}
