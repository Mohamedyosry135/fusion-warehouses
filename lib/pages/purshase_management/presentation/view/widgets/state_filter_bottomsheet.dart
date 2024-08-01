import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/pages/purshase_management/presentation/controllers/purchase_management_controller.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/widgets/custom_field_bottomsheet.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:get/get.dart';

class StateFilterWidget extends GetView<PurchaseManagementController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<PurchaseManagementController>(builder: (cont) {
      return CustomTextBottomsheetWidget(
        cellValue: cont.statesOrders[cont.stateOrder] ??"",
        cellTitle: AppStrings.state,
        cellWidget: ListView.separated(
          itemCount: cont.statesKeys.length,
          itemBuilder: (context,index){
            return InkWell(
                onTap: (){
                  cont.stateOrder = cont.statesKeys![index];
                  print("controller.statusFilter.value ${cont.statesOrders[cont.statesKeys[index]]}");
                  cont.update();
                  Get.back();
                },
                child: Container(

                  padding: EdgeInsets.all(22),
                  child: CustomText(
                    cont.statesOrders[cont.statesKeys[index]] ??"",
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