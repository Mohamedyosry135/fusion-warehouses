import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/pages/purshase_management/presentation/controllers/purchase_management_controller.dart';
import 'package:fusion_warehouses/pages/stocktaking/presentation/controllers/Stocktaking_controller.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/widgets/custom_field_bottomsheet.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:get/get.dart';

class StateStockFilterWidget extends GetView<StocktakingController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<StocktakingController>(builder: (cont) {
      return CustomTextBottomsheetWidget(
        cellValue: cont.statusFilter.value,
        cellTitle: AppStrings.state,
        cellWidget: ListView.separated(
            itemCount: controller.listFilter.length,
            itemBuilder: (context,index){
          return InkWell(
              onTap: (){
                controller.statusFilter.value = controller.listFilter[index];
                print("controller.statusFilter.value ${controller.statusList[controller.statusFilter.value]}");
                controller.update();
                Get.back();
              },
              child: Container(

                padding: EdgeInsets.all(22),
                child: CustomText(
                    controller.listFilter[index],
                  textAlign: TextAlign.start,
                ),
              ));
        }, separatorBuilder: (BuildContext context, int index) { return Divider(
          height: 1,
          color: Color(ColorCode.gray3),
        ); },),
      );
    });
  }
}
