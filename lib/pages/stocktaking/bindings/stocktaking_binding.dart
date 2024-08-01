import 'package:fusion_warehouses/pages/stocktaking/data/stocktaking_api_provider.dart';
import 'package:fusion_warehouses/pages/stocktaking/data/stocktaking_repository.dart';
import 'package:fusion_warehouses/pages/stocktaking/presentation/controllers/Stocktaking_controller.dart';
import 'package:get/get.dart';


class StocktakingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IStocktakingProvider>(StocktakingProvider());
    Get.put<IStocktakingRepository>(StocktakingRepository(provider: Get.find()));
    Get.put(StocktakingController(stocktakingRepository: Get.find()));
  }
}
