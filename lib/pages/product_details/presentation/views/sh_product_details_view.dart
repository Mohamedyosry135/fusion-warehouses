import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/product_details/presentation/controllers/bc_product_details_controller.dart';
import 'package:fusion_warehouses/pages/product_details/presentation/controllers/sh_product_details_controller.dart';
import 'package:fusion_warehouses/pages/splash/presentation/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fusion_warehouses/resources/assets_generated.dart';

import 'package:fusion_warehouses/resources/assets_generated.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:fusion_warehouses/widgets/appbar_cell.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';

class ShProductDetailsView extends GetView<ShProductDetailsController> {
  const ShProductDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarItem(
          leading: Transform(
            alignment: Alignment.center,
            transform: AuthService.to.language == 'ar'
                ? Matrix4.rotationY(0)
                : Matrix4.rotationY(math.pi),
            child: InkWell(
              child: AppSVGAssets.getWidget(AppSVGAssets.back),
              onTap: () {
                Get.back();
              },
            ),
          ),
          title: CustomText("${AppStrings.numberOfProduct} ${(controller.productDetailsModel?.data?.items?.isEmpty??true) ?"" : (controller.productDetailsModel?.data?.items?[0].product?.partNumber??"" ) }",
              textStyle: TextStyles.textMedium.copyWith(
                  fontSize: 20.sp,
                  height: 1,
                  fontWeight: FontWeight.w500,
                  color: const Color(ColorCode.semiBlack))),
        ),
        backgroundColor: const Color(ColorCode.white),
        body: controller.obx((state) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleValue(AppStrings.productNumber, "${(controller.productDetailsModel?.data?.items?.isEmpty ??true)? "":controller.productDetailsModel?.data?.items?[0].product?.partNumber ??""} "),
              const Divider(
                height: 2,
                color: Color(ColorCode.secondryblueGray),
              ),


              titleValue(AppStrings.productName,(controller.productDetailsModel?.data?.items?.isEmpty ??true)? "":controller.productDetailsModel?.data?.items?[0].product?.name ??""),
              const Divider(
                height: 2,
                color: Color(ColorCode.secondryblueGray),
              ),
              if (controller
                  .permissionUser(['admin'])) Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: titleValue(AppStrings.purchasePrice, "${(controller.productDetailsModel?.data?.items?.isEmpty ??true)? "":controller.productDetailsModel?.data?.items?[0].product?.purchasePrice ??0} ${AppStrings.rs}")),
                  const VerticalDivider(
                    width: 1,
                    color: Color(ColorCode.secondryblueGray),
                  ),
                  Expanded(
                    child: titleValue(AppStrings.price,  "${(controller.productDetailsModel?.data?.items?.isEmpty ??true)? "":controller.productDetailsModel?.data?.items?[0].product?.price ??0} ${AppStrings.rs}"),
                  )
                ],
              ),
              if (controller
                  .permissionUser(['admin']))  const Divider(
                height: 2,
                color: Color(ColorCode.secondryblueGray),
              ),
              if (controller
                  .permissionUser(['admin']))  titleValue(AppStrings.amount, "${(controller.productDetailsModel?.data?.items?.isEmpty ??true)? "":controller.productDetailsModel?.data?.items?[0].addedStock ??0} "),

              if (controller
                  .permissionUser(['admin']))  const Divider(
                height: 2,
                color: Color(ColorCode.secondryblueGray),
              ),
              if (controller
                  .permissionUser(['admin']))  titleValue(AppStrings.stock, "${(controller.productDetailsModel?.data?.items?.isEmpty ??true)? "":(controller.productDetailsModel?.data?.items?[0].addedStock  ??0) +(controller.productDetailsModel?.data?.items?[0].oldStock  ??0)} "),

              if (controller
                  .permissionUser(['admin'])) const Divider(
                height: 2,
                color: Color(ColorCode.secondryblueGray),
              ),
              if (controller
                  .permissionUser(['admin']))   titleValue(AppStrings.inventoryValue, "${(controller.productDetailsModel?.data?.items?.isEmpty ??true)? "":controller.productDetailsModel?.data?.items?[0].currentStockPrice ??0} "),

              if (controller
                  .permissionUser(['admin']))const Divider(
                height: 2,
                color: Color(ColorCode.secondryblueGray),
              ),

              titleValue(AppStrings.warehouse,"${(controller.productDetailsModel?.data?.items?.isEmpty ??true)? "":controller.productDetailsModel?.data?.items?[0].warehouse?.name ??""} "),

              const Divider(
                height: 2,
                color: Color(ColorCode.secondryblueGray),
              ),

              titleValue(AppStrings.editor,"${(controller.productDetailsModel?.data?.items?.isEmpty ??true)? "":controller.productDetailsModel?.data?.items?[0].updatedBy?.name ??""} "),

              const Divider(
                height: 2,
                color: Color(ColorCode.secondryblueGray),
              ),

              titleValue(AppStrings.editDate, "${(controller.productDetailsModel?.data?.items?.isEmpty ??true)? "":
              DateFormat(
                  'EEEE, MMM d, yyyy, h:mm a',
                  AuthService.to.language)
                  .format(DateTime.parse(
                  controller.productDetailsModel?.data?.items?[0].createdAt ??""
              ))
              } "),
              const Divider(
                height: 2,
                color: Color(ColorCode.secondryblueGray),
              ),
            ],
          ),
        ),onLoading: SpinKitCircle(color: Color(ColorCode.yellow),)));
  }

  titleValue(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, bottom: 12, left: 12, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            title,
            textStyle: TextStyles.textMedium.copyWith(
                color: const Color(ColorCode.gray),
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
          CustomText(
            value,
            textStyle: TextStyles.textMedium.copyWith(
                color: const Color(ColorCode.semiBlack), fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
