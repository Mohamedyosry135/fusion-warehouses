import 'package:flutter/material.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/warehouse_delivery/models/warehouses_orders_model.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:fusion_warehouses/widgets/return_key.dart';

class DeliverReturnCell extends StatelessWidget {
  DeliverReturnCell({Key? key,required this.item, this.ontab,this.icon,required this.isReturn}) : super(key: key);
  Function? ontab;
  Widget ?icon;
  bool isReturn;
final WarehouseOrderDetails item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 16),
      child:Container(
        padding: EdgeInsets.symmetric(horizontal: 16,),
        child: InkWell(
          onTap: () {
            ontab!();
          },
          child: Card(

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(top:8 ),
                      child: AppSVGAssets.getWidget(AppSVGAssets.personal),
                    ),
                    const  SizedBox(width: 16,),

                    Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [CustomText(
                                "${AppStrings.dialNumber} ",
                                textStyle: TextStyles.textMedium.copyWith(
                                    color: Color(ColorCode.semiBlack),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),

                                CustomText(
                                  "${item.number??""}",
                                  textStyle: TextStyles.textMedium.copyWith(
                                      color: Color(ColorCode.semiBlack),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                                ),],
                            ),

                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                CustomText(
                                    item.invoice?.customer?.customerName ??"" ,
                                    textStyle: TextStyles.textMedium.copyWith(
                                      fontSize: 12,
                                      color: Color(ColorCode.gray),
                                      fontWeight: FontWeight.w500,
                                    )),
                                icon!,

                              ],),

                            // CustomText(
                            // returnOrderStatus(item.status ??""),
                            //     textStyle: TextStyles.textMedium.copyWith(
                            //       fontSize: 12,
                            //       color: Color(ColorCode.gray),
                            //       fontWeight: FontWeight.w500,
                            //     )),
                            RichText(
                              maxLines: 2,
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: SizedBox(width: 4),
                                  ),
                                  TextSpan(
                                    text: "${item.warehouseOrderItems?.length ??"0"}",
                                    style: TextStyles.textMedium.copyWith(
                                        color: Color(ColorCode.semiBlack),
                                        fontSize: 12.sp,
                                        height: 1.5,
                                        fontWeight: FontWeight.w500),
                                  ),




                                  TextSpan(
                                    text: AppStrings.products,
                                    style: TextStyles.textMedium.copyWith(
                                        color: Color(ColorCode.semiBlack),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500),
                                  ),

                                ],
                              ),
                            ),
                          ]),
                    ),
                  ],)
            ),
          ),
        ),
      )
    );
  }
}
