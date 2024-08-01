import 'package:get/get.dart';

import '../data/daily_shipping_api_provider.dart';
import '../data/daily_shipping_repository.dart';
import '../presentation/controllers/daily_shipping_controller.dart';

class DailyShippingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IDailyShippingProvider>(DailyShippingProvider());
    Get.put<IDailyShippingRepository>(
        DailyShippingRepository(provider: Get.find()));
    Get.put(DailyShippingController(dailyShippingRepository: Get.find()));
  }
}
