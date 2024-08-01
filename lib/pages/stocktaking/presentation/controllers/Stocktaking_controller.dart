import 'package:flutter/material.dart';
import 'package:fusion_warehouses/pages/stocktaking/data/stocktaking_repository.dart';
import 'package:fusion_warehouses/pages/stocktaking/models/stocktaking_model.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StocktakingController extends SuperController<dynamic> {
  StocktakingController({required this.stocktakingRepository});

  final IStocktakingRepository stocktakingRepository;

  RxString statusFilter = AppStrings.all.obs;
  Map<String, String> statusList = {
    AppStrings.all: "",
    AppStrings.waitingStart: "pending",
    AppStrings.stocktakingProgress: "started",
    AppStrings.inConformity: "done",
    AppStrings.confirmingResult: "completed",
    AppStrings.inventoryEdited: "stock_updated"
  }; // ""
  List<String> listFilter = [AppStrings.all, AppStrings.waitingStart, AppStrings.stocktakingProgress,AppStrings.inConformity,AppStrings.confirmingResult,AppStrings.inventoryEdited];
  Map<String, String> valueStatus = {
    "":"",
     "pending":AppStrings.waitingStart,
    "started": AppStrings.stocktakingProgress,
    "done":AppStrings.inConformity,
    "completed":AppStrings.confirmingResult,
    "stock_updated":AppStrings.inventoryEdited
};
  int page = 1;

  StockItemsModel? stockItems;

  @override
  void onInit() {
    page = 1;
    statusFilter.value = AppStrings.all;


    getStockItems(page, statusList[statusFilter]!);
    super.onInit();
  }
  Rx<ScrollController> scrollController = ScrollController().obs;

  getStockItems(int page, String statusFilt) {
    if (page == 1) {
      change(false, status: RxStatus.loading());
    } else {
      change(false, status: RxStatus.loadingMore());
    }
    stocktakingRepository.getStockItems(page, statusFilt).then((value) {
      if (page == 1) {
        stockItems = value;
      } else {
        stockItems?.data?.items?.addAll(value.data?.items ?? []);
      }
      change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      Get.back();
      Get.snackbar("", error.toString());
      change(true, status: RxStatus.success());
    });
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }
}
