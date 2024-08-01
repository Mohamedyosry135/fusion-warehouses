
import 'package:get/get.dart';

import '../data/invoices_provider.dart';
import '../data/invoices_repository.dart';
import '../presentation/controllers/invoices_controller.dart';
class InvoicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<InvoicesProvider>(InvoicesProvider());
    Get.put<InvoicesRepository>(InvoicesRepository(provider: Get.find()));
    Get.put(InvoicesController(invoicesRepository: Get.find()));
  }
}
