import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fusion_warehouses/pages/profile/models/profile_model.dart';
import 'package:fusion_warehouses/pages/warehouse_delivery/data/warehouse_repository.dart';
import 'package:fusion_warehouses/pages/warehouse_delivery/models/warehouses_orders_model.dart';
import 'package:fusion_warehouses/pages/warehouse_delivery/presentation/view/warehouse_delivery_view.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:get/get.dart';


class ReturnsController extends SuperController<bool> with GetTickerProviderStateMixin {
  final IWarehousesRepository warehousesRepository;
  ReturnsController({required this.warehousesRepository});


  late TabController tabController;

  int currentPage = 1;
  int previousPage = 1;

  Rx<ScrollController>scrollCurrentReturns = ScrollController().obs;
  Rx<ScrollController> scrollPreviousReturns = ScrollController().obs;

  WarehousesOrdersModel? currentReturnsOrdersModel;
  WarehousesOrdersModel? previousReturnsOrdersModel;
  @override
  void onInit() async{
    tabController =TabController(length: 2, vsync: this);
    await getReturnsOrder(currentPage,"refund","pending");
    await getReturnsOrder(previousPage,"refund","completed");
    super.onInit();
  }

  getReturnsOrder(int page,String type, String status){
    if(page == 1){
      change(false,status: RxStatus.loading());
    }else{
      change(false,status: RxStatus.loadingMore());
    }
    warehousesRepository.getWarehousesOrder(page, type, status).then((value){
      if(page == 1){
        if(status == "pending"){
          currentReturnsOrdersModel = value;
        }else{
          previousReturnsOrdersModel = value;
        }
      }else{
        if(status == "pending"){
          currentReturnsOrdersModel?.data?.items?.addAll(value.data?.items ??[]);
        }else{
          previousReturnsOrdersModel?.data?.items?.addAll(value.data?.items ??[]);
        }
      }
      change(true,status: RxStatus.success());

    }).onError((error, stackTrace){
      Get.back();
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