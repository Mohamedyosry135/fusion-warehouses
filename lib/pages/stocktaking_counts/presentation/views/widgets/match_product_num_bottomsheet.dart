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

class MatchProductNumBottomsheet extends GetView<StocktakingCountsController> {
  String warehouseName;
  int warehouseId;
  int index;
  int? slotId;
  MatchProductNumBottomsheet({required this.warehouseName, required this.warehouseId, required this.index});

  @override
  Widget build(BuildContext context) {
    controller.actualAmountController.text = "";
    if(index != -1){
      if(controller.productsInStocks!.productPhysicalInventories![index].realStock != null){
        controller.actualAmountController.text = controller.productsInStocks!.productPhysicalInventories![index].realStock.toString();
      }
      slotId = controller.productsInStocks!.productPhysicalInventories![index].productInventoryId;
    }
    return SingleChildScrollView(
      child: Padding(
        
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Divider(
              height: 1,
              color: Color(ColorCode.gray3),
            ),
            CustomText(
              AppStrings.system,
              textStyle: TextStyles.textMedium.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(ColorCode.semiBlack)
              ),
            ),
            CustomTextFieldContainer(
              CustomTextFormField(
                key: const ValueKey("system"),
                hint:      AppStrings.system
                ,
                label: "",
                enable: true,
                controller: TextEditingController(text: "${controller.productsInStocks!.productPhysicalInventories![index].stock ??0}"),
                textInputAction: TextInputAction.next,
                nextFocus: (v) {},
                onSave: (String? value) {},
                inputType: TextInputType.number,
              ),
            ),


            CustomText(
              AppStrings.theInventory,
              textStyle: TextStyles.textMedium.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(ColorCode.semiBlack)
              ),
            ),
            CustomTextFieldContainer(
              CustomTextFormField(
                key: const ValueKey("theInventory"),
                hint:       AppStrings.theInventory
                ,
                label: "",
                enable: true,
                controller: TextEditingController(text:controller.storagePlaceController.text = controller.productsInStocks!.productPhysicalInventories![index].physicalStock.toString()),
                textInputAction: TextInputAction.next,
                nextFocus: (v) {},
                onSave: (String? value) {},
                inputType: TextInputType.number,
              ),
            ),

            CustomText(
              AppStrings.actual,
              textStyle: TextStyles.textMedium.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(ColorCode.semiBlack)
              ),
            ),
            CustomTextFieldContainer(
              CustomTextFormField(
                key: const ValueKey("actualAmountController"),
                hint: AppStrings.actual,
                label: "",
                enable: !(controller.statusStock! == "done") ,
                controller: controller.actualAmountController,
                textInputAction: TextInputAction.next,
                nextFocus: (v) {},
                onSave: (String? value) {},
                inputType: TextInputType.number,
              ),
            ),

            const SizedBox(
              height: 12,
            ),
            if((controller.statusStock! == "done"))
            CustomButtonContainer(
              CustomButton(
                CustomText(AppStrings.confirm,
                    textStyle: TextStyles.textMedium.copyWith(
                        color: const Color(ColorCode.semiBlack),
                        fontWeight: FontWeight.w500,
                        fontSize: 16)),
                () {
                  if(controller.actualAmountController.text.isEmpty){
                    Get.snackbar("", AppStrings.allFieldsRequired);
                  }else{
                    Get.back();
                    controller.matchProduct( int.parse(controller.actualAmountController.text), controller.productsInStocks?.id ??0 ,slotId);
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
