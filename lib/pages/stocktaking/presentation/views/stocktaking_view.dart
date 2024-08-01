import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/stocktaking/presentation/controllers/Stocktaking_controller.dart';
import 'package:fusion_warehouses/pages/stocktaking/presentation/views/widgets/filter_stock_widget.dart';
import 'package:fusion_warehouses/resources/assets_generated.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/routes/app_pages.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:fusion_warehouses/widgets/appbar_cell.dart';
import 'package:fusion_warehouses/widgets/custom_bottom_sheet.dart';
import 'package:fusion_warehouses/widgets/custom_container.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StocktakingView extends GetView<StocktakingController> {
  String dropdownValue = AppStrings.state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarItem(
          action: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  child: AppSVGAssets.getWidget(AppSVGAssets.filter),
                  onTap: () {
                    customBottomSheet(
                        bottomSheetBody: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: FilterStockWidget()));
                  }),
            )
          ],
          title: CustomText(AppStrings.stocktaking,
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
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: controller.obx(
              (state) => NotificationListener<ScrollNotification>(
                    onNotification: (scrollNotification) {
                      if (scrollNotification is ScrollEndNotification) {
                        if (controller.scrollController.value.position.pixels ==
                            controller.scrollController.value.position
                                .maxScrollExtent) {
                          print("hello");
                          if (controller.page <
                              controller
                                  .stockItems!.data!.pagination!.totalPages!) {
                            controller.page++;
                            print(
                                "controller.pageNumber.value ${controller.page}");
                            controller.getStockItems(
                                controller.page,
                                controller.statusList[
                                    controller.statusFilter.value]!);
                          }
                        }
                      }
                      return true;
                    },
                    child: RefreshIndicator(
                      onRefresh: () async {
                        controller.onInit();
                      },
                      child: (controller.stockItems?.data?.items?.isEmpty ??
                              true)
                          ? ListView(
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
                          )
                          : ListView.separated(
                              controller: controller.scrollController.value,
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Get.rootDelegate.toNamed(
                                        Routes.STOCK_DETAILS,
                                        arguments: [
                                          {
                                            "id": controller.stockItems?.data
                                                ?.items?[index].id
                                          }
                                        ]);
                                  },
                                  child: CustomContainer(
                                    branchName: AuthService.to.language == "ar"
                                        ? (controller
                                                .stockItems
                                                ?.data
                                                ?.items?[index]
                                                .shopBranch
                                                ?.names
                                                ?.ar) ??
                                            ""
                                        : controller
                                                .stockItems
                                                ?.data
                                                ?.items?[index]
                                                .shopBranch
                                                ?.names
                                                ?.en ??
                                            "",
                                    todaysStocktaking: controller.stockItems
                                            ?.data?.items?[index].name ??
                                        "",
                                    progress: controller.valueStatus[controller
                                            .stockItems
                                            ?.data
                                            ?.items?[index]
                                            .status ??
                                        ""]!,
                                    date: DateFormat(
                                            'EEEE, MMM d, yyyy',
                                            AuthService.to.language)
                                        .format(DateTime.parse(
                                      controller.stockItems?.data?.items?[index]
                                              .createdAt ??
                                          "",
                                    )),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: 8,
                                );
                              },
                              itemCount:
                                  controller.stockItems?.data?.items?.length ??
                                      0,
                            ),
                    ),
                  ),
              onLoading: SpinKitCircle(
                color: Color(ColorCode.yellow),
              )),
        ));
  }
}
