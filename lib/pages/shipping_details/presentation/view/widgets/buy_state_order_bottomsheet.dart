import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/shipping_details/presentation/controllers/shipping_details_controller.dart';
import 'package:fusion_warehouses/pages/shipping_details/presentation/view/widgets/supplier_filter.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:fusion_warehouses/widgets/custom_button.dart';
import 'package:fusion_warehouses/widgets/custom_button_container.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:fusion_warehouses/widgets/custom_text_field_container.dart';
import 'package:fusion_warehouses/widgets/custom_text_form_field.dart';
import 'package:fusion_warehouses/widgets/date_picker_fn.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:fusion_warehouses/pages/shipping_details/models/update_state_purchase_order_request.dart';


class BuyStateOrderBottomsheet extends GetView<ShippingDetailsController> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CustomText(
                AppStrings.processingToPurchased,
                textStyle: TextStyles.textMedium.copyWith(
                    color: const Color(ColorCode.semiBlack),
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp)),
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(),
          const SizedBox(
            height: 8,
          ),

          CustomText(AppStrings.collectionMethod,
              textStyle: TextStyles.textMedium.copyWith(
                  color: const Color(ColorCode.semiBlack),
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp)),

          Row(
            children: [
              Obx(() =>
                  Row(
                    children: [
                      Radio(
                        value: "cash",
                        groupValue: controller.collectionMethod.value,
                        onChanged: (value) {
                          controller.collectionMethod.value = value!;
                        },
                        activeColor: Color(ColorCode.yellow),
                      ),
                      SizedBox(width: 8,),

                      CustomText(AppStrings.cash,
                          textStyle: TextStyles.textMedium.copyWith(
                              color: const Color(ColorCode.semiBlack),
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp)),


                    ],
                  )),
              SizedBox(width: 12,),
              Obx(() =>
                  Row(
                    children: [

                      Radio(
                        value: "credit",
                        groupValue: controller.collectionMethod.value,
                        onChanged: (value) {
                          controller.collectionMethod.value = value!;
                        },
                        activeColor: Color(ColorCode.yellow),
                      ),
                      SizedBox(width: 8,),
                      CustomText(AppStrings.deferred,
                          textStyle: TextStyles.textMedium.copyWith(
                              color: const Color(ColorCode.semiBlack),
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp)),

                    ],
                  )),
            ],
          )
          ,


          CustomTextFormField(
            onSave: (text) {},
            controller: controller.invoiceNumberController,
            hint: AppStrings.invoiceNumber,
            inputType: TextInputType.number,
            label: AppStrings.invoiceNumber,


          ),
          CustomTextFormField(
            onSave: (text) {},
            controller: controller.totalInvoiceMoneyController,
            hint: AppStrings.totalInvoice,
            inputType: TextInputType.number,
            label: AppStrings.totalInvoice,
          ),

          CustomTextFieldContainer(
            CustomTextFormField(
              onSave: (text) {},
              hint: AppStrings.invoiceDate,
              inputType: TextInputType.text,
              label: AppStrings.invoiceDate,
              enable: true,
              controller: controller.invoiceDateController,
              suffixIcon: AppSVGAssets.getWidget(AppSVGAssets.date),
              onTap: () async {
                controller.invoiceDatetime = await showDatePickerFNForInvoice(
                    context, controller.invoiceDatetime, true);
                if (controller.invoiceDatetime != null) {
                  controller.invoiceDateRequest =
                      ((controller.invoiceDatetime!.millisecondsSinceEpoch /
                          1000) + controller.invoiceDatetime!.timeZoneOffset
                          .inSeconds).toString();

                  controller.invoiceDateController.text =
                      DateFormat('EEEE, MMM d, yyyy', AuthService.to.language)
                          .format(controller.invoiceDatetime!);
                }
              },
            ),
          ),

          Obx(() =>
          controller.collectionMethod.value == "credit"
              ? CustomTextFieldContainer(
            CustomTextFormField(
              onSave: (text) {},
              hint: AppStrings.deferredDate,
              inputType: TextInputType.text,
              label: AppStrings.deferredDate,
              enable: true,
              controller: controller.payInvoiceDateController,
              suffixIcon: AppSVGAssets.getWidget(AppSVGAssets.date),
              onTap: () async {
                controller.defferedDatetime =
                await showDatePickerFNForInvoice(
                    context, controller.defferedDatetime, false);
                if (controller.defferedDatetime != null) {
                  controller.defferedDateRequest = ((controller
                      .defferedDatetime!.millisecondsSinceEpoch / 1000) +
                      controller.defferedDatetime!.timeZoneOffset.inSeconds)
                      .toString();

                  controller.payInvoiceDateController.text =
                      DateFormat('EEEE, MMM d, yyyy', AuthService.to.language)
                          .format(controller.defferedDatetime!);
                }
              },
            ),
          )
              : SizedBox()
          ),

          SuppliersListFilter(),

          GetBuilder<ShippingDetailsController>(builder: (cont) {
            return Obx(() =>
                CustomTextFormField(
                    hint: '',
                    onSave: (s) {},
                    enable: true,
                    inputType: TextInputType.text,
                    controller: cont.attachementFileController.value,
                    label: AppStrings.attachments,
                    suffixIcon: InkWell(
                      onTap: () {
                        controller.openFileExplore();
                      },
                      child: Container(
                          margin: const EdgeInsets.all(4),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(ColorCode.yellow)),
                          child: CustomText(
                            AppStrings.chooseFile,
                            textStyle: TextStyles.textMedium.copyWith(
                                fontWeight: FontWeight.w400,
                                color: Color(ColorCode.semiBlack),
                                fontSize: 16),
                          )),
                    ),
                    prefixIcon: Obx(
                          () =>
                      cont.attachementFileController.value.text.isEmpty
                          ? SizedBox()
                          : IconButton(
                          onPressed: () {
                            cont.attachementFile = null;
                            cont.attachementFileController.value.text = "";
                            cont.update();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Color(ColorCode.red),
                          )),
                    )));
          }),
          // controller.dateTime =
          //     await showDatePickerFN(context, controller.dateTime);
          const SizedBox(
            height: 32,
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 48.h,
                  width: double.infinity,
                  child: CustomButton(
                    CustomText(AppStrings.confirm,
                        textStyle: TextStyles.textMedium.copyWith(
                            color: const Color(ColorCode.semiBlack),
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp)),
                        () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      print(controller.invoiceNumberController.text);
                      print(controller.totalInvoiceMoneyController.text);
                      print(controller.supplierController.text);
                      print(controller.invoiceDateController.text);

                      if (
                          controller.invoiceNumberController.text.isNotEmpty &&
                          controller.totalInvoiceMoneyController.text.isNotEmpty &&
                          controller.supplierController.text.isNotEmpty &&
                          controller.invoiceDateController.text.isNotEmpty
                      ) {
                        if (controller.attachementFile != null) {
                          List<int> imageBytes = controller.attachementFile!
                              .readAsBytesSync();
                          String base64Image = base64Encode(imageBytes);
                          controller.externalPurchaseOrder
                              .attachmentsAttributes = [
                            AttachmentsAttributes(
                                file: ("data:application/pdf;base64,") +
                                    base64Image,
                                name: "1676999753014")
                          ];
                        }

                        controller.externalPurchaseOrder.paymentType = controller.collectionMethod.value;
                        controller.externalPurchaseOrder.state = "purchased";
                        controller.externalPurchaseOrder.purchasedInvoiceNumber = controller.invoiceNumberController.text;
                        controller.externalPurchaseOrder.productSupplierId = controller.selectedSupplier?.id;
                        controller.externalPurchaseOrder.purchasedInvoiceDate = controller.invoiceDateRequest;
                        controller.externalPurchaseOrder.purchasedPrice = double.tryParse(controller.totalInvoiceMoneyController.text);

                        if (controller.collectionMethod.value == "cash") {
                          controller.updateOrderDetailsState(
                              controller.externalPurchaseOrder, false);
                          Get.back();

                        } else {
                          if (controller.payInvoiceDateController.text.isNotEmpty) {
                            controller.externalPurchaseOrder
                                .purchasedInvoiceDueDate =
                                controller.defferedDateRequest;
                            controller.updateOrderDetailsState(
                                controller.externalPurchaseOrder, false);
                            Get.back();
                          }
                          else {
                            print("fsdf");
                            Get.snackbar("", AppStrings.allFieldsRequired);
                          }
                        }
                      } else {
                        print("fsdf12");

                        Get.snackbar("", AppStrings.allFieldsRequired);
                      }
                    },
                    backGroundColor: const Color(ColorCode.yellow),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: SizedBox(
                  height: 48.h,
                  child: CustomButton(
                    CustomText(AppStrings.cancel,
                        textStyle: TextStyles.textMedium.copyWith(
                            color: const Color(ColorCode.white),
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp)),
                        () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      Get.back();
                    },
                    backGroundColor: const Color(ColorCode.red),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
