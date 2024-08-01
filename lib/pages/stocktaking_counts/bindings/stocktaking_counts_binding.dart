import 'package:fusion_warehouses/pages/stocktaking/data/stocktaking_api_provider.dart';
import 'package:fusion_warehouses/pages/stocktaking/data/stocktaking_repository.dart';
import 'package:fusion_warehouses/pages/stocktaking/presentation/controllers/Stocktaking_controller.dart';
import 'package:fusion_warehouses/pages/stocktaking_counts/data/stocktaking_counts_api_provider.dart';
import 'package:fusion_warehouses/pages/stocktaking_counts/data/stocktaking_counts_repository.dart';
import 'package:fusion_warehouses/pages/stocktaking_counts/presentation/controllers/stocktaking_counts_controller.dart';
import 'package:get/get.dart';


class StocktakingCountsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IStocktakingCountsProvider>(StocktakingCountsProvider());
    Get.put<IStocktakingCountsRepository>(StocktakingCountsRepository(provider: Get.find()));
    Get.put(StocktakingCountsController(stocktakingCountsRepository: Get.find()));
  }
}
