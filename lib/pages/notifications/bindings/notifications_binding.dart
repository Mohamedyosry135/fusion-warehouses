
import 'package:fusion_warehouses/pages/notifications/data/notifications_api_provider.dart';
import 'package:fusion_warehouses/pages/notifications/data/notifications_repository.dart';
import 'package:fusion_warehouses/pages/notifications/presentation/controllers/notifications_controller.dart';

import 'package:get/get.dart';


class NotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<INotificationsProvider>(NotificationsProvider());
    Get.put<INotificationsRepository>(NotificationsRepository(provider: Get.find()));
    Get.put(NotificationsController(notificationsRepository: Get.find()));

  }
}
