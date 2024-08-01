import 'package:flutter/material.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/invoices/presentation/controllers/invoices_controller.dart';
import 'package:fusion_warehouses/pages/warehouse_delivery/models/warehouses_orders_model.dart';
import 'package:fusion_warehouses/resources/assets_generated.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:get/get.dart';

class ProductView extends GetView<InvoicesController> {
  ProductView({Key? key,required this.warehouseOrderItem,   this.ontab,this.row}) : super(key: key);
  Function? ontab;
  Widget ?row;
  final WarehouseOrderItems warehouseOrderItem;
  @override
  Widget build(BuildContext context) {
    print("warehouseOrderItem ${warehouseOrderItem.mainImage ??""}");
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(onTap: (){

          ontab!();
        },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                  "${warehouseOrderItem.mainImage}",
                height: 56,
                width: 56,
                fit: BoxFit.fill,

                errorBuilder: (context, error,s)=>SizedBox(
                    height: 56,
                    width: 56,
                    child: Icon(Icons.error)),
              ),
              const  SizedBox(width: 8,),

              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(warehouseOrderItem.name??"",
                          textStyle: TextStyles.textMedium.copyWith(
                            fontSize: 12,
                            color: Color(ColorCode.semiBlack),
                            fontWeight: FontWeight.w400,
                          )),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText("${(warehouseOrderItem.unitPrice??1) * (warehouseOrderItem.quantity??1)} ${AppStrings.rs}",
                              textStyle: TextStyles.textMedium.copyWith(
                                fontSize: 12,

                                color: Color(ColorCode.semiBlack),
                                fontWeight: FontWeight.w400,
                              )),
                          row!,
                        ],),
                      RichText(
                        maxLines: 2,
                        text: TextSpan(
                          children: [

                            TextSpan(
                              text: AppStrings.quantity,
                              style: TextStyles.textMedium.copyWith(
                                  color: Color(ColorCode.semiBlack),
                                  fontSize: 12.sp,
                                  height: 1,
                                  fontWeight: FontWeight.w500),
                            ),

                            TextSpan(
                              text: "${warehouseOrderItem.quantity ??0}",
                              style: TextStyles.textMedium.copyWith(
                                  color: Color(ColorCode.semiBlack),
                                  fontSize: 12.sp,
                                  height: 1.5,
                                  fontWeight: FontWeight.w500),
                            ),
                            WidgetSpan(
                              child: SizedBox(width: 4),
                            ),






                          ],
                        ),
                      ),

                    ]),
              ),
            ],),
        ),
      ),
      Divider()
    ],) ;
  }
}
