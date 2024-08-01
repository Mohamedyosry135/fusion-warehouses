import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/shipping_details/presentation/view/widgets/buy_state_order_bottomsheet.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:fusion_warehouses/widgets/appbar_cell.dart';
import 'package:fusion_warehouses/widgets/custom_bottom_sheet.dart';
import 'package:fusion_warehouses/widgets/custom_button.dart';
import 'package:fusion_warehouses/widgets/custom_button_container.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pspdfkit_flutter/pspdfkit.dart';

import '../controllers/shipping_details_controller.dart';
import 'widgets/details_cell.dart';
import 'widgets/order_buy_cell.dart';
import 'widgets/stteper_cell.dart';
import 'dart:math' as math;
class ShippingDetailsView extends GetView<ShippingDetailsController> {
  ShippingDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarItem(
          title: CustomText(AppStrings.externalPurchaseOrder.tr,
              textStyle: TextStyles.textMedium.copyWith(
                  fontSize: 20.sp,
                  height: 1,
                  fontWeight: FontWeight.w500,
                  color: const Color(ColorCode.semiBlack))),
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
          action: [
            if (controller.permissionUser(['admin', 'purchasing_management','purchase_order_complete']))Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: InkWell(
                onTap: () async {
                  if (!controller.didDownloadPDF) {
                    Directory? tempDir = Platform.isAndroid
                        ? await getExternalStorageDirectory() //FOR ANDROID
                        : await getApplicationSupportDirectory();
                    print("tempDir ${tempDir!.path}");
                    controller.download(tempDir!.path +
                        "${controller.purchaseOrderDetails?.data?.number ?? ""}.pdf");
                  } else {
                    Directory? tempDir = await Platform.isAndroid
                        ? await getExternalStorageDirectory() //FOR ANDROID
                        : await getApplicationSupportDirectory();
                    await Pspdfkit.present(tempDir!.path +
                        "${controller.purchaseOrderDetails?.data?.number ?? ""}.pdf");
                  }
                },
                child: AppSVGAssets.getWidget(
                  AppSVGAssets.download,
                ),
              ),
            )
          ]),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: controller.obx(
            (state) => SafeArea(
                    child: Column(children: [
                  controller.isExist(
                          controller.purchaseOrderDetails?.data?.state ?? "")
                      ? StteperItem(
                          currentindex: controller.getIndex(
                              controller.purchaseOrderDetails?.data?.state ??
                                  ""))
                      : CustomText(
                          controller.purchaseOrderDetails?.data?.state?.tr ??
                              "",
                          textStyle: TextStyles.textMedium
                              .copyWith(color: Color(ColorCode.red)),
                        ),


                      if((controller.purchaseOrderDetails?.data?.state == "pending"  || controller.purchaseOrderDetails?.data?.state == "processing" ||
                          controller.purchaseOrderDetails?.data?.state == "purchased" )
                          && controller.permissionUser(['admin', 'purchasing_management']))
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                          child: CustomButtonContainer(
                            CustomButton(
                              CustomText(
                                  controller.statesOrders[controller.purchaseOrderDetails?.data?.state ??""]??"",
                                  textStyle: TextStyles.textMedium.copyWith(
                                      color: const Color(ColorCode.semiBlack),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp)),
                                  () {
                                String valueTitle = ""  ;

                                  if(controller.purchaseOrderDetails?.data?.state == "pending") {
                                    valueTitle = AppStrings.pendingToUnderProcessing;
                                    controller.externalPurchaseOrder.state = "processing";
                                  }
                                  else if(controller.purchaseOrderDetails?.data?.state == "processing") {
                                    valueTitle = AppStrings.processingToPurchased ;
                                    controller.externalPurchaseOrder.state = "purchased";

                                  }else if(controller.purchaseOrderDetails?.data?.state == "purchased") {
                                    valueTitle = AppStrings.purchasedToCompleted;
                                    controller.externalPurchaseOrder.state = "completed";

                                  }
                                if(controller.purchaseOrderDetails?.data?.state == "pending" ||  controller.purchaseOrderDetails?.data?.state == "purchased"){
                                  AwesomeDialog(
                                      context: context,
                                      dialogType:
                                      DialogType.WARNING,
                                      animType: AnimType.SCALE,
                                      title: "",

                                      dismissOnTouchOutside: false,
                                      desc:
                                      valueTitle ??"",
                                      buttonsTextStyle: TextStyles.textMedium.copyWith(
                                          color: Color(ColorCode.semiBlack)
                                      ),
                                      btnOkText: AppStrings.cancel,
                                      btnOkOnPress: () async {

                                      },
                                      btnOkColor:  Color(ColorCode.gray3),

                                      btnCancelColor: Color(ColorCode.yellow),
                                      btnCancelText: AppStrings.confirm,

                                      btnCancelOnPress: () {
                                        controller.updateOrderDetailsState(controller.externalPurchaseOrder,true);

                                      })
                                      .show();
                                }else{
                                  customBottomSheet(
                                      bottomSheetBody: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 32),
                                          child: BuyStateOrderBottomsheet()));
                                }




                              },
                              backGroundColor: const Color(ColorCode.yellow),
                            ),
                            width: Get.width,
                            height: 48.h,
                          ),
                        ),

                  DetailsItem(
                    listDetails: [
                      {
                        "title": AppStrings.purchaseOrderNumber,
                        "value":
                            controller.purchaseOrderDetails?.data?.number ??
                                "" // "EPO-180-23-193",
                      },
                      // {
                      //   "title": AppStrings.sendToWholesalers,
                      //   "value": AppStrings.canNotChangeState,
                      // },
                      {
                        "title": AppStrings.releaseDate,
                        "value":
                            controller.purchaseOrderDetails?.data?.createdAt !=
                                    null
                                ? DateFormat('EEEE, MMM d, yyyy, h:mm a',
                                        AuthService.to.language)
                                    .format(DateTime.parse(
                                    controller.purchaseOrderDetails?.data
                                            ?.createdAt ??
                                        "",
                                  ))
                                : "",
                      }
                    ],
                  ),
                  DetailsItem(
                      widget: CustomText(AppStrings.purchaseOrderManagement.tr,
                          textStyle: TextStyles.textMedium.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: const Color(ColorCode.semiBlack))),
                      listDetails: [
                        {
                          "title": AppStrings.name,
                          "value": controller.purchaseOrderDetails?.data
                                  ?.assignedTo?.name ??
                              "",
                        },
                        {
                          "title": AppStrings.mobileNumber,
                          "value": controller.purchaseOrderDetails?.data
                                  ?.assignedTo?.phone ??
                              "",
                        },
                      ]),
                  DetailsItem(
                      widget: CustomText(AppStrings.releasedBy.tr,
                          textStyle: TextStyles.textMedium.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: const Color(ColorCode.semiBlack))),
                      listDetails: [
                        {
                          "title": AppStrings.name,
                          "value": controller
                                  .purchaseOrderDetails?.data?.user?.name ??
                              "",
                        },
                        {
                          "title": AppStrings.mobileNumber,
                          "value": controller
                                  .purchaseOrderDetails?.data?.user?.phone ??
                              "",
                        },
                      ]),
                  SizedBox(
                    height: 16,
                  ),
                  if (controller.purchaseOrderDetails?.data?.purchaseOrders !=
                          null &&
                      (controller.purchaseOrderDetails?.data?.purchaseOrders
                              ?.isNotEmpty ??
                          false))
                    Container(
                      color: Color(ColorCode.gray4),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 32),
                              child: CustomText(
                                  '${AppStrings.internalPurchaseOrders} (${controller.purchaseOrderDetails?.data?.purchaseOrders?.length ?? 0})',
                                  textStyle: TextStyles.textMedium.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(ColorCode.semiBlack))),
                            ),
                            CarouselSlider(
                              carouselController: controller.carouselController,
                              items: controller
                                  .purchaseOrderDetails?.data?.purchaseOrders
                                  ?.map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return OrderBuyItem(
                                      purchaseOrder: i,
                                    );
                                  },
                                );
                              }).toList(),
                              options: CarouselOptions(
                                autoPlay: false,
                                enlargeCenterPage:false,
                                viewportFraction: 1,
                                enableInfiniteScroll: false,

                                onPageChanged: (index, reason) {
                                  print(index);
                                  controller.current.value = index;
                                  controller.update();
                                },
                                aspectRatio: .62,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                              ),
                            ),

                          ]),
                    ),
                      const SizedBox(
                        height: 10,
                      ),
                    if(controller
                        .purchaseOrderDetails?.data?.purchaseOrders !=null)  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: controller
                            .purchaseOrderDetails!.data!.purchaseOrders!
                            .asMap()
                            .entries
                            .map((entry) {
                          print(entry.value);
                          return Container(
                            width: 8,
                            height: 8,
                            margin: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (controller.current.value ==
                                    entry.key
                                    ? Color(ColorCode.yellow)
                                    : Color(ColorCode.gray6))
                                    ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                ])),
            onLoading: const SpinKitCircle(
              color: Color(ColorCode.yellow),
            )),
      ),
    );
  }
}
