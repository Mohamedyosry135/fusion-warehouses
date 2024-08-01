// ignore: one_member_abstracts
import 'package:fusion_warehouses/base/base_auth_provider.dart';
import 'package:fusion_warehouses/consts/urls.dart';
import 'package:fusion_warehouses/pages/login/model/individual.dart';
import 'package:fusion_warehouses/pages/notifications/notification_model.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:get/get.dart';


abstract class INotificationsProvider {
  Future<Response<NotificationsModel>> getNotifications(int index);

}

class NotificationsProvider extends BaseAuthProvider implements INotificationsProvider {
  @override
  Future<Response<NotificationsModel>> getNotifications(int index) {
    return get<NotificationsModel>(
      "${EndPoints.NOTIFICATIONS}",
      query: {
        "page":index.toString()
      },
      decoder: NotificationsModel.fromJson,
    );
  }

}
