import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/daily_shipping_list/presentation/view/widgets/product_stock_shipping_card.dart';
import 'package:fusion_warehouses/pages/daily_shipping_list/presentation/view/widgets/search_view.dart';
import 'package:fusion_warehouses/resources/assets_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/routes/app_pages.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:fusion_warehouses/widgets/appbar_cell.dart';
import 'package:fusion_warehouses/widgets/custom_bottom_sheet.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:fusion_warehouses/widgets/date_picker_fn.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

import '../../../../resources/assets_svg_generated.dart';
import '../controllers/daily_shipping_controller.dart';

class DailyShippingView extends GetView<DailyShippingController> {
  DailyShippingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBarItem(
          height: 100,
          action: [
            InkWell(
                onTap: () async {
                  String? barCode = await customBottomSheet(
                      bottomSheetBody: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 32),
                          child: SearchView()));

                  if(barCode != null){
                    if (controller.tabController.index == 0) {
                      print("currrnent");
                      controller.barCodeCurrent = barCode;
                      controller.currentPage = 1;
                      controller.getDailyPurchaseOrders(
                          controller.currentPage,
                          false,
                          controller.shipmentDateCurrent,
                          controller.barCodeCurrent);
                    }
                    else {
                      print("previous");
                      controller.previousPage = 1;
                      controller.barCodePrevious = barCode;
                      controller.getDailyPurchaseOrders(
                          controller.previousPage,
                          true,
                          controller.shipmentDatePrevious,
                          controller.barCodePrevious);
                    }
                    print("barCode ${barCode}");
                  }
                },
                child: AppSVGAssets.getWidget(AppSVGAssets.search)),
            InkWell(
                onTap: () async {
                  controller.dateTime =
                      await showDatePickerFN(context, controller.dateTime);
                  if (controller.dateTime != null) {
                    if (controller.tabController.index == 0) {
                      print("currrnent");
                      controller.shipmentDateCurrent =
                          ((controller.dateTime!.millisecondsSinceEpoch /
                                      1000) +
                                  controller.dateTime!.timeZoneOffset.inSeconds)
                              .toString();
                      controller.currentPage = 1;
                      controller.getDailyPurchaseOrders(
                          controller.currentPage,
                          false,
                          controller.shipmentDateCurrent,
                          controller.barCodeCurrent);
                    } else {
                      print("previous");
                      controller.previousPage = 1;
                      controller.shipmentDatePrevious =
                          ((controller.dateTime!.millisecondsSinceEpoch /
                                      1000) +
                                  controller.dateTime!.timeZoneOffset.inSeconds)
                              .toString();
                      controller.getDailyPurchaseOrders(
                          controller.previousPage,
                          true,
                          controller.shipmentDatePrevious,
                          controller.barCodePrevious);
                    }
                    print(
                        "dateTime ${((controller.dateTime!.millisecondsSinceEpoch / 1000) + controller.dateTime!.timeZoneOffset.inSeconds).toString()}");
                    print(controller.dateTime.toString());
                  }
                },
                child: AppSVGAssets.getWidget(AppSVGAssets.date,
                    width: 60, height: 60)),
          ],
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
          title: CustomText(AppStrings.dailyShippingList,
              textStyle: TextStyles.textMedium.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: const Color(ColorCode.semiBlack))),
          bottom: TabBar(
              indicatorColor: const Color(ColorCode.yellow),
              controller: controller.tabController,
              tabs: [
                Tab(
                  child: InkWell(
                    onTap: () {
                      print("dsad");
                      controller.tabController.index = 0;
                    },
                    child: CustomText(AppStrings.current,
                        textStyle: TextStyles.textMedium.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
                Tab(
                  child: InkWell(
                    onTap: () {
                      print("dsad");

                      controller.tabController.index = 1;
                    },
                    child: CustomText(AppStrings.previous,
                        textStyle: TextStyles.textMedium.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
              ]),
        ),
        body: TabBarView(
            physics: const BouncingScrollPhysics(),
            controller: controller.tabController,
            children: [
          //currentCell
          controller.obx(
              (state) => (controller.currentPurchaseOrdersDaily
                  ?.data?.items?.isEmpty ??
                  false)
                  ? RefreshIndicator(
                onRefresh: () async {
                  controller.currentPage = 1;
                  controller.shipmentDateCurrent = "";
                  controller.barCodeCurrent = "";
                  controller.currentPurchaseOrdersDaily = null;
                  await controller.getDailyPurchaseOrders(
                      1,
                      false,
                      controller.shipmentDateCurrent,
                      controller.barCodeCurrent);
                },
                    child: ListView(
                children: [
                  SizedBox(height: Get.height*.25,),
                  Container(
                    alignment: Alignment.center,
                    width: 100,height: 100,
                    child: const Image(
                      image: AppAssets.empty,
                    ),
                  ),
                    Center(
                      child: CustomText(
                          AppStrings.nodatafound),
                    ),
                ],
              ),
                  )
                  :NotificationListener<ScrollNotification>(
                    onNotification: (scrollNotification) {
                      if (scrollNotification is ScrollEndNotification) {
                        if (controller.scrollCurrentController.value
                                .position.pixels ==
                            controller.scrollCurrentController.value
                                .position.maxScrollExtent) {
                          print("hello");
                          if (controller.currentPage <
                              controller.currentPurchaseOrdersDaily!.data!
                                  .pagination!.totalPages!) {
                            controller.currentPage++;
                            print(
                                "controller.pageNumber.value ${controller.currentPage}");
                            controller.getDailyPurchaseOrders(
                                controller.currentPage,
                                false,
                                controller.shipmentDateCurrent,
                                controller.barCodeCurrent);
                          }
                        }
                      }
                      return true;
                    },
                    child: RefreshIndicator(
                        onRefresh: () async {
                          controller.currentPage = 1;
                          controller.shipmentDateCurrent = "";
                          controller.barCodeCurrent = "";
                          controller.currentPurchaseOrdersDaily = null;
                          await controller.getDailyPurchaseOrders(
                              1,
                              false,
                              controller.shipmentDateCurrent,
                              controller.barCodeCurrent);
                        },
                        child:  ListView.builder(
                            controller: controller
                                .scrollCurrentController.value,
                            physics:
                                const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ProductStockShippingCard(
                                title: "",
                                state: controller
                                    .currentPurchaseOrdersDaily
                                    ?.data
                                    ?.items?[index].state ??"",
                                productNumber: controller
                                        .currentPurchaseOrdersDaily
                                        ?.data
                                        ?.items?[index]
                                        .number ??
                                    "",
                                color: const Color(ColorCode.red),
                                productName: controller
                                        .currentPurchaseOrdersDaily
                                        ?.data
                                        ?.items?[index]
                                        .productSupplier
                                        ?.name ??
                                    "",
                                date: DateFormat(
                                        'EEEE, MMM d, yyyy, h:mm a',
                                        AuthService.to.language)
                                    .format(DateTime.parse(
                                  controller
                                          .currentPurchaseOrdersDaily
                                          ?.data
                                          ?.items?[index]
                                          .shipmentDate ??
                                      "",
                                )),
                                onTap: () {
                                  Get.rootDelegate.toNamed(
                                      Routes.DETAILS,
                                      arguments: [
                                        {
                                          "id": controller
                                              .currentPurchaseOrdersDaily
                                              ?.data
                                              ?.items?[index]
                                              .externalPurchaseOrderId
                                        },
                                        {"type":"false"}
                                      ]);
                                }, showSupplierName: false,
                              );
                            },
                            itemCount: controller
                                    .currentPurchaseOrdersDaily
                                    ?.data
                                    ?.items
                                    ?.length ??
                                0)),
                  ),
              onLoading: SpinKitCircle(
                color: Color(ColorCode.yellow),
              )),

          // previousCell
          controller.obx((state) => controller.previousPurchaseOrdersDaily == null ||
              (controller.previousPurchaseOrdersDaily?.data
                  ?.items?.isEmpty ??
                  false)
              ? RefreshIndicator(
            onRefresh: () async {
              controller.previousPage = 1;
              controller.shipmentDatePrevious = "";
              controller.barCodePrevious = "";
              controller.previousPurchaseOrdersDaily = null;
              await controller.getDailyPurchaseOrders(
                  1,
                  true,
                  controller.shipmentDatePrevious,
                  controller.barCodePrevious);
            },
            child: ListView(

              children: [
                SizedBox(height: Get.height*.25,),
                Container(
                  alignment: Alignment.center,
                  width: 100,height: 100,
                  child: const Image(
                    image: AppAssets.empty,
                  ),
                ),
                Center(
                  child: CustomText(AppStrings.nodatafound),
                ),
              ],
            ),
          )
              :
              NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollEndNotification) {
                    if (controller.scrollPreviousController.value.position
                            .pixels ==
                        controller.scrollPreviousController.value.position
                            .maxScrollExtent) {
                      print("hello");
                      if (controller.previousPage <
                          controller.previousPurchaseOrdersDaily!.data!
                              .pagination!.totalPages!) {
                        controller.previousPage++;
                        print(
                            "controller.pageNumber.value ${controller.previousPage}");
                        controller.getDailyPurchaseOrders(
                            controller.previousPage,
                            true,
                            controller.shipmentDatePrevious,
                            controller.barCodePrevious);
                      }
                    }
                  }
                  return true;
                },
                child:
                // if (controller.permissionUser(
                // ['admin', 'purchase_order_complete'])) {
                // Get.rootDelegate.toNamed(Routes.SHIPPING_DAILY);
                // } else {
                // Get.snackbar("", AppStrings.youDontHaveAccess,duration: Duration(milliseconds: 700));
                // }
    // controller.permissionUser(
    // ['admin']) ?
                RefreshIndicator(
                  onRefresh: () async {
                    controller.previousPage = 1;
                    controller.shipmentDatePrevious = "";
                    controller.barCodePrevious = "";
                    controller.previousPurchaseOrdersDaily = null;
                    await controller.getDailyPurchaseOrders(
                        1,
                        true,
                        controller.shipmentDatePrevious,
                        controller.barCodePrevious);
                  },
                  child: ListView.builder(
                          controller:
                              controller.scrollPreviousController.value,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ProductStockShippingCard(
                              title: "",
                              state: controller
                                  .previousPurchaseOrdersDaily
                                  ?.data
                                  ?.items?[index].state ??"",
                              productNumber: controller
                                      .previousPurchaseOrdersDaily
                                      ?.data
                                      ?.items?[index]
                                      .number ??
                                  "",
                              color: const Color(ColorCode.red),
                              productName: controller
                                      .previousPurchaseOrdersDaily
                                      ?.data
                                      ?.items?[index]
                                      .product?.name ??
                                  "",
                              date: DateFormat(
                                      'EEEE, MMM d, yyyy, h:mm a',
                                      AuthService.to.language)
                                  .format(DateTime.parse(
                                controller.previousPurchaseOrdersDaily
                                        ?.data?.items?[index].shipmentDate ??
                                    "",
                              )),
                              onTap: () {
                                Get.rootDelegate
                                    .toNamed(Routes.DETAILS, arguments: [
                                  {
                                    "id": controller
                                        .previousPurchaseOrdersDaily
                                        ?.data
                                        ?.items?[index]
                                        .externalPurchaseOrderId
                                  },
                                  {"type":"false"}
                                ]);
                              }, showSupplierName: false,
                            );
                          },
                          itemCount: controller
                                  .previousPurchaseOrdersDaily
                                  ?.data
                                  ?.items
                                  ?.length ??
                              0),
                )
                // :Center(child: CustomText(AppStrings.youDontHaveAccess,textStyle: TextStyles.textMedium.copyWith(
      // fontWeight: FontWeight.w400,
      // fontSize: 18
    // ),
    // ),
    // ),
              )),
        ]),
      ),
    );
  }
}
