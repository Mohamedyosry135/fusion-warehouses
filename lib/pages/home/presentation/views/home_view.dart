import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/home/presentation/controllers/home_controller.dart';
import 'package:fusion_warehouses/pages/home/presentation/views/widgets/cards_home.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/routes/app_pages.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:get/get.dart';

import '../../../../widgets/custom_text.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(ColorCode.lightGray),
      appBar: AppBar(
        backgroundColor: const Color(ColorCode.white),
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              AppStrings.hello,
              textStyle:
                  TextStyles.textSmall.copyWith(fontWeight: FontWeight.w500),
            ),
            CustomText(
              "${AuthService.to.userInfo?.data?.user?.name ?? ""}",
              textStyle: TextStyles.textMedium.copyWith(
                  fontWeight: FontWeight.w500, height: 1, fontSize: 18),
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AppSVGAssets.getWidget(AppSVGAssets.storageManagement),
                  SizedBox(
                    width: 8,
                  ),
                  CustomText(
                    AppStrings.storageManagement,
                    textStyle: TextStyles.textMedium
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CardHome(
                      color: Color(ColorCode.red),
                      title: AppStrings.dailyShippingList,
                      icon: AppSVGAssets.getWidget(AppSVGAssets.dailyShipping),
                      onTap: () {
                        if (controller.permissionUser(
                            ['admin', 'purchase_order_complete'])) {
                          Get.rootDelegate.toNamed(Routes.SHIPPING_DAILY);
                        } else {
                          Get.snackbar("", AppStrings.youDontHaveAccess,duration: Duration(milliseconds: 700));
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: CardHome(
                      color: Color(ColorCode.blue),
                      title: AppStrings.deliverWarehouses,
                      icon: AppSVGAssets.getWidget(AppSVGAssets.warehouse),
                      onTap: () {
                        if (controller.permissionUser(['admin', 'warehouses_delivery'])) {
                          Get.rootDelegate.toNamed(Routes.WAREHOUSES);
                        } else {
                          Get.snackbar("", AppStrings.youDontHaveAccess,duration: Duration(milliseconds: 700));
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CardHome(
                      color: Color(ColorCode.orange2),
                      title: AppStrings.returns,
                      icon: AppSVGAssets.getWidget(AppSVGAssets.returns),
                      onTap: () {
                        if (controller
                            .permissionUser(['admin', 'warehouses_delivery'])) {
                          Get.rootDelegate.toNamed(
                            Routes.RETURNS,
                          );
                        } else {
                          Get.snackbar("", AppStrings.youDontHaveAccess,duration: Duration(milliseconds: 700));
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: CardHome(
                      color: Color(ColorCode.lightBlue),
                      title: AppStrings.stocktaking,
                      icon: AppSVGAssets.getWidget(AppSVGAssets.stocktaking),
                      onTap: () {
                        if (controller
                            .permissionUser(['admin', 'stocktaking'])) {
                          Get.rootDelegate.toNamed(
                            Routes.STOCKTAKING,
                          );
                        } else {
                          Get.snackbar("", AppStrings.youDontHaveAccess,duration: Duration(milliseconds: 700));
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              controller.obx(
                  (state) => InkWell(
                        onTap: () async {
                          FlutterBarcodeScanner.scanBarcode("#ff6666",
                                  AppStrings.cancel, true, ScanMode.BARCODE)
                              .then((value) {
                            print(
                                "runtimeTyperuntimeType ${value.runtimeType}");
                            print("runtimeTyperuntimeType ${value}");

                            if (value.toString() == "-1" || value == "null") {
                            } else {
                              controller.getProductDetails(value);
                            }
                          });
                        },
                        child: Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Color(ColorCode.yellow),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  AppSVGAssets.getWidget(
                                      AppSVGAssets.barcodeRead),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  CustomText(
                                    AppStrings.productData,
                                    textStyle: TextStyles.textMedium.copyWith(
                                      color: const Color(ColorCode.semiBlack),
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      ),
                  onLoading: SpinKitCircle(color: Color(ColorCode.yellow))),
              SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AppSVGAssets.getWidget(AppSVGAssets.shoppingCart),
                  SizedBox(
                    width: 8,
                  ),
                  CustomText(
                    AppStrings.purchaseManagement,
                    textStyle: TextStyles.textMedium
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CardHome(
                      color: Color(ColorCode.darkGreen),
                      title: AppStrings.foreignPurchaseOrders,
                      icon: AppSVGAssets.getWidget(
                          AppSVGAssets.outPurchaseOrders),
                      onTap: () {
                        if (controller
                            .permissionUser(['admin', 'purchase_order_complete','purchasing_management','external_purchase_order_complete','sales_manager'])) {
                          Get.rootDelegate.toNamed(Routes.PURCHASE_MANAGEMENT);

                        } else {
                          Get.snackbar("", AppStrings.youDontHaveAccess,duration: Duration(milliseconds: 700));
                        }
                      },
                    ),
                  )
                ],
              ),
              SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
