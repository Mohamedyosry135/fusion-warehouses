import 'package:flutter/material.dart';
import 'package:fusion_warehouses/pages/login/data/login_repository.dart';
import 'package:fusion_warehouses/pages/login/model/individual.dart';
import 'package:fusion_warehouses/pages/notifications/data/notifications_repository.dart';
import 'package:fusion_warehouses/pages/notifications/notification_model.dart';
import 'package:fusion_warehouses/routes/app_pages.dart';
import 'package:get/get.dart';


class NotificationsController extends SuperController<bool> {
  NotificationsController({required this.notificationsRepository});

  final INotificationsRepository notificationsRepository;
  Rx<ScrollController> scrollController = ScrollController().obs;
  int page = 1;
  NotificationsModel? notificationsModel;
  @override
  void onInit() async{
    // TODO: implement onInit
    change(false, status: RxStatus.loading());
    page = 1;
    await getNotifications(1);
    change(true, status: RxStatus.success());

    super.onInit();
  }


  getNotifications(int page){

    if(page == 1){
      notificationsRepository.getNotifications(page).then((value) {
        notificationsModel = value;
        print(notificationsModel!.toJson());
        change(true, status: RxStatus.success());

      }).onError((error, stackTrace) {
        change(true, status: RxStatus.error());
        Get.snackbar("", error.toString());
      });

      change(true, status: RxStatus.success());
    }else{
      change(false,status:  RxStatus.loadingMore());
      notificationsRepository.getNotifications(page).then((value) {
        notificationsModel!.data!.notificationItems!.addAll(value.data!.notificationItems!);
        change(true, status: RxStatus.success());

      }).onError((error, stackTrace) {
        change(true, status: RxStatus.success());
        Get.snackbar("", error.toString());
      });

      change(true, status: RxStatus.success());
    }


  }
  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }
}
