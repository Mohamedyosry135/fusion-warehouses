import 'package:flutter/material.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/presentation/controllers/Stocktaking_details_controller.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/widgets/custom_field_bottomsheet.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:get/get.dart';

class StockStatusListFilter extends GetView<StocktakingDetailsController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<StocktakingDetailsController>(builder: (cont) {
      return CustomTextBottomsheetWidget(
        cellValue: controller.statusFilter == null
            ? AppStrings.stockStatus
            : controller.statusFilter?.name ?? "",
        cellTitle: AppStrings.brand,
        cellWidget:  Column(

          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: controller.statusStocksList.length
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
                            controller.statusFilter = controller.statusStocksList[index];
                            controller.update();
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(12),
                            color: Color(ColorCode.white),
                            child: CustomText(
                              controller.statusStocksList[index].name ??
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
class StockStatusList {
  String? name;
  String? key;

  StockStatusList({this.name, this.key});

  StockStatusList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['key'] = this.key;
    return data;
  }
}