
import 'package:fusion_warehouses/pages/home/data/home_api_provider.dart';
import 'package:fusion_warehouses/pages/home/data/home_repository.dart';
import 'package:fusion_warehouses/pages/home/presentation/controllers/home_controller.dart';
import 'package:fusion_warehouses/pages/notifications/data/notifications_api_provider.dart';
import 'package:fusion_warehouses/pages/notifications/data/notifications_repository.dart';
import 'package:fusion_warehouses/pages/notifications/presentation/controllers/notifications_controller.dart';
import 'package:fusion_warehouses/pages/product_details/data/product_details_api_provider.dart';
import 'package:fusion_warehouses/pages/product_details/data/product_details_repository.dart';
import 'package:fusion_warehouses/pages/profile/data/profile_api_provider.dart';
import 'package:fusion_warehouses/pages/profile/data/profile_repository.dart';
import 'package:fusion_warehouses/pages/profile/presentation/controllers/profile_controller.dart';
import 'package:get/get.dart';


class NavigationBinding extends Bindings {
  @override
  void dependencies() {

    Get.put<IProfileProvider>(ProfileProvider());
    Get.put<IProfileRepository>(ProfileRepository(provider: Get.find()));
    Get.put(ProfileController(profileRepository: Get.find()));
    Get.put<IProductDetailsProvider>(ProductDetailsProvider());
    Get.put<IProductDetailsRepository>(ProductDetailsRepository(provider: Get.find()));

    Get.put<IHomeProvider>(HomeProvider());
    Get.put<IHomeRepository>(HomeRepository(provider: Get.find()));
    Get.put(HomeController(homeRepository: Get.find(), productDetailsRepository: Get.find()));

    Get.put<INotificationsProvider>(NotificationsProvider());
    Get.put<INotificationsRepository>(NotificationsRepository(provider: Get.find()));
    Get.put(NotificationsController(notificationsRepository: Get.find()));
    // Get.put(MainController());
    //
    // Get.put<IHomeProvider>(HomeProvider());
    // Get.put<IHomeRepository>(HomeRepository(provider: Get.find()));
    // Get.put(HomeController(homeRepository: Get.find()));
    //
    // Get.put<INotificationsProvider>(NotificationsProvider());
    // Get.put<INotificationsRepository>(NotificationsRepository(provider: Get.find()));
    // Get.put(NotificationsController(notificationsRepository: Get.find()));
    //
    // Get.put<IProfileProvider>(ProfileProvider());
    // Get.put<IProfileRepository>(ProfileRepository(provider: Get.find()));
    // Get.put(ProfileController(profileRepository: Get.find()));
    //
    // Get.put<IMyOrdersProvider>(MyOrdersProvider());
    // Get.put<IMyOrdersRepository>(MyOrdersRepository(provider: Get.find()));
    // Get.put(MyOrdersController(myOrdersRepository: Get.find()));
  }
}
