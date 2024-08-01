import 'package:flutter/material.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';

import '../../../../../consts/colors.dart';

class ProductStockShippingCard extends StatelessWidget {
   ProductStockShippingCard({Key? key, this.numberId,required this.title,required this.state ,required this.productNumber, required this.color,required this.productName, required this.date, required this.onTap,required this.showSupplierName}) : super(key: key);
  final String state;
    String? numberId;

  final String title;
  final String date;
  final String productName;
  final String productNumber;
  final Color color;
  final bool showSupplierName;
  final Function()? onTap;
  Map<String,String> statesOrders =
  {'':AppStrings.all,
    'pending':AppStrings.pending,
    'processing':AppStrings.processing,
    'purchased':AppStrings.purchased,
    'completed':AppStrings.completed,
    'cancelled':AppStrings.cancelled,
    'rejected':AppStrings.rejected};

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
    margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
color: Color(ColorCode.white),
        borderRadius: BorderRadius.circular(12.0),

      ),
      child: InkWell(
        onTap: onTap,

        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(numberId != null)
                CustomText(numberId ??"",
                    textAlign: TextAlign.start,
                    textStyle: TextStyles.textMedium.copyWith(
                      fontSize: 18,

                      color: Color(ColorCode.semiBlack),
                      fontWeight: FontWeight.bold,
                    )),
              Row(
                children: [
                  CustomText('${title}',
                      textStyle: TextStyles.textMedium.copyWith(
                        fontSize: 12,
                        color: Color(ColorCode.semiBlack),
                        fontWeight: FontWeight.w400,
                      )),

                  CustomText(productNumber,
                      textStyle: TextStyles.textMedium.copyWith(
                        fontSize: 12,
                        color: color,//Color(ColorCode.red),
                        fontWeight: FontWeight.w400,
                      )),
                ],
              ),
              SizedBox(
                height: 2,
              ),
              if(showSupplierName)
              CustomText(productName,
                  textAlign: TextAlign.start,
                  textStyle: TextStyles.textMedium.copyWith(
                    fontSize: 18,

                    color: Color(ColorCode.semiBlack),
                    fontWeight: FontWeight.w500,
                  )),

              CustomText(
                  statesOrders[state??""] ??"",//'10-01-2021 . 08:00 م',
                  textStyle: TextStyles.textMedium.copyWith(
                    fontSize: 12,
                    color: Color(ColorCode.gray),
                    fontWeight: FontWeight.w400,
                  )),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AppSVGAssets.getWidget(AppSVGAssets.clock),
                  SizedBox(width: 8,),
                  CustomText(
                      date,//'10-01-2021 . 08:00 م',
                      textStyle: TextStyles.textMedium.copyWith(
                        fontSize: 12,
                        color: Color(ColorCode.gray),
                        fontWeight: FontWeight.w400,
                      )),
                ],
              )
            ]),
      ),
    );
  }
}
