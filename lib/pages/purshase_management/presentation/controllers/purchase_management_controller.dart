import 'package:flutter/material.dart';
import 'package:fusion_warehouses/pages/purshase_management/models/external_purchase_orders_model.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:get/get.dart';

import '../../data/purchase_management_repository.dart';

class PurchaseManagementController extends SuperController<bool> {
  final IPurchaseManagementRepository purchaseManagementRepository;

  PurchaseManagementController({required this.purchaseManagementRepository});

  DateTime? toDate;
  DateTime? fromDate;

  String fromFilter = "";
  String toFilter = "";

  TextEditingController fromFilterDate = TextEditingController();
  TextEditingController toFilterDate = TextEditingController();
  TextEditingController barCode = TextEditingController(text: "");

  ExternalPurchaseOrderModel? externalPurchaseOrderModel;
  Rx<ScrollController> scrollController = ScrollController().obs;

  int page = 1;
  int? productSupplierId;
  List<String>statesKeys = ["","pending","processing","purchased","completed","cancelled","rejected"];
  String? stateOrder = "";
  Map<String,String> statesOrders =
    {'':AppStrings.all,
    'pending':AppStrings.pending,
    'processing':AppStrings.processing,
    'purchased':AppStrings.purchased,
    'completed':AppStrings.completed,
    'cancelled':AppStrings.cancelled,
    'rejected':AppStrings.rejected};

  getExternalPurchaseOrders(int pageIndex, String barcode) {
    if (pageIndex == 1) {
      change(false, status: RxStatus.loading());
    } else {
      change(false, status: RxStatus.loadingMore());
    }
    barCode.text = "";
    purchaseManagementRepository
        .getExternalPurchaseOrders(pageIndex, productSupplierId, stateOrder,
            fromFilter, toFilter, barcode)
        .then((value) {
      if (pageIndex == 1) {
        externalPurchaseOrderModel = value;
      } else {
        externalPurchaseOrderModel?.data?.items
            ?.addAll(value.data?.items ?? []);
      }
      change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      Get.back();
      Get.snackbar("", error.toString());
      change(true, status: RxStatus.success());
    });
  }

  @override
  void onInit() {
    page = 1;
    getExternalPurchaseOrders(page, barCode.text);
    super.onInit();
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
