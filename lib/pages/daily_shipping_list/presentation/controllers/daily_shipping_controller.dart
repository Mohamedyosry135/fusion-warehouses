import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fusion_warehouses/pages/daily_shipping_list/models/purchase_order_daily.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:get/get.dart';

import '../../data/daily_shipping_repository.dart';

class DailyShippingController extends SuperController<bool> with GetTickerProviderStateMixin {
  final IDailyShippingRepository dailyShippingRepository;
  DailyShippingController({required this.dailyShippingRepository});


DateTime? dateTime;

late TabController tabController;
  Rx<ScrollController> scrollCurrentController = ScrollController().obs;
  Rx<ScrollController> scrollPreviousController = ScrollController().obs;
    int currentPage = 1;
  int previousPage = 1;
  PurchaseOrdersDaily? currentPurchaseOrdersDaily;
  PurchaseOrdersDaily? previousPurchaseOrdersDaily;
  String shipmentDateCurrent = "";
  String barCodeCurrent = "";
  String shipmentDatePrevious= "";
  String barCodePrevious = "";
  @override
  void onInit()async{
    tabController =TabController(length: 2, vsync: this);
    await getDailyPurchaseOrders(currentPage,false,shipmentDateCurrent,barCodeCurrent);
    await getDailyPurchaseOrders(previousPage,true,shipmentDatePrevious,barCodePrevious);
    super.onInit();
  }


  getDailyPurchaseOrders(int page,bool shippedPurchaseOrdersHistory,String shipmentData, String barCode){
    if(page == 1){
      change(false,status: RxStatus.loading());
    }else{
      change(false,status: RxStatus.loadingMore());
    }
    dailyShippingRepository.getDailyPurchaseOrders(page, shippedPurchaseOrdersHistory, shipmentData, barCode).then((value){
      if(page == 1){
        if(shippedPurchaseOrdersHistory){
          previousPurchaseOrdersDaily = value;
        }else{
          currentPurchaseOrdersDaily = value;
        }
      }else{
        if(shippedPurchaseOrdersHistory){
          previousPurchaseOrdersDaily?.data?.items?.addAll(value.data?.items ??[]);
        }else{
          currentPurchaseOrdersDaily?.data?.items?.addAll(value.data?.items ??[]);
        }
      }
      change(true,status: RxStatus.success());

    }).onError((error, stackTrace){
      print("${error.toString()} ${shippedPurchaseOrdersHistory}");
      Get.back();
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
  bool permissionUser(List<String> roles) {
    bool refuse = false;
    AuthService.to.userInfo?.data?.user?.roles?.forEach((element) {
      String roleArr = element.key!;
      roles.forEach((role) {
        if(roleArr.contains(role)){
          refuse = true;
          return;
        }
      });
      if(refuse){
        return;
      }
    });
    return refuse;
  }
}