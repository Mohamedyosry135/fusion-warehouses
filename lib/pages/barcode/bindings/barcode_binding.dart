
import 'package:get/get.dart';

import '../data/barcode_provider.dart';
import '../data/barcode_repository.dart';
import '../presentation/controllers/barcode_controller.dart';
class BarCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BarcodeProvider>(BarcodeProvider());
    Get.put<BarcodeRepository>(BarcodeRepository(provider: Get.find()));
    Get.put(BarcodeController(barcodeRepository: Get.find()));
  }
}
