import 'dart:convert';

import 'package:fusion_warehouses/base/base_repositroy.dart';
import 'package:fusion_warehouses/pages/notifications/data/notifications_api_provider.dart';
import 'package:fusion_warehouses/pages/notifications/notification_model.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';


abstract class INotificationsRepository {
  Future<NotificationsModel> getNotifications(int index);

}

class NotificationsRepository extends BaseRepository
    implements INotificationsRepository {
  NotificationsRepository({required this.provider});

  final INotificationsProvider provider;

  @override
  Future<NotificationsModel> getNotifications(int index) async{
    print("ere");
    final apiResponse = await provider.getNotifications(index) ;
    // printInfo(info: apiResponse.statusCode.toString());
    print("apiResponse.isOk ${apiResponse.isOk}");
    if(apiResponse.isOk ){
      return apiResponse.body! ;
    }else {
      print("apiResponse.body!.msg ${apiResponse.bodyString!}");
      final responseJson = const JsonDecoder().convert(apiResponse.bodyString!);
      if(responseJson['code'] == 404){
        throw(AppStrings.youDontHaveAccess) ;

      }else{
        throw(responseJson['error'].toString()) ;

      }
    }
  }
}
