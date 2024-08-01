import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fusion_warehouses/pages/profile/models/profile_model.dart';
import 'package:fusion_warehouses/pages/warehouse_delivery/models/warehouses_orders_model.dart';
import 'package:fusion_warehouses/pages/warehouse_delivery/presentation/view/warehouse_delivery_view.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:get/get.dart';

import '../../data/warehouse_repository.dart';

class WarehousesController extends SuperController<bool> with GetTickerProviderStateMixin {
  final IWarehousesRepository warehousesRepository;
  WarehousesController({required this.warehousesRepository});


  late TabController tabController;

  int currentPage = 1;
  int previousPage = 1;

  Rx<ScrollController>scrollCurrentDeliveryWarehouses = ScrollController().obs;
  Rx<ScrollController> scrollPreviousDeliveryWarehouses = ScrollController().obs;

  WarehousesOrdersModel? currentWarehousesOrdersModel;
  WarehousesOrdersModel? previousWarehousesOrdersModel;
  @override
  void onInit() async{
    tabController =TabController(length: 2, vsync: this);
    await getWarehousesOrder(currentPage,"sell","pending");
    await getWarehousesOrder(previousPage,"sell","completed");
    super.onInit();
  }

  getWarehousesOrder(int page,String type, String status){
    if(page == 1){
      change(false,status: RxStatus.loading());
    }else{
      change(false,status: RxStatus.loadingMore());
    }
    warehousesRepository.getWarehousesOrder(page, type, status).then((value){
      if(page == 1){
        if(status == "pending"){
          currentWarehousesOrdersModel = value;
        }else{
          previousWarehousesOrdersModel = value;
        }
      }else{
        if(status == "pending"){
          currentWarehousesOrdersModel?.data?.items?.addAll(value.data?.items ??[]);
        }else{
          previousWarehousesOrdersModel?.data?.items?.addAll(value.data?.items ??[]);
        }
      }
      change(true,status: RxStatus.success());

    }).onError((error, stackTrace){
      Get.back();
      print("dasdsad");
      print(error.toString());
      Get.snackbar("", error.toString());
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