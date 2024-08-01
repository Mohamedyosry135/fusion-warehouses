// ignore: one_member_abstracts

import 'package:fusion_warehouses/base/base_auth_provider.dart';
import 'package:fusion_warehouses/consts/urls.dart';
import 'package:fusion_warehouses/pages/invoices/models/order_invoice_model.dart';
import 'package:fusion_warehouses/pages/invoices/models/warehouse_order_details.dart';
import 'package:get/get.dart';


abstract class IInvoicesProvider {
  Future<Response<WarehousesOrdersDetailsModel>> getWarehousesOrderDetails(int id);
  Future<Response<WarehousesOrdersDetailsModel>> editStateOfOrder(int id);

  Future<Response<OrderInvoiceModel>> getOrderInvoice(int id);

}

class InvoicesProvider extends BaseAuthProvider implements IInvoicesProvider {
  @override
  Future<Response<WarehousesOrdersDetailsModel>> getWarehousesOrderDetails(int id) async{
    Response<WarehousesOrdersDetailsModel> resp = await  get<WarehousesOrdersDetailsModel>(
      "${EndPoints.WAREHOUSES_ORDERS}/$id",

      decoder: WarehousesOrdersDetailsModel.fromJson,
    );
    print("get");
    print("lol${resp.bodyString}");

    return resp;
  }

  @override
  Future<Response<OrderInvoiceModel>> getOrderInvoice(int id) async{
    Response<OrderInvoiceModel> resp = await  get<OrderInvoiceModel>(
      "${EndPoints.INVOICES}/$id",

      decoder: OrderInvoiceModel.fromJson,
    );
    print("get");
    print("lol${resp.bodyString}");

    return resp;
  }

  @override
  Future<Response<WarehousesOrdersDetailsModel>> editStateOfOrder(int id)async {
    Response<WarehousesOrdersDetailsModel> resp = await  put<WarehousesOrdersDetailsModel>(
      "${EndPoints.WAREHOUSES_ORDERS}/$id",
      {
        "warehouse_order": {
          "status": "completed"
        }
      },
      decoder: WarehousesOrdersDetailsModel.fromJson,
    );
    print("get");
    print("lol${resp.bodyString}");

    return resp;
  }

}
