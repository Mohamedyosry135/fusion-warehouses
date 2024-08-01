import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/invoices/presentation/controllers/invoices_controller.dart';
import 'package:fusion_warehouses/resources/assets_generated.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:get/get.dart';

class DataView extends GetView<InvoicesController> {
  DataView({Key? key, this.ontab}) : super(key: key);
  Function? ontab;

  @override
  Widget build(BuildContext context) {
    return  controller.obx((state) => Column(children: [
      returnTitleValue(AppStrings.orderValue, "${controller.orderInvoice?.data?.totalBeforeDiscount ??0} ${AppStrings.rs}"),
      returnTitleValue(AppStrings.discountOnProducts, "${controller.orderInvoice?.data?.totalDiscount ??0} ${AppStrings.rs}"),
      returnTitleValue(AppStrings.totalDiscount, "${controller.orderInvoice?.data?.totalDiscountAfterRefund ??0} ${AppStrings.rs}"),
      returnTitleValue(AppStrings.shippingValue, "${controller.orderInvoice?.data?.shippingInfo?.shippingFees ??0} ${AppStrings.rs}"),
      returnTitleValue(AppStrings.totalAfterDiscount, "${controller.orderInvoice?.data?.totalAfterDiscount ??0} ${AppStrings.rs}"),
      returnTitleValue(AppStrings.valueAddedTax, "${controller.orderInvoice?.data?.totalTaxValue ??0} ${AppStrings.rs}"),

      Divider(),
      Padding(
        padding: const EdgeInsetsDirectional.only(start: 16,end: 16,bottom: 30),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(AppStrings.total,
                textStyle: TextStyles.textMedium.copyWith(
                  fontSize: 18,
                  color: Color(ColorCode.semiBlack),
                  fontWeight: FontWeight.w600,
                )),
            CustomText("${controller.orderInvoice?.data?.total ??0} ${AppStrings.rs}",
                textStyle: TextStyles.textMedium.copyWith(
                  color: Color(ColorCode.semiBlack),
                  fontSize: 18,

                  fontWeight: FontWeight.w600,
                )),

          ],),
      ),

    ],),onLoading: const SpinKitCircle(color:Color(ColorCode.yellow)))
    ;
  }

  returnTitleValue(String title, String value){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          CustomText(title,
              textStyle: TextStyles.textMedium.copyWith(
                fontSize: 16,
                color: Color(ColorCode.semiBlack),
                fontWeight: FontWeight.w500,
              )),
          CustomText( value,
              textStyle: TextStyles.textMedium.copyWith(
                fontSize: 16,
                color: Color(ColorCode.semiBlack),
                fontWeight: FontWeight.w500,
              )),

        ],),
    );
  }
}
