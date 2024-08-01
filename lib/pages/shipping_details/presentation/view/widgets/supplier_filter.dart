import 'package:flutter/material.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/shipping_details/presentation/controllers/shipping_details_controller.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/presentation/controllers/Stocktaking_details_controller.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/widgets/custom_field_bottomsheet.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:get/get.dart';

class SuppliersListFilter extends GetView<ShippingDetailsController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<ShippingDetailsController>(builder: (cont) {
      return CustomTextBottomsheetWidget(
        cellValue: controller.selectedSupplier == null
            ? AppStrings.supplier
            : controller.selectedSupplier?.name ?? "",
        cellTitle: AppStrings.supplier,
        cellWidget:  Column(

          children: [
            InkWell(
              onTap: (){
                controller.selectedSupplier = null;
                Get.back();
                controller.update();
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                color: Color(ColorCode.white),
                child: CustomText(
                  AppStrings.supplier,
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
                  itemCount: controller.suppliersModel?.data
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
                            controller.selectedSupplier = controller.suppliersModel?.data
                                ?.items?[index];
                            controller.supplierController.text = controller.suppliersModel?.data
                                ?.items?[index].name ??"";
                            controller.update();
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(12),
                            color: Color(ColorCode.white),
                            child: CustomText(
                              controller.suppliersModel?.data
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
