import 'dart:convert';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart' as DIO;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:fusion_warehouses/consts/urls.dart';
import 'package:fusion_warehouses/pages/daily_shipping_list/presentation/controllers/daily_shipping_controller.dart';
import 'package:fusion_warehouses/pages/purshase_management/presentation/controllers/purchase_management_controller.dart';
import 'package:fusion_warehouses/pages/shipping_details/models/buy_stock_model_request.dart';
import 'package:fusion_warehouses/pages/shipping_details/models/purchase_order_details_model.dart';
import 'package:fusion_warehouses/pages/shipping_details/models/purchase_order_mode_update.dart';
import 'package:fusion_warehouses/pages/shipping_details/models/suppliers_model.dart';
import 'package:fusion_warehouses/pages/shipping_details/models/update_state_purchase_order_request.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/routes/app_pages.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:get/get.dart';

import '../../data/shipping_details_repository.dart';

class ShippingDetailsController extends SuperController<bool> {
  final IShippingDetailsRepository shippingDetailsRepository;

  ShippingDetailsController({required this.shippingDetailsRepository});

  DateTime invoiceDatetime = DateTime.now();
  DateTime shippmentDateTime = DateTime.now();

  DateTime defferedDatetime = DateTime.now();
String? type;
  TextEditingController newRecieveController = TextEditingController();

  bool isupdated = false;
  TextEditingController invoiceNumberController = TextEditingController();
  TextEditingController totalInvoiceMoneyController = TextEditingController();
  TextEditingController supplierController = TextEditingController();
  TextEditingController invoiceDateController = TextEditingController();
  TextEditingController payInvoiceDateController = TextEditingController();

  TextEditingController newPurchasedQuantityController = TextEditingController();
  TextEditingController shippmentDateController = TextEditingController();
  TextEditingController actualPurchasePriceController = TextEditingController();

  TextEditingController returmAmountController = TextEditingController();

  RxString collectionMethod = "cash".obs;
  PurchaseOrderModelUpdateStock? purchaseOrderModelUpdateStock;
  String? invoiceDateRequest;
  String? defferedDateRequest;
  String? shippmentDateRequest;

  SuppliersModel? suppliersModel;
  Supplier? selectedSupplier;
  List stateName = ["pending", "processing", "purchased", "completed"];
  Map<String, String> statesOrders = {
    '': AppStrings.all,
    'pending': AppStrings.pending,
    'processing': AppStrings.processing,
    'purchased': AppStrings.purchased,
    'completed': AppStrings.completed,
    'cancelled': AppStrings.cancelled,
    'rejected': AppStrings.rejected
  };
  int stepNum = 0;

  PurchaseOrderDetails? purchaseOrderDetails;
  int? id;
  RxInt current = 0.obs;
  final CarouselController carouselController = CarouselController();
  ExternalPurchaseOrder externalPurchaseOrder =
      ExternalPurchaseOrder(attachmentsAttributes: []);
  AttachmentsAttributes attachmentsAttributes = AttachmentsAttributes();


  BuyStockModel buyStockModel = BuyStockModel();
  isExist(String value) {
    for (String i in stateName) {
      if (i.contains(value)) {
        return true;
      }
    }
    return false;
  }

  getIndex(String value) {
    for (int i = 0; i < stateName.length; i++) {
      if (stateName[i].contains(value)) {
        return i;
      }
    }
    return -1;
  }

  getPurchaseOrderDetails(int id) {
    change(false, status: RxStatus.loading());
    shippingDetailsRepository.getOrderDetails(id).then((value) {
      purchaseOrderDetails = value;
      change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change(true, status: RxStatus.success());

      Get.back();
    });
  }

  getSuppliers() {
    change(false, status: RxStatus.loading());
    shippingDetailsRepository.getSuppliers().then((value) {
      suppliersModel = value;
      change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change(true, status: RxStatus.success());
      print(error.toString());
      Get.back();
    });
  }

  updateStock(int id, String num) {
    change(false, status: RxStatus.loading());
    newRecieveController.text = "";
    shippingDetailsRepository.updateStockRecieved(id, num).then((value) {
      purchaseOrderModelUpdateStock = value;
      Get.rootDelegate.toNamed(Routes.BARCODE, arguments: [
        {"purchaseOrderModelUpdateStock": purchaseOrderModelUpdateStock}
      ]);
    }).onError((error, stackTrace) {
      Get.snackbar("", error.toString());
      change(true, status: RxStatus.success());
    });
  }

