import 'package:flutter/material.dart';
import 'package:fusion_warehouses/pages/stocktaking/data/stocktaking_repository.dart';
import 'package:fusion_warehouses/pages/stocktaking/models/stocktaking_model.dart';
import 'package:fusion_warehouses/pages/stocktaking_counts/data/stocktaking_counts_repository.dart';
import 'package:fusion_warehouses/pages/stocktaking_counts/models/updated_product_model.dart';
import 'package:fusion_warehouses/pages/stocktaking_counts/models/warehouses_model.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/models/product_of_stock_model.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/presentation/controllers/Stocktaking_details_controller.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StocktakingCountsController extends SuperController<dynamic> {
  StocktakingCountsController({required this.stocktakingCountsRepository});

  final IStocktakingCountsRepository stocktakingCountsRepository;

  StocktakingDetailsController stocktakingDetailsController = Get.find();
  WarehousesModel? warehouses;
  int? id;
  ProductsInStocks? productsInStocks;
  int? index;
  TextEditingController amountController = TextEditingController();
  TextEditingController storagePlaceController = TextEditingController();

  TextEditingController actualAmountController = TextEditingController();

  UpdatedProductModel? updatedProductModel;
  String? statusStock;
  @override
  void onInit() {
    var args = Get.rootDelegate.arguments();
    id = args[0]['id'];
    index = args[1]['index'];
    statusStock = args[2]['status'];
    print("index ${index}");

    productsInStocks = stocktakingDetailsController.productsOfStock?.data?.items?[index!];
    print(productsInStocks?.name ??"");
    print("productsInStocks?.name ${productsInStocks?.id ??""}");

    getWarehouses();
    super.onInit();
  }

  getWarehouses() {
      change(false, status: RxStatus.loading());
    stocktakingCountsRepository.getWarehouses().then((value) {
        warehouses = value;
      change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      Get.back();
      Get.snackbar("", error.toString());
      change(true, status: RxStatus.success());
    });
  }

  updateProduct(int physicalInventoryId, int warehouseId,String storageName, int amount, int idProduct, int? slotId){
    print("index ${index}");
    change(false, status: RxStatus.loading());
    stocktakingCountsRepository.updateProduct(physicalInventoryId, warehouseId, storageName, amount, idProduct, slotId).then((value)async {
      updatedProductModel = value;
      await stocktakingDetailsController.stocktakingDetailsRepository.getProductsOfStock(id!, 1, index!+1,stocktakingDetailsController.barCodeSearch, stocktakingDetailsController.categoryFilterId,stocktakingDetailsController.supportTicketTypeId,stocktakingDetailsController.availableFilter,stocktakingDetailsController.barndId).then((value){
        print("index ${index}");

        productsInStocks = value.data?.items?[index!];
      }
      );
      amountController.text ="";
      storagePlaceController.text = "";
      change(true, status: RxStatus.success());

    }).onError((error, stackTrace) {
      Get.back();
      Get.snackbar("", error.toString());
      change(true, status: RxStatus.success());
    });
  }


  matchProduct(int readStock, int idProduct, int? slotId){
    print("index ${index}");
    change(false, status: RxStatus.loading());
    stocktakingCountsRepository.matchProduct(readStock, idProduct, slotId).then((value)async {
      updatedProductModel = value;
      await stocktakingDetailsController.stocktakingDetailsRepository.getProductsOfStock(id!, 1, index!+1,stocktakingDetailsController.barCodeSearch, stocktakingDetailsController.categoryFilterId,stocktakingDetailsController.supportTicketTypeId,stocktakingDetailsController.availableFilter,stocktakingDetailsController.barndId).then((value){
        print("index ${index}");

        productsInStocks = value.data?.items?[index!];
      }
      );
      amountController.text ="";
      storagePlaceController.text = "";
      change(true, status: RxStatus.success());

    }).onError((error, stackTrace) {
      Get.back();
      Get.snackbar("", error.toString());
      change(true, status: RxStatus.success());
    });
  }

  countedAmountBefore(int id){
    if(productsInStocks?.productPhysicalInventories!=null ||(productsInStocks?.productPhysicalInventories?.isNotEmpty ??false)){
      for(int i = 0; i < productsInStocks!.productPhysicalInventories!.length; i++){
        if(id == productsInStocks!.productPhysicalInventories![i].id){
          return i;
        }
      }

    }
    return -1;
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
  @override
  void onClose() {
    // TODO: implement onClose
    stocktakingDetailsController.onInit();
    super.onClose();
  }
}
