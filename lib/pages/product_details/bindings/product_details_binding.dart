import 'package:fusion_warehouses/pages/product_details/presentation/controllers/sh_product_details_controller.dart';
import 'package:get/get.dart';
import '../data/product_details_api_provider.dart';

import '../data/product_details_repository.dart';
import '../presentation/controllers/bc_product_details_controller.dart';

class ProductDetailsBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put<IProductDetailsProvider>(ProductDetailsProvider());
    // Get.put<IProductDetailsRepository>(ProductDetailsRepository(provider: Get.find()));
    Get.lazyPut(()=>ProductDetailsController(productDetailsRepository: Get.find()));

    Get.lazyPut(()=>ShProductDetailsController(productDetailsRepository: Get.find()));
  }
}
