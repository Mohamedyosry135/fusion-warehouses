
import 'package:get/get.dart';

import '../data/shipping_details_api_provider.dart';
import '../data/shipping_details_repository.dart';
import '../presentation/controllers/shipping_details_controller.dart';
class ShippingDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IShippingDetailsProvider>(ShippingDetailsProvider());
    Get.put<IShippingDetailsRepository>(ShippingDetailsRepository(provider: Get.find()));
    Get.put(ShippingDetailsController(shippingDetailsRepository: Get.find()));
  }
}
