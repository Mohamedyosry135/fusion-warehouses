import 'package:flutter/material.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/models/product_of_stock_model.dart';
import 'package:fusion_warehouses/pages/warehouse_delivery/models/warehouses_orders_model.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:fusion_warehouses/widgets/return_key.dart';

class ProductStockCard extends StatelessWidget {
  ProductStockCard({Key? key,this.ontab,required this.number,required this.title, required this.type, required this.started, required this.productsInStocks}) : super(key: key);
  Function? ontab;
  String number;
  String title;
  String type;
  String started;

  ProductsInStocks productsInStocks;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,),
      margin: EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () {
          ontab!();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Color(ColorCode.white)
          ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),

                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(number,
                              textStyle: TextStyles.textMedium.copyWith(
                                fontSize: 16,
                                color: Color(ColorCode.semiBlack),
                                fontWeight: FontWeight.w500,
                              )),

                          Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CustomText(title,
                                    textAlign: TextAlign.start,
                                    textStyle: TextStyles.textMedium.copyWith(
                                      fontSize: 18,
                                      color: Color(ColorCode.semiBlack),
                                      fontWeight: FontWeight.w500,
                                    )),
                              ),
                              started == "started" ?
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Color(ColorCode.yellow),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Center(
                                    child: CustomText(
                                     AppStrings.warehouses,
                                      textStyle: TextStyles.textMedium.copyWith(
                                          height: 1,
                                        fontSize: 12,
                                        color: Color(ColorCode.semiBlack),
                                        fontWeight: FontWeight.w400
                                      ),
                                    ),
                                  ),
                                ) : SizedBox()

                            ],
                          ),

                          CustomText(
                              type,
                              textStyle: TextStyles.textMedium.copyWith(
                                fontSize: 12,
                                color: Color(ColorCode.gray),
                                fontWeight: FontWeight.w400,
                              )),
                        ]),
                  ),
                ),

                (started == "done"|| started == "completed" || started == "stock_updated") &&( productsInStocks.productPhysicalInventories?.isNotEmpty ??false)?Icon
                  (Icons.bookmark,color:
              greenOrRed(productsInStocks)  ?
                Color(ColorCode.green): Color(ColorCode.red),

                ):SizedBox()
              ],
            )
        ),
      ),
    );
  }

  greenOrRed(ProductsInStocks productsInStocks){
    for(int i=0; i< (productsInStocks.productPhysicalInventories?.length ??0);i++){
      if(productsInStocks.productPhysicalInventories?[i].realStock == null){
        return false;
      }
    }
    return true;
  }
}
