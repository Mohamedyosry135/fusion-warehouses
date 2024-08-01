import 'package:flutter/material.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/presentation/controllers/Stocktaking_details_controller.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/widgets/custom_field_bottomsheet.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:get/get.dart';

class BrandListFilter extends GetView<StocktakingDetailsController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<StocktakingDetailsController>(builder: (cont) {
      return CustomTextBottomsheetWidget(
        cellValue: controller.brandFilter == null
            ? AppStrings.allBrands
            : controller.brandFilter?.name ?? "",
        cellTitle: AppStrings.brand,
        cellWidget:  Column(

          children: [
            InkWell(
              onTap: (){
                controller.brandFilter = null;
                Get.back();
                controller.update();
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                color: Color(ColorCode.white),
                child: CustomText(
                  AppStrings.allBrands,
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
                  itemCount: controller.productBrands?.data
                      ?.items?.length ??
                      0,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [

                        InkWell(
                          onTap: () {
                            Get.back();
                            controller.brandFilter = controller.productBrands?.data
                                ?.items?[index];
                            controller.update();
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(12),
                            color: Color(ColorCode.white),
                            child: CustomText(
                              controller.productBrands?.data
                                  ?.items?[index].name ??
                                  "",
                              textAlign: TextAlign.start,
                              textStyle: TextStyles.textMedium.copyWith(
                                  color: Color(ColorCode.semiBlack),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      );
    });
  }
}
