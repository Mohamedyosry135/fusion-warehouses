import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/daily_shipping_list/presentation/view/widgets/search_view.dart';
import 'package:fusion_warehouses/pages/shipping_details/presentation/view/widgets/details_cell.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/presentation/controllers/Stocktaking_details_controller.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/presentation/views/widgets/filter_products_bottomsheet.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/presentation/views/widgets/product_stock_widget.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/presentation/views/widgets/stepper_item_stocktaking.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/routes/app_pages.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:fusion_warehouses/widgets/appbar_cell.dart';
import 'package:fusion_warehouses/widgets/custom_bottom_sheet.dart';
import 'package:fusion_warehouses/widgets/custom_button.dart';
import 'package:fusion_warehouses/widgets/custom_button_container.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'dart:math' as math;
class StocktakingDetailsView extends GetView<StocktakingDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarItem(
          title: CustomText(AppStrings.stocktaking,
              textStyle: TextStyles.textMedium.copyWith(
                  fontSize: 20,
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
        ),
        body: controller.obx(
            (state) => NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollEndNotification) {
                  if (controller
                      .scrollController.value.position.pixels ==
                      controller.scrollController.value.position
                          .maxScrollExtent) {
                    print("hello");
                    if (controller.page <
                        (controller.productsOfStock?.data?.pagination?.totalPages??121222)) {
                      controller.page++;
                      print(
                          "controller.pageNumber.value ${controller.page}");
                      controller
                          .getProductsOfStock(controller.id!,controller.page,10,controller.barCodeSearch,controller.categoryFilterId,controller.supportTicketTypeId,controller.availableFilter,controller.barndId);
                    }
                  }
                }
                return true;
              },
              child: RefreshIndicator(
                    onRefresh: () async {
                      controller.onInit();
                    },
                    child: ListView(
                      controller: controller.scrollController.value,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: ScrollPhysics(),
                      children: [
                        StepperItemStocktaking(currentindex: controller.getIndex(controller.stocktakingDetails?.data?.status??"")),

                        if(controller.getIndex(controller.stocktakingDetails?.data?.status??"")!=4)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: CustomButtonContainer(
                            CustomButton(
                              CustomText(
                                  controller.stateNameMap[controller.stocktakingDetails?.data?.status??""]??"",
                                  textStyle: TextStyles.textMedium.copyWith(
                                      color: const Color(ColorCode.semiBlack),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp)),
                              () {
                                int index = controller.getIndex(controller.stocktakingDetails?.data?.status??"");
                                  String valueTitle = ""  ;
                                if(index == 0){
                                  controller.chanegStockStatus(context);
                                }else{
                                  if(index ==1) {
                                    valueTitle = AppStrings.warning1;
                                  }else if(index ==2) {
                                 valueTitle = AppStrings.warning2;

                                  }else if(index ==3) {
                                    valueTitle = AppStrings.warning3;
                                  }
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
                                        controller.chanegStockStatus(context);

                                      })
                                      .show();
                                }


                              },
                              backGroundColor: const Color(ColorCode.yellow),
                            ),
                            width: Get.width,
                            height: 48.h,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          color: Color(ColorCode.gray4),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CarouselSlider(
                                  carouselController: controller.carouselController,
                                  items: [
                                    if(controller.stocktakingDetails?.data?.stockUpdatedBy != null)
                                      DetailsItem(
                                        listDetails: [
                                          {
                                            "title": AppStrings.status,
                                            "value":AppStrings.stockAdjustment // "EPO-180-23-193",
                                          },
                                          {
                                            "title": AppStrings.dateCreated,
                                            "value": DateFormat('EEEE, MMM d, yyyy, h:mm a',AuthService.to.language).format(DateTime.parse(
                                              controller.stocktakingDetails?.data?.stockUpdatedAt ?? "",)),
                                          },
                                          {
                                            "title": AppStrings.by,
                                            "value":  controller.stocktakingDetails?.data?.stockUpdatedBy?.name ??"",
                                          },
                                          {
                                            "title": AppStrings.phoneNumber,
                                            "value":  controller.stocktakingDetails?.data?.stockUpdatedBy?.phone ??"",
                                          }
                                        ],
                                      ),

                                    if(controller.stocktakingDetails?.data?.completeBy != null)
                                      DetailsItem(
                                        listDetails: [
                                          {
                                            "title": AppStrings.status,
                                            "value":AppStrings.adoptionInventoryResult // "EPO-180-23-193",
                                          },
                                          {
                                            "title": AppStrings.dateCreated,
                                            "value": DateFormat('EEEE, MMM d, yyyy, h:mm a',AuthService.to.language).format(DateTime.parse(
                                              controller.stocktakingDetails?.data?.completedAt ?? "",)),
                                          },
                                          {
                                            "title": AppStrings.by,
                                            "value":  controller.stocktakingDetails?.data?.completeBy?.name ??"",
                                          },
                                          {
                                            "title": AppStrings.phoneNumber,
                                            "value":  controller.stocktakingDetails?.data?.completeBy?.phone ??"",
                                          }
                                        ],
                                      ),

                                    if(controller.stocktakingDetails?.data?.doneBy != null)
                                      DetailsItem(
                                        listDetails: [
                                          {
                                            "title": AppStrings.status,
                                            "value":AppStrings.submitToMatch // "EPO-180-23-193",
                                          },
                                          {
                                            "title": AppStrings.dateCreated,
                                            "value": DateFormat('EEEE, MMM d, yyyy, h:mm a',AuthService.to.language).format(DateTime.parse(
                                              controller.stocktakingDetails?.data?.endsAt ?? "",)),
                                          },
                                          {
                                            "title": AppStrings.by,
                                            "value":  controller.stocktakingDetails?.data?.doneBy?.name ??"",
                                          },
                                          {
                                            "title": AppStrings.phoneNumber,
                                            "value":  controller.stocktakingDetails?.data?.doneBy?.phone ??"",
                                          }
                                        ],
                                      ),

                                    if(controller.stocktakingDetails?.data?.startedBy != null)
                                      DetailsItem(
                                        listDetails: [
                                          {
                                            "title": AppStrings.status,
                                            "value":AppStrings.startInventory // "EPO-180-23-193",
                                          },
                                          {
                                            "title": AppStrings.dateCreated,
                                            "value": DateFormat('EEEE, MMM d, yyyy, h:mm a',AuthService.to.language).format(DateTime.parse(
                                              controller.stocktakingDetails?.data?.startedAt ?? "",)),
                                          },
                                          {
                                            "title": AppStrings.by,
                                            "value":  controller.stocktakingDetails?.data?.startedBy?.name ??"",
                                          },
                                          {
                                            "title": AppStrings.phoneNumber,
                                            "value":  controller.stocktakingDetails?.data?.startedBy?.phone ??"",
                                          }
                                        ],
                                      ),

                                    if(controller.stocktakingDetails?.data?.createdBy != null)
                                      DetailsItem(
                                        listDetails: [
                                          {
                                            "title": AppStrings.status,
                                            "value":AppStrings.created // "EPO-180-23-193",
                                          },
                                          {
                                            "title": AppStrings.dateCreated,
                                            "value": DateFormat('EEEE, MMM d, yyyy, h:mm a',AuthService.to.language).format(DateTime.parse(
                                              controller.stocktakingDetails?.data?.createdAt ?? "",)),
                                          },
                                          {
                                            "title": AppStrings.by,
                                            "value":  controller.stocktakingDetails?.data?.createdBy?.name ??"",
                                          },
                                          {
                                            "title": AppStrings.phoneNumber,
                                            "value":  controller.stocktakingDetails?.data?.createdBy?.phone ??"",
                                          }
                                        ],
                                      ),
                                  ],
                                  options: CarouselOptions(
                                    autoPlay: true,
                                    enlargeCenterPage:false,
                                    // viewportFraction: 1,
                                    enableInfiniteScroll: false,

                                    onPageChanged: (index, reason) {
                                      print(index);
                                      controller.current.value = index;
                                      controller.update();
                                    },
                                    aspectRatio: 2.2,
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                  ),
                                ),

                              ]),
                        ),


                        if(controller.stocktakingDetails?.data?.expiresAt != null)
                        DetailsItem(
                          widget: CustomText(
                              AppStrings.inventoryData,
                              textStyle: TextStyles.textMedium.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(ColorCode.semiBlack))),
                          listDetails: [
                            {
                              "title": AppStrings.endDate,
                              "value": DateFormat('EEEE, MMM d, yyyy',AuthService.to.language).format(DateTime.parse(
                                controller.stocktakingDetails?.data?.expiresAt ?? "",)), // "EPO-180-23-193",
                            },
                            {
                              "title": AppStrings.branch,
                              "value": AuthService.to.language == "ar" ?controller.stocktakingDetails?.data?.shopBranch?.names?.ar ??""  : controller.stocktakingDetails?.data?.shopBranch?.names?.en ??"",
                            },
                            {
                              "title": AppStrings.category,
                              "value": AuthService.to.language == "ar" ? (controller.stocktakingDetails?.data?.productCategory?.translations?[1].name ??AppStrings.all_categories2) : controller.stocktakingDetails?.data?.productCategory?.translations?[0].name ??AppStrings.all_categories2,
                            }
                          ],
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText("${AppStrings.productsInventory} (${controller.productsOfStock?.data?.items?.length ??0})",
                                  textStyle: TextStyles.textMedium.copyWith(
                                    fontSize: 16,
                                    color: Color(ColorCode.semiBlack),
                                    fontWeight: FontWeight.w500,
                                  )),
                              Row(
                                children: [
                                  InkWell(
                                      onTap: () async {
                                        String? barCode = await customBottomSheet(
                                            bottomSheetBody: Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 16, vertical: 32),
                                                child: SearchView()));
                                        if(barCode!= null){
                                          controller.barCodeSearch = barCode;
                                          controller.page = 1;

                                          controller.getProductsOfStock(controller.id!,controller.page,10, controller.barCodeSearch,controller.categoryFilterId,controller.supportTicketTypeId,controller.availableFilter,controller.barndId);
                                        }
                                      },
                                      child: AppSVGAssets.getWidget(
                                          AppSVGAssets.search)),
                                  InkWell(
                                      onTap: () {
                                        customBottomSheet(
                                            bottomSheetBody: const Padding(
                                                padding:
                                                EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                                child: FilterProductsWidget()));
                                      },
                                      child: AppSVGAssets.getWidget(
                                          AppSVGAssets.filter,
                                          width: 60,
                                          height: 60)),
                                ],
                              )
                            ],
                          ),
                        ),
                        if(controller.productsOfStock != null&& (controller.productsOfStock?.data?.items?.isNotEmpty ?? false))
                            ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ProductStockCard(
                              ontab: () {
                                if(controller.stocktakingDetails?.data?.status == 'started' || controller.stocktakingDetails?.data?.status =="done"|| controller.stocktakingDetails?.data?.status =="completed" || controller.stocktakingDetails?.data?.status =="stock_updated" ){
                                  controller.page = 1;
                                  Get.rootDelegate.toNamed(Routes.STOCK_TAKING_COUNTS, arguments: [
                                    {"id":controller.stocktakingDetails?.data?.id},
                                    {"index":index},
                                    {"status":controller.stocktakingDetails?.data?.status},

                                  ]);
                                }
                              },
                              number: controller.productsOfStock?.data?.items?[index].partNumber ??"",
                              title:controller.productsOfStock?.data?.items?[index].name ??"",
                              type: controller.productsOfStock?.data?.items?[index].category?.name ??"",
                              started:controller.stocktakingDetails?.data?.status ??"pending",
                                productsInStocks:controller.productsOfStock!.data!.items![index]
                            );
                          },
                          itemCount: controller.productsOfStock?.data?.items?.length ??0,

                        ),

                        const SizedBox(height: 12,)
                      ],
                    ),
                  ),
            ),
            onLoading: const SpinKitCircle(
              color: Color(ColorCode.yellow),
            )));
  }
}
