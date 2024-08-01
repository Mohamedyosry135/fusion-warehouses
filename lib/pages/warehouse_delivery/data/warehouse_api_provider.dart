// ignore: one_member_abstracts
import 'package:fusion_warehouses/base/base_auth_provider.dart';
import 'package:fusion_warehouses/consts/urls.dart';
import 'package:fusion_warehouses/pages/warehouse_delivery/models/warehouses_orders_model.dart';
import 'package:get/get.dart';


abstract class IWarehousesProvider {
  Future<Response<WarehousesOrdersModel>> getWarehousesOrder(int page,String type, String status);

}

class WarehousesProvider extends BaseAuthProvider implements IWarehousesProvider {
  @override
  Future<Response<WarehousesOrdersModel>> getWarehousesOrder(int page, String type, String status)async {
    Response<WarehousesOrdersModel> resp = await  get<WarehousesOrdersModel>(
      "${EndPoints.WAREHOUSES_ORDERS}",
      query: {
        'status':status,
        'type':type,
        'page': page.toString()
      },
      decoder: WarehousesOrdersModel.fromJson,
    );
    print("get");
    print("lol${resp.bodyString}");

    return resp;
  }

}
