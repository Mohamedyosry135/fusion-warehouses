import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/pages/notifications/notification_model.dart';
import 'package:fusion_warehouses/pages/notifications/presentation/controllers/notifications_controller.dart';
import 'package:fusion_warehouses/resources/assets_generated.dart';
import 'package:fusion_warehouses/resources/assets_svg_generated.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/routes/app_pages.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../widgets/custom_text.dart';

class NotificationsView extends GetView<NotificationsController> {
  NotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(ColorCode.lightGray),
        appBar: AppBar(
          title: CustomText(
            AppStrings.notification,
            textStyle: TextStyles.textXLarge.copyWith(
                fontSize: 20.sp,
                color: const Color(ColorCode.semiBlack),
                fontWeight: FontWeight.w500),
          ),
          automaticallyImplyLeading: false,
          elevation: 0.0,
          backgroundColor: const Color(ColorCode.white),
        ),
        body: controller.obx(
          (state) => Container(
            margin: EdgeInsets.only(bottom: 60),
            padding: EdgeInsets.all(1.r),
            child: controller.notificationsModel == null
                ? const SpinKitCircle(color: Colors.yellow)
                :(controller.notificationsModel?.data?.notificationItems?.isEmpty ??true) ?
            RefreshIndicator(
                  onRefresh: () async{ controller.onInit();},
                  child: ListView(
                    children: [
                      SizedBox(height: Get.height*.25,),
                      Container(
                        alignment: Alignment.center,
                        width: 100,height: 100,
                        child: const Image(
                          image: AppAssets.empty,
                        ),
                      ),
                      Center(child: CustomText(AppStrings.noNotification),),
                    ],
                  ),
                ):NotificationListener<ScrollNotification>(
                    onNotification: (scrollNotification) {
                      if (scrollNotification is ScrollEndNotification) {
                        if (controller.scrollController.value.position.pixels ==
                            controller.scrollController.value.position
                                .maxScrollExtent) {
                          print("hello");
                          if (controller.page <
                              controller.notificationsModel!.data!.pagination!
                                  .totalPages!) {
                            controller.page++;
                            print(
                                "controller.pageNumber.value ${controller.page}");
                            controller.getNotifications(controller.page);
                          }
                          // controller.getMoreMessagesSearch(args);
                        }
                      }
                      return true;
                    },
                    child: RefreshIndicator(
                      onRefresh: () async {
                        controller.page = 1;
                        controller.notificationsModel = null;
                        await controller.getNotifications(1);
                      },
                      child: ListView(
                        children: [
                          ListView.builder(
                            controller: controller.scrollController.value,
                            itemCount: controller.notificationsModel?.data
                                    ?.notificationItems?.length ??
                                0,
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  print(controller
                                      .notificationsModel!
                                      .data!
                                      .notificationItems![index]
                                      .payload!
                                      .orderId!);
                                  Get.rootDelegate.toNamed(
                                    Routes.INVOICE_DETAILS,
                                    arguments: [{
                                      'id': controller
                                          .notificationsModel!
                                          .data!
                                          .notificationItems![index]
                                          .payload!
                                          .orderId!
                                    }],
                                  );
                                },
                                child: notificationItem(controller
                                    .notificationsModel!
                                    .data!
                                    .notificationItems![index]),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
          onLoading: const Center(
            child: SpinKitCircle(
              color: Color(ColorCode.yellow),
            ),
          ),
          onError: (error) =>
              Center(child: CustomText(AppStrings.noNotification)),
        ));
  }

  notificationItem(NotificationItem notificationItems) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.all(16.r),
      margin: EdgeInsets.only(bottom: 4, right: 16, left: 16, top: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color:  notificationItems.seen!
              ? Color(ColorCode.white)
              : Color(0xff52FFCD12).withOpacity(.32  ),
          ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Expanded(child:  Row(
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Container(
               padding: EdgeInsets.all(8.r),
               decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   color: Color(notificationItems.seen!
                       ? ColorCode.secondryblueGray
                       : ColorCode.yellow)),
               child: AppSVGAssets.getWidget(AppSVGAssets.notification,
                   color: Color(ColorCode.black)),
             ),
             SizedBox(
               width: 12.w,
             ),
             Expanded(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   CustomText(
                     notificationItems.payload?.contents ?? "",
                     maxLines: 1,
                     textStyle: TextStyles.textXLarge.copyWith(
                         fontSize: 14.sp,overflow: TextOverflow.ellipsis,
                         color: const Color(ColorCode.semiBlack),
                         fontWeight: FontWeight.w500),
                   ),
                   SizedBox(
                     height: 4.h,
                   ),
                   CustomText(
                     DateFormat('yyyy/MM/dd hh:mm a', AuthService.to.language)
                         .format(DateTime.parse(
                         DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
                             .parse(notificationItems.createdAt ?? "")
                             .toString())),
                     textStyle: TextStyles.textXLarge.copyWith(
                         fontSize: 14.sp,
                         color: const Color(ColorCode.secondryGray),
                         fontWeight: FontWeight.w400),
                   ),
                 ],
               ),
             ),
           ],
         ),),
          AppSVGAssets.getWidget(
              AuthService.to.language == 'ar'
                  ? AppSVGAssets.leftBack
                  : AppSVGAssets.back,
              color: const Color(ColorCode.semiBlack))
        ],
      ),
    );
  }
}
