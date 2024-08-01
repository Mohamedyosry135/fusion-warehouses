import 'package:fusion_warehouses/pages/stocktaking/data/stocktaking_api_provider.dart';
import 'package:fusion_warehouses/pages/stocktaking/data/stocktaking_repository.dart';
import 'package:fusion_warehouses/pages/stocktaking/presentation/controllers/Stocktaking_controller.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/data/stocktaking_details_api_provider.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/data/stocktaking_details_repository.dart';
import 'package:get/get.dart';

import '../presentation/controllers/Stocktaking_details_controller.dart';


class StocktakingDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IStocktakingDetailsProvider>(StocktakingDetailsProvider());
    Get.put<IStocktakingDetailsRepository>(StocktakingDetailsRepository(provider: Get.find()));
    Get.put(StocktakingDetailsController(stocktakingDetailsRepository: Get.find()));
  }
}
