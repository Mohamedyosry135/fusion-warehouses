import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/daily_shipping_list/presentation/view/widgets/product_stock_shipping_card.dart';
import 'package:fusion_warehouses/pages/daily_shipping_list/presentation/view/widgets/search_view.dart';
import 'package:fusion_warehouses/pages/purshase_management/presentation/view/widgets/filter_widget.dart';
import 'package:fusion_warehouses/resources/assets_generated.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/routes/app_pages.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:fusion_warehouses/widgets/custom_bottom_sheet.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/purchase_management_controller.dart';
import 'dart:math' as math;
class PurchaseManagementView extends GetView<PurchaseManagementController> {
  PurchaseManagementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(ColorCode.white),
        title: CustomText(AppStrings.foreignPurchaseOrders,
            textStyle: TextStyles.textMedium.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: const Color(ColorCode.semiBlack))),
        leading: Transform(
          alignment: Alignment.center,
          transform: AuthService.to.language == 'ar'
              ? Matrix4.rotationY(0)
              : Matrix4.rotationY(math.pi),
          child: InkWell(
            child: AppSVGAssets.getWidget(AppSVGAssets.back),
            onTap: () {
              Get.back();
            },
          ),
        ),
        actions: [
          InkWell(
              onTap: () async{
                 String? barCode = await  customBottomSheet(
                    bottomSheetBody: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 32),
                        child: SearchView()));
                 if(barCode!=null){
                   controller.barCode.text = barCode;
                   controller.page = 1;
                   controller.productSupplierId = null;
                   controller.stateOrder = "";
                   controller.fromFilter = "";
                   controller.toFilter = "";
                   controller.getExternalPurchaseOrders(controller.page, controller.barCode.text );
                 }

              },
              child: AppSVGAssets.getWidget(AppSVGAssets.search)),
          InkWell(
              onTap: () {
                customBottomSheet(
                    bottomSheetBody: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: FilterWidget()));
              },
              child: AppSVGAssets.getWidget(AppSVGAssets.filter,
                  width: 60, height: 60)),
        ],
      ),
      body: SafeArea(
          child: controller.obx(
              (state) =>NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollEndNotification) {
                    if (controller
                        .scrollController.value.position.pixels ==
                        controller.scrollController.value.position
                            .maxScrollExtent) {
                      print("hello");
                      if (controller.page <
                          controller.externalPurchaseOrderModel!.data!
                              .pagination!.totalPages!) {
                        controller.page++;
                        print(
                            "controller.pageNumber.value ${controller.page}");
                        controller
                            .getExternalPurchaseOrders(controller.page,controller.barCode.text);
                      }
                    }
                  }
                  return true;
                },
                child: RefreshIndicator(
                  onRefresh: () async {
                    controller.page = 1;
                    controller.externalPurchaseOrderModel = null;
                    controller.stateOrder = "";
                    await controller.getExternalPurchaseOrders(1,controller.barCode.text);
                  },
                  child: controller.externalPurchaseOrderModel == null || (controller.externalPurchaseOrderModel
                      ?.data?.items?.isEmpty ??false)? ListView(
                    children: [
                      SizedBox(height: Get.height*.25,),
                      Container(
                        alignment: Alignment.center,
                        width: 100,height: 100,
                        child: const Image(
                          image: AppAssets.empty,
                        ),
                      ),
                      Center(child: CustomText(AppStrings.nodatafound),),
                    ],
                  ):ListView.builder(
                      controller: controller.scrollController.value,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ProductStockShippingCard(
                          title: "",
                          state: controller
                              .externalPurchaseOrderModel
                              ?.data
                              ?.items?[index].state ??"",
                          numberId: controller.externalPurchaseOrderModel
                              ?.data?.items?[index].number,
                          productNumber: controller.externalPurchaseOrderModel
                              ?.data?.items?[index].purchasedBy?.name ??"",
                          color: const Color(ColorCode.darkGreen),
                          productName: controller.externalPurchaseOrderModel
                              ?.data?.items?[index].assignedTo?.name ??"",
                          date:
                          DateFormat('EEEE, MMM d, yyyy, h:mm a',AuthService.to.language).format(DateTime.parse(controller.externalPurchaseOrderModel
                              ?.data?.items?[index].createdAt ?? "",)),
                          onTap: () {
                            Get.rootDelegate.toNamed(Routes.DETAILS,arguments: [{"id":controller.externalPurchaseOrderModel
                                ?.data?.items?[index].id},
                              {"type":"true"}
                            ]);
                          }, showSupplierName: true,
                        );
                      },
                      itemCount: controller.externalPurchaseOrderModel
                          ?.data?.items?.length ??
                          0),
                ),
              ),
              onLoading: SpinKitCircle(
                color: Color(ColorCode.yellow),
              ))),
    );
  }
}