  buyStock(int idProduct) {
    change(false, status: RxStatus.loading());
    shippingDetailsRepository.buyStock(idProduct, buyStockModel).then((value) {
      purchaseOrderModelUpdateStock = value;
      newPurchasedQuantityController.text ="" ;actualPurchasePriceController.text="" ; shippmentDateController.text="" ; selectedSupplier = null;
      supplierController.text ="";
      getPurchaseOrderDetails(id!);
    }).onError((error, stackTrace) {
      Get.snackbar("", error.toString());
      change(true, status: RxStatus.success());
    });
  }


  returnStock(int idProduct, String num) {
    change(false, status: RxStatus.loading());
    shippingDetailsRepository.refundStock(idProduct, num).then((value) {
      purchaseOrderModelUpdateStock = value;
      returmAmountController.text ="" ;
      getPurchaseOrderDetails(id!);
    }).onError((error, stackTrace) {
      Get.snackbar("", error.toString());
      change(true, status: RxStatus.success());
    });
  }

  updateOrderDetailsState(ExternalPurchaseOrder externalPurchaseOrder2, bool stateOrder) {
    change(false, status: RxStatus.loading());
    newRecieveController.text = "";
    shippingDetailsRepository
        .updateStateOrder(
            id!,
            UpdateStatePurchaseOrderRequest(
                externalPurchaseOrder: externalPurchaseOrder2),
            stateOrder)
        .then((value) {
      purchaseOrderDetails = value;
      selectedSupplier = null;
      supplierController.text ="";
      getPurchaseOrderDetails(id!);
      isupdated = true;
      externalPurchaseOrder = ExternalPurchaseOrder(attachmentsAttributes: []);
    }).onError((error, stackTrace) {
      Get.snackbar("", error.toString());
      change(true, status: RxStatus.success());
    });
  }

  @override
  void onInit() {
    var args = Get.rootDelegate.arguments();
    id = args[0]['id'];
    type = args[1]['type'];
    getPurchaseOrderDetails(id!);
    getSuppliers();
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

  // Track the progress of a downloaded file here.
  double progress = 0;

  // Track if the PDF was downloaded here.
  bool didDownloadPDF = false;

  // Show the progress status to the user.
  String progressString = 'File has not been downloaded yet.';

  // This method uses Dio to download a file from the given URL
  // and saves the file to the provided `savePath`.
  Future download(String savePath) async {
    try {
      DIO.Dio dio = DIO.Dio();
      DIO.Response response = await dio.get(
        // "https://api.fusionksa.com/shops/api/v1/external_purchase_orders/${id}.pdf",
        "${EndPoints.BASE_URL}external_purchase_orders/${id}.pdf",
        onReceiveProgress: updateProgress,
        options: DIO.Options(
            responseType: DIO.ResponseType.bytes,
            followRedirects: false,
            headers: {
              'Authorization': AuthService.to.userInfo?.data?.authToken ?? ""
            },
            validateStatus: (status) {
              return status! < 500;
            }),
      );
      print("response.data ${response.data}");

      var file = File(savePath).openSync(mode: FileMode.write);
      file.writeFromSync(response.data);
      await file.close();
      didDownloadPDF = true;
      Get.snackbar("", "Downloaded successfully");
      // Here, you're catching an error and printing it. For production
      // apps, you should display the warning to the user and give them a
      // way to restart the download.
    } catch (e) {
      print(e);
    }
  }

  // You can update the download progress here so that the user is
  // aware of the long-running task.
  void updateProgress(done, total) {
    progress = done / total;
    if (progress >= 1) {
      progressString = '✅ File has finished downloading. Try opening the file.';
      didDownloadPDF = true;
    } else {
      progressString = 'Download progress: ' +
          (progress * 100).toStringAsFixed(0) +
          '% done.';
    }
  }

  File? attachementFile;
  Rx<TextEditingController> attachementFileController =
      TextEditingController().obs;

  openFileExplore() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'png', 'jpeg'],
    );
    if (result != null) {
      attachementFile = File(result.files.first.path!);
      String fileValue =
          base64Encode(File(attachementFile!.path).readAsBytesSync());
      print(fileValue);
      attachementFileController.value.text =
          attachementFile!.path.split('/').last;
    }

    update();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    if(isupdated){
      if(type == "true"){
        PurchaseManagementController purchaseManagementController = Get.find();
        purchaseManagementController.onInit();
        print("purchaseManagementController");
      }else{
        DailyShippingController dailyShippingController = Get.find();
        dailyShippingController.onInit();
        print("DailyShippingController");
      }
    }

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
