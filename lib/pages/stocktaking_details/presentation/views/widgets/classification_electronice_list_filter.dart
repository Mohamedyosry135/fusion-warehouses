import 'package:flutter/material.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/presentation/controllers/Stocktaking_details_controller.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/widgets/custom_field_bottomsheet.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:get/get.dart';

class ClassificationElectronicListFilter extends GetView<StocktakingDetailsController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<StocktakingDetailsController>(builder: (cont) {
      return CustomTextBottomsheetWidget(
        cellValue:
        controller.supportTicketTypeItemFilter == null
            ? AppStrings.classificationElectronicCounter
            : controller.supportTicketTypeItemFilter?.name ?? "",
        cellTitle: AppStrings.classificationElectronicCounter,
        cellWidget: Column(
          children: [
            InkWell(
              onTap: (){
                controller.supportTicketTypeItemFilter = null;
                Get.back();
                controller.update();
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                color: Color(ColorCode.white),
                child: CustomText(
                  AppStrings.classificationElectronicCounter,
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
                  itemCount: controller.supportTicketTypes?.data?.items?.length
                      ??
                      0,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [

                        InkWell(
                          onTap: () {
                            Get.back();
                            controller.supportTicketTypeItemFilter = controller.supportTicketTypes?.data?.items?[index];
                            controller.update();
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(12),
                            color: Color(ColorCode.white),
                            child: CustomText(
                              controller.supportTicketTypes?.data?.items?[index].name ??
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
