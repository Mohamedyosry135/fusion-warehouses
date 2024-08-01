import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/stocktaking/presentation/controllers/Stocktaking_controller.dart';
import 'package:fusion_warehouses/pages/stocktaking/presentation/views/widgets/filter_stock_widget.dart';
import 'package:fusion_warehouses/pages/stocktaking_counts/presentation/controllers/stocktaking_counts_controller.dart';
import 'package:fusion_warehouses/pages/stocktaking_counts/presentation/views/widgets/enter_product_num_bottomsheet.dart';
import 'package:fusion_warehouses/pages/stocktaking_counts/presentation/views/widgets/match_product_num_bottomsheet.dart';
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
import 'dart:math' as math;
class StocktakingCountsView extends GetView<StocktakingCountsController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarItem(

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
              (state) => RefreshIndicator(
                onRefresh: () async {
                  controller.onInit();
                },
                child: (controller.warehouses?.data?.items?.isEmpty ??
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
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (context, index) {
                          print("hello ${controller.countedAmountBefore(controller.warehouses?.data?.items?[index].id ??-1) }" );
                          int foundedIndex =  controller.countedAmountBefore(controller.warehouses?.data?.items?[index].id ??-1);
                          return InkWell(
                            onTap: () {
                              try{
                                controller.statusStock =="started" ? customBottomSheet(
                                    backgroundColor: ColorCode.white,
                                    bottomSheetBody: EnterProductNumBottomsheet(warehouseName: controller.warehouses?.data?.items?[index].name ??"", warehouseId: controller.warehouses?.data?.items?[index].id ??0,index:controller.countedAmountBefore(controller.warehouses?.data?.items?[index].id ??-1))
                                ) :
                                controller.productsInStocks!.productPhysicalInventories![foundedIndex].physicalStock!=null ?
                                customBottomSheet(
                                    backgroundColor: ColorCode.white,
                                    bottomSheetBody: MatchProductNumBottomsheet(warehouseName: controller.warehouses?.data?.items?[index].name ??"", warehouseId: controller.warehouses?.data?.items?[index].id ??0,index:controller.countedAmountBefore(controller.warehouses?.data?.items?[index].id ??-1))
                                ) : null
                                ;
                              }catch(e){
                                print("mfish el index dh");
                              }

                            },
                            child:  Container(
                              padding: const EdgeInsets.all(16.0),

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    controller.warehouses?.data?.items?[index].name ??"",
                                    textStyle: TextStyles.textMedium.copyWith(
                                      fontSize: 18,
                                      color: Color(ColorCode.semiBlack),
                                      fontWeight: FontWeight.w500,
                                    ),),
                                  foundedIndex == -1? Transform(
                                    alignment: Alignment.center,
                                    transform: AuthService.to.language == 'ar'
                                        ? Matrix4.rotationY(0)
                                        : Matrix4.rotationY(math.pi),
                                    child: AppSVGAssets.getWidget(AppSVGAssets.yellowLeftArrow),
                                  ) : Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: controller.statusStock =="started" ? Color(ColorCode.yellow):  controller.productsInStocks!.productPhysicalInventories![foundedIndex].realStock ==null ? Color(ColorCode.red) : Color(ColorCode.yellow)
                                    ),
                                    child: Center(
                                      child: CustomText(
                                          controller.productsInStocks!.productPhysicalInventories![foundedIndex].realStock ==null ?controller.productsInStocks!.productPhysicalInventories![foundedIndex].physicalStock.toString() : "${ controller.productsInStocks!.productPhysicalInventories![foundedIndex].realStock ??0}",
                                        textStyle: TextStyles.textMedium.copyWith(
                                          height: 1
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
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
                            controller.warehouses?.data?.items?.length ??
                                0,
                      ),
              ),
              onLoading: SpinKitCircle(
                color: Color(ColorCode.yellow),
              )),
        ));
  }
}
