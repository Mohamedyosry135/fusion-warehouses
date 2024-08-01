import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:fusion_warehouses/pages/invoices/models/order_invoice_model.dart';
import 'package:fusion_warehouses/pages/invoices/models/warehouse_order_details.dart';
import 'package:fusion_warehouses/pages/invoices/presentation/view/widgets/fail_automatic_code_view.dart';
import 'package:fusion_warehouses/pages/invoices/presentation/view/widgets/sucess_automatic_code_view.dart';
import 'package:fusion_warehouses/pages/returns/presentation/controllers/returns_controller.dart';
import 'package:fusion_warehouses/pages/warehouse_delivery/models/warehouses_orders_model.dart';
import 'package:fusion_warehouses/pages/warehouse_delivery/presentation/controllers/warehouse_delivery_controller.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/widgets/custom_bottom_sheet.dart';
import 'package:get/get.dart';

import '../../data/invoices_repository.dart';

class InvoicesController extends SuperController<bool> {
  final InvoicesRepository invoicesRepository;

  InvoicesController({required this.invoicesRepository});

  WarehousesOrdersDetailsModel? ordersDetails;
  OrderInvoiceModel? orderInvoice;
  int? id;
  bool isRefund = true;

  late WarehousesController warehousesController;
  late ReturnsController returnsController;

  @override
  void onInit() async {
    super.onInit();

    var args = Get.rootDelegate.arguments();
    id = args[0]['id'];
    isRefund = args[1]['isRefund'];

    if (isRefund) {
      returnsController = Get.find();
    } else {
      warehousesController = Get.find();
    }
    await getWarehousesOrderDetails(id!);
  }

  getWarehousesOrderDetails(int id) {
    change(false, status: RxStatus.loading());
    invoicesRepository.getWarehousesOrderDetails(id).then((value) async {
      ordersDetails = value;
      // await getOrderInvoice(ordersDetails?.data?.invoiceId ?? 0);
      change(true, status: RxStatus.success());

    }).onError((error, stackTrace) {
      Get.back();
      Get.snackbar("", error.toString());
      print("getWarehousesOrderDetails ${error.toString()}");
      change(true, status: RxStatus.success());
    });
  }

  getOrderInvoice(int id) {
    change(false, status: RxStatus.loading());
    invoicesRepository.getOrderInvoice(id).then((value) {
      orderInvoice = value;
      change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      Get.back();
      Get.snackbar("", error.toString());
      print("getOrderInvoice ${error.toString()}");
      change(true, status: RxStatus.success());
    });
  }

  WarehouseOrderItems? checkBarcode(String barcode) {
    for (int i = 0;
        i < (ordersDetails?.data?.warehouseOrderItems?.length ?? 0);
        i++) {
      print("asddasd ${ordersDetails?.data?.warehouseOrderItems?[i].code }");
      if (ordersDetails?.data?.warehouseOrderItems?[i].code == barcode) {
        return ordersDetails!.data!.warehouseOrderItems![i];
      }
    }
    return null;
  }

  afterScan(String barcode) {
    print(
        "ldksfjndsj ${ordersDetails?.data?.warehouseOrderItems?.contains(ordersDetails?.data?.warehouseOrderItems?.firstWhere((element) => element.isChecked.value == false))}");
    WarehouseOrderItems? temp = checkBarcode(barcode);
    if (temp == null) {
      customBottomSheet(
          bottomSheetBody: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: FailCodeView(
                failname: AppStrings.noProductFound,
              )));
    } else {
      customBottomSheet(
          bottomSheetBody: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: SucessCodeView(
                onTap: () {
                  temp.isChecked.value = true;
                  Get.back();
                  update();
                },
                buttomname: ordersDetails?.data?.orderType == "sell"
                    ? AppStrings.returnsConfirmation
                    : AppStrings.confirmExchange,
                sucessname: ordersDetails?.data?.orderType == "sell"
                    ? AppStrings.theProductIsNotIncludedInTheReturnRequest
                    : AppStrings.theProductIsInTheReturnRequest,
                orderItems: temp,
              )));
    }
  }

  isExistOrNot() {
    for (int i = 0;
        i < (ordersDetails?.data?.warehouseOrderItems?.length ?? 0);
        i++) {
      if (ordersDetails?.data?.warehouseOrderItems?[i].isChecked.value ==
          false) {
        return true.obs;
      }
    }
    return false.obs;
  }

  Future<String> scanBarcode() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", 'Cancel', true, ScanMode.DEFAULT);
    print("BarcodeScannerBarcodeScanner:: ${barcodeScanRes}");
    return barcodeScanRes;
  }

  editStateOfOrder(int id) {
    change(false, status: RxStatus.loading());
    invoicesRepository.editStateOfOrder(id).then((value) async {
      ordersDetails = value;
      // await getOrderInvoice(ordersDetails?.data?.invoiceId ?? 0);
      change(true, status: RxStatus.success());

    }).onError((error, stackTrace) {
      // Get.back();
      Get.snackbar("", error.toString());
      print("getWarehousesOrderDetails ${error.toString()}");
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

  @override
  void onClose() {
    // TODO: implement onClose
    if (isRefund) {
      returnsController.previousPage = 1;
      returnsController.currentPage = 1;
      returnsController.onInit();
    } else {
      warehousesController.previousPage = 1;
      warehousesController.currentPage = 1;
      warehousesController.onInit();
    }
    super.onClose();
  }
}
