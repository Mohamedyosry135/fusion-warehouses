import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/stocktaking/presentation/controllers/Stocktaking_controller.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/data/stocktaking_details_repository.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/models/product_brands_model.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/models/product_category_model.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/models/product_of_stock_model.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/models/stocktaking_details_model.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/models/support_ticket_type_model.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/presentation/views/widgets/stock_status_list_filter.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:get/get.dart';

class StocktakingDetailsController extends SuperController<dynamic> {
  StocktakingDetailsController({required this.stocktakingDetailsRepository});

  final IStocktakingDetailsRepository stocktakingDetailsRepository;
  Rx<ScrollController> scrollController = ScrollController().obs;

  StocktakingDetailsModel? stocktakingDetails;
  ProductBrandsModel? productBrands;
  ProductsOfStockModel? productsOfStock;
  ProductCategoriesModel? productCategories;
  SupportTicketTypeModel? supportTicketTypes;

  Brands? brandFilter;
  CategoryFilter? categoryFilter;
  StockStatusList? statusFilter;
  SupportTicketTypeItem? supportTicketTypeItemFilter ;

   List<StockStatusList> statusStocksList =[StockStatusList(name: AppStrings.all,key: ""),StockStatusList(name: AppStrings.available,key: "true"),StockStatusList(name: AppStrings.outOfStock,key: "false")];

  String availableFilter = "";
  String categoryFilterId = "";
  String barndId = "";
  String supportTicketTypeId = "";

  int? id;
  int page = 1;
  final CarouselController carouselController = CarouselController();
  RxInt current = 0.obs;

  @override
  void onInit() {
    var args = Get.rootDelegate.arguments();
    id = args[0]['id'];
    page = 1;
    barCodeSearch ="";
     availableFilter = "";
     categoryFilterId = "";
     barndId = "";
     supportTicketTypeId = "";
    getStockDetails(id!);
    getProductBrands();
    getProductCategories();
    getSupportTicketTypes();
    getProductsOfStock(id!,page,10, barCodeSearch,categoryFilterId,supportTicketTypeId,availableFilter,barndId);
    super.onInit();
  }
  String barCodeSearch ="";
  Map<String,String> stateNameMap = {
    "pending" :AppStrings.startInventory,
    "started":AppStrings.submitToMatch,
    "done":AppStrings.adoptionInventoryResult,
    "completed":AppStrings.stockAdjustment,
    "stock_updated":AppStrings.completed,
  };
  List <String> stateNames = ['pending','started','done','completed','stock_updated'];
  getIndex(String value){
    for(int i= 0;i<stateNames.length;i++){
      if(stateNames[i].contains(value)){
        return i;
      }
    }
    return -1;
  }

  getStockDetails(int id) {
    change(false, status: RxStatus.loading());
    stocktakingDetailsRepository.getStockDetails(id).then((value) {
      stocktakingDetails = value;
      change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      print("error: getStockDetails " + error.toString());
      Get.back();
      Get.snackbar("", error.toString());
      change(true, status: RxStatus.success());
    });
  }

  getProductBrands() {
    change(false, status: RxStatus.loading());
    stocktakingDetailsRepository.getProductBrands().then((value) {
      productBrands = value;
      change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      print("error: getProductBrands " + error.toString());

      Get.back();
      Get.snackbar("", error.toString());
      change(true, status: RxStatus.success());
    });
  }

  getProductCategories() {
    change(false, status: RxStatus.loading());
    stocktakingDetailsRepository.getProductCategories().then((value) {
      productCategories = value;
      change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      print("error: getProductCategories " + error.toString());

      Get.back();
      Get.snackbar("", error.toString());
      change(true, status: RxStatus.success());
    });
  }
  getSupportTicketTypes() {
    change(false, status: RxStatus.loading());
    stocktakingDetailsRepository.getSupportTicketTypes().then((value) {
      supportTicketTypes = value;
      change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      print("error: getSupportTicketTypes " + error.toString());

      Get.back();
      Get.snackbar("", error.toString());
      change(true, status: RxStatus.success());
    });
  }
  getProductsOfStock(int id, int page,int perPage,String search,String productCategoryId,String supportTicketTypeId, String outOfStock, String brandId) {
    if(page == 1){
      change(false, status: RxStatus.loading());
    }else{
      change(false, status: RxStatus.loadingMore());

    }
    stocktakingDetailsRepository.getProductsOfStock(id,page,perPage,search,productCategoryId,supportTicketTypeId,outOfStock,brandId).then((value) {
      if(page == 1){
        productsOfStock = value;
      }else{
        productsOfStock?.data?.items?.addAll(value.data?.items ??[])  ;

      }

      change(true, status: RxStatus.success());
    }).onError((error, stackTrace) {
      print("error: getProductsOfStock " + error.toString());

      Get.back();
      Get.snackbar("", error.toString());
      change(true, status: RxStatus.success());
    });
  }

  updateStockState(String status){
    change(false, status: RxStatus.loading());
    stocktakingDetailsRepository.updateStockState(id!,status).then((value) {
      // stocktakingDetails = value;
      if(stocktakingDetails?.code ==422){
        Get.snackbar("", stocktakingDetails?.error?.base?.first ??"");
        change(true, status: RxStatus.success());

      }else{
        getStockDetails(id!);

      }
    }).onError((error, stackTrace) {
      print("error: getStockDetails " + error.toString());
      Get.snackbar("", error.toString());
      change(true, status: RxStatus.success());
    });
  }

  chanegStockStatus(context){
    int index = getIndex(stocktakingDetails?.data?.status??"");

    if(index ==0){
      updateStockState("started");
    }else if(index ==1) {
      updateStockState("done");
    }else if(index ==2) {
      updateStockState("completed");
    }
    else if(index ==3) {
      print(DateTime.now().isAfter(DateTime.parse(stocktakingDetails?.data?.expiresAt ?? "",)));
      if(DateTime.now().isAfter(DateTime.parse(stocktakingDetails?.data?.expiresAt ?? "",))){
        AwesomeDialog(
            context: context,
            dialogType:
            DialogType.WARNING,
            animType: AnimType.SCALE,
            title: "",

            dismissOnTouchOutside: false,
            desc:
            AppStrings.warning4,
            buttonsTextStyle: TextStyles.textMedium.copyWith(
                color: Color(ColorCode.semiBlack)
            ),
            btnOkText: AppStrings.cancel,
            btnOkOnPress: () async {

            },
            btnOkColor:  Color(ColorCode.gray3),

          )
            .show();
      }else{
        updateStockState("stock_updated");
      }

    }
  }






  StocktakingController stocktakingController = Get.find();





  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}
  @override
  void onClose() {
    // TODO: implement onClose
    stocktakingController.onInit();
    super.onClose();
  }
}
