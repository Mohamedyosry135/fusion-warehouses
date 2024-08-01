import 'package:flutter/material.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/presentation/controllers/Stocktaking_details_controller.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/widgets/custom_field_bottomsheet.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:get/get.dart';

class CategoriesListFilter extends GetView<StocktakingDetailsController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<StocktakingDetailsController>(builder: (cont) {
      return CustomTextBottomsheetWidget(
        cellValue: controller.categoryFilter == null
            ? AppStrings.allCategories
            : controller.categoryFilter?.name ?? "",
        cellTitle: AppStrings.category,
        cellWidget: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  controller.categoryFilter = null;
                  Get.back();
                  controller.update();
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  color: Color(ColorCode.white),
                  child: CustomText(
                    AppStrings.allCategories,
                    textAlign: TextAlign.start,
                    textStyle: TextStyles.textMedium.copyWith(
                        color: Color(ColorCode.semiBlack),
                        fontWeight: FontWeight.w500,
                        fontSize: 22),
                  ),
                ),
              ),

              Expanded(
                child: ListView.builder(
                    itemCount: controller.productCategories?.data?.items?.length ?? 0,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              if ((controller.productCategories?.data?.items?[index]
                                      .children?.isEmpty ??
                                  true)) {
                                Get.back();
                                controller.categoryFilter =
                                    controller.productCategories?.data?.items?[index];
                                controller.update();
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(12),
                              color: (controller.productCategories?.data
                                          ?.items?[index].children?.isEmpty ??
                                      true)
                                  ? Color(ColorCode.white)
                                  : Color(ColorCode.secondryblueGray),
                              child: CustomText(
                                controller.productCategories?.data?.items?[index]
                                        .name ??
                                    "",
                                textAlign: TextAlign.start,
                                textStyle: TextStyles.textMedium.copyWith(
                                    color: Color(ColorCode.semiBlack),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                          ListView.builder(
                              itemCount: controller.productCategories?.data
                                      ?.items?[index].children?.length ??
                                  0,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, i) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                        controller.categoryFilter = controller
                                            .productCategories
                                            ?.data
                                            ?.items?[index]
                                            .children?[i];
                                        controller.update();
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.all(12),
                                        color: Color(ColorCode.white),
                                        child: CustomText(
                                          controller.productCategories?.data
                                                  ?.items?[index].children?[i].name ??
                                              "",
                                          textAlign: TextAlign.start,
                                          textStyle: TextStyles.textMedium.copyWith(
                                              color: Color(ColorCode.semiBlack),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      );
    });
  }
}
