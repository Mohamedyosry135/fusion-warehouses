import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/warehouse_delivery/presentation/view/widgets/delivery_cell.dart';
import 'package:fusion_warehouses/resources/assets_generated.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/routes/app_pages.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:fusion_warehouses/widgets/appbar_cell.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:get/get.dart';

import '../controllers/returns_controller.dart';
import 'dart:math' as math;
class ReturnsView extends GetView<ReturnsController> {

  ReturnsView({Key? key}) : super(key: key);


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
        title: CustomText(AppStrings.returns,
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

              controller.obx((state) => (controller.currentReturnsOrdersModel
                  ?.data?.items?.isEmpty ??
                  false)
                  ? RefreshIndicator(
                onRefresh: () async {
                  controller.currentPage = 1;
                  await controller.getReturnsOrder(
                      1,
                      "refund","pending");
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
                    if (controller.scrollCurrentReturns.value
                        .position.pixels ==
                        controller.scrollCurrentReturns.value
                            .position.maxScrollExtent) {
                      print("hello");
                      if (controller.currentPage <
                          controller.currentReturnsOrdersModel!.data!
                              .pagination!.totalPages!) {
                        controller.currentPage++;
                        print(
                            "controller.pageNumber.value ${controller.currentPage}");
                        controller.getReturnsOrder(
                            controller.currentPage,
                            "refund","pending");
                      }
                    }
                  }
                  return true;
                },
                child: RefreshIndicator(
                  onRefresh: () async{
                    controller.currentPage = 1;
                    await controller.getReturnsOrder(controller.currentPage,"refund","pending");

                  },
                  child: ListView.builder( physics: BouncingScrollPhysics(),
                      controller: controller.scrollCurrentReturns.value,
                      itemBuilder: (context, index) {
                        return DeliverReturnCell(
                          item: controller.currentReturnsOrdersModel!.data!.items![index],
                          isReturn: true,

                          icon: AppSVGAssets.getWidget(AppSVGAssets.code),ontab: (){
                          Get.rootDelegate.toNamed(Routes.INVOICESES,arguments: [
                            {"id":controller.currentReturnsOrdersModel!.data!.items![index].id},
                            {"isRefund":true},
                          ]);
                        },);
                      },
                      itemCount: controller.currentReturnsOrdersModel?.data?.items?.length ??0),
                ),
              ),
                  onLoading: SpinKitCircle(color:Color(ColorCode.yellow))),



              controller.obx((state) =>
              (controller.previousReturnsOrdersModel
                  ?.data?.items?.isEmpty ??
                  false)
                  ? RefreshIndicator(
                onRefresh: () async {
                  controller.previousPage = 1;
                  await controller.getReturnsOrder(
                      1,
                      "refund","completed");
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
                    if (controller.scrollPreviousReturns.value
                        .position.pixels ==
                        controller.scrollPreviousReturns.value
                            .position.maxScrollExtent) {
                      print("hello");
                      if (controller.previousPage <
                          controller.previousReturnsOrdersModel!.data!
                              .pagination!.totalPages!) {
                        controller.previousPage++;
                        print(
                            "controller.pageNumber.value ${controller.previousPage}");
                        controller.getReturnsOrder(
                            controller.previousPage,
                            "refund","completed");
                      }
                    }
                  }
                  return true;
                },
                child: RefreshIndicator(
                  onRefresh: () async{
                    controller.previousPage = 1;
                    await controller.getReturnsOrder(controller.previousPage,"refund","completed");
                  },

                  child: ListView.builder( physics: BouncingScrollPhysics(),
                    itemCount: controller.previousReturnsOrdersModel?.data?.items?.length ??0,
                    controller: controller.scrollPreviousReturns.value,
                    itemBuilder: (context, index) {
                      return DeliverReturnCell(
                        isReturn: true,

                        item: controller.previousReturnsOrdersModel!.data!.items![index],
                        icon: SizedBox(),
                        ontab: (){

                          Get.rootDelegate.toNamed(Routes.INVOICESES,arguments: [
                            {"id":controller.previousReturnsOrdersModel!.data!.items![index].id},
                            {"isRefund":true},
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
