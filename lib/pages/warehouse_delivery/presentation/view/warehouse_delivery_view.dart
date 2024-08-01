import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/resources/assets_generated.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/routes/app_pages.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:fusion_warehouses/widgets/appbar_cell.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:get/get.dart';

import '../controllers/warehouse_delivery_controller.dart';
import 'widgets/delivery_cell.dart';
import 'dart:math' as math;
enum Warhouses {warehouse , returns}
class WarehousesView extends GetView<WarehousesController> {

  WarehousesView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar:AppBarItem(
        height: 100,

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
        title: CustomText(AppStrings.deliveryOrders,
            textStyle: TextStyles.textMedium.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: const Color(ColorCode.semiBlack))),
        bottom: TabBar(
            indicatorColor: const Color(ColorCode.yellow),
            controller: controller.tabController,
            tabs: [
              InkWell(
                onTap: () {
                  print("dsad");
                  controller.tabController.index = 0;
                },
                child: Tab(
                  child: CustomText(AppStrings.current,
                      textStyle: TextStyles.textMedium.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.tabController.index = 1;
                },
                child: Tab(
                  child: CustomText(AppStrings.previous,
                      textStyle: TextStyles.textMedium.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
            ]),
      ),

        body: SafeArea(
            child: TabBarView(
                controller: controller.tabController,

                physics:const BouncingScrollPhysics(), children: [

              controller.obx((state) => (controller.currentWarehousesOrdersModel
                  ?.data?.items?.isEmpty ??
                  false)
                  ? RefreshIndicator(
                onRefresh: () async {
                  controller.currentPage = 1;
                  await controller.getWarehousesOrder(
                      1,
                      "sell","pending");
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
                    if (controller.scrollCurrentDeliveryWarehouses.value
                        .position.pixels ==
                        controller.scrollCurrentDeliveryWarehouses.value
                            .position.maxScrollExtent) {
                      print("hello");
                      if (controller.currentPage <
                          controller.currentWarehousesOrdersModel!.data!
                              .pagination!.totalPages!) {
                        controller.currentPage++;
                        print(
                            "controller.pageNumber.value ${controller.currentPage}");
                        controller.getWarehousesOrder(
                            controller.currentPage,
                            "sell","pending");
                      }
                    }
                  }
                  return true;
                },
                child: RefreshIndicator(
                  onRefresh: () async{
                    controller.currentPage = 1;
                    await controller.getWarehousesOrder(controller.currentPage,"sell","pending");

                  },
                  child: ListView.builder( physics: BouncingScrollPhysics(),
                      controller: controller.scrollCurrentDeliveryWarehouses.value,
                      itemBuilder: (context, index) {
                        return DeliverReturnCell(
                          item: controller.currentWarehousesOrdersModel!.data!.items![index],
                          isReturn: false,

                          icon: AppSVGAssets.getWidget(AppSVGAssets.code),ontab: (){
                          Get.rootDelegate.toNamed(Routes.INVOICESES,arguments: [
                            {"id":controller.currentWarehousesOrdersModel!.data!.items![index].id},
                            {"isRefund":false},

                          ]);
                        },);
                      },
                      itemCount: controller.currentWarehousesOrdersModel?.data?.items?.length ??0),
                ),
              ),onLoading: SpinKitCircle(color:Color(ColorCode.yellow))),



              controller.obx((state) =>

              (controller.previousWarehousesOrdersModel
                  ?.data?.items?.isEmpty ??
                  false)
                  ? RefreshIndicator(
                onRefresh: () async {
                  controller.previousPage = 1;
                  await controller.getWarehousesOrder(
                      1,
                      "sell","completed");
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
              ):NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollEndNotification) {
                    if (controller.scrollPreviousDeliveryWarehouses.value
                        .position.pixels ==
                        controller.scrollPreviousDeliveryWarehouses.value
                            .position.maxScrollExtent) {
                      print("hello");
                      if (controller.previousPage <
                          controller.previousWarehousesOrdersModel!.data!
                              .pagination!.totalPages!) {
                        controller.previousPage++;
                        print(
                            "controller.pageNumber.value ${controller.previousPage}");
                        controller.getWarehousesOrder(
                            controller.previousPage,
                            "sell","completed");
                      }
                    }
                  }
                  return true;
                },
                child: RefreshIndicator(
                  onRefresh: () async{
                    controller.previousPage = 1;
                    await controller.getWarehousesOrder(controller.previousPage,"sell","completed");
                  },

                  child:
                    // if (controller.permissionUser(
                    // ['admin', 'purchase_order_complete'])) {
              // Get.rootDelegate.toNamed(Routes.SHIPPING_DAILY);
              // } else {
              // Get.snackbar("", AppStrings.youDontHaveAccess,duration: Duration(milliseconds: 700));
              // }
              ListView.builder( physics: BouncingScrollPhysics(),
                    itemCount: controller.previousWarehousesOrdersModel?.data?.items?.length ??0,
                    controller: controller.scrollPreviousDeliveryWarehouses.value,
                    itemBuilder: (context, index) {
                      return DeliverReturnCell(
                        item: controller.previousWarehousesOrdersModel!.data!.items![index],
                        icon: SizedBox(),
                          isReturn: false,
                        ontab: (){
                          Get.rootDelegate.toNamed(Routes.INVOICESES,arguments: [
                            {"id":controller.previousWarehousesOrdersModel!.data!.items![index].id},
                            {"isRefund":false},
                          ]);
                        },);
                    },

                  ),
                ),
              ),onLoading:  SpinKitCircle(color:Color(ColorCode.yellow)))
            ]),
      ),
    ));
  }

}
