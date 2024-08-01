import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/stocktaking_counts/presentation/controllers/stocktaking_counts_controller.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/widgets/custom_button.dart';
import 'package:fusion_warehouses/widgets/custom_button_container.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:fusion_warehouses/widgets/custom_text_field_container.dart';
import 'package:fusion_warehouses/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';

class EnterProductNumBottomsheet extends GetView<StocktakingCountsController> {
  String warehouseName;
  int warehouseId;
  int index;
  int? slotId;
  EnterProductNumBottomsheet({required this.warehouseName, required this.warehouseId, required this.index});

  @override
  Widget build(BuildContext context) {
    controller.storagePlaceController.text = "";
    controller.amountController.text = "";
    if(index != -1){
      controller.amountController.text = controller.productsInStocks!.productPhysicalInventories![index].physicalStock.toString();
      controller.storagePlaceController.text = controller.productsInStocks!.productPhysicalInventories![index].physicalStoragePlace.toString();
      slotId = controller.productsInStocks!.productPhysicalInventories![index].productInventoryId;
    }
    return SingleChildScrollView(
      child: Padding(
        
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            titleRow(AppStrings.productNumber,
                controller.productsInStocks?.partNumber ?? ""),
            const SizedBox(
              height: 12,
            ),
            const Divider(
              color: Color(ColorCode.gray3),
              height: 1,
            ),
            const SizedBox(
              height: 12,
            ),
            titleRow(
                AppStrings.productName, controller.productsInStocks?.name ?? ""),
            const SizedBox(
              height: 12,
            ),
            const Divider(
              color: Color(ColorCode.gray3),
              height: 1,
            ),
            const SizedBox(
              height: 12,
            ),
            titleRow(AppStrings.warehouse, warehouseName ?? ""),
            const SizedBox(
              height: 12,
            ),
            CustomTextFieldContainer(
              CustomTextFormField(
                key: const ValueKey("amount"),
                hint: AppStrings.amount,
                label: "",
                controller: controller.amountController,
                textInputAction: TextInputAction.next,
                nextFocus: (v) {},
                onSave: (String? value) {},
                inputType: TextInputType.number,
              ),
            ),
            CustomTextFieldContainer(
              CustomTextFormField(
                key: const ValueKey("storagePlace"),
                hint: AppStrings.storagePlace,
                label: "",
                controller: controller.storagePlaceController,
                textInputAction: TextInputAction.next,
                nextFocus: (v) {},
                onSave: (String? value) {},
                inputType: TextInputType.text,
              ),
            ),

            const SizedBox(
              height: 12,
            ),
            CustomButtonContainer(
              CustomButton(
                CustomText(AppStrings.confirm,
                    textStyle: TextStyles.textMedium.copyWith(
                        color: const Color(ColorCode.semiBlack),
                        fontWeight: FontWeight.w500,
                        fontSize: 16)),
                () {
                  if(controller.amountController.text.isEmpty){
                    Get.snackbar("", AppStrings.allFieldsRequired);
                  }else{
                    Get.back();
                    controller.updateProduct(controller.id!, warehouseId, controller.storagePlaceController.text, int.parse(controller.amountController.text), controller.productsInStocks?.id ??0 ,slotId);
                  }
                },
                backGroundColor: const Color(ColorCode.yellow),
              ),
              width: Get.width,
              height: 48,
            )
          ],
        ),
      ),
    );
  }

  titleRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          title,
          textStyle: TextStyles.textMedium.copyWith(
            fontSize: 12,
            color: const Color(ColorCode.semiBlack),
            fontWeight: FontWeight.w400,
          ),
        ),
        CustomText(
          value,
          textStyle: TextStyles.textMedium.copyWith(
            fontSize: 12,
            color: const Color(ColorCode.secondryGray),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
