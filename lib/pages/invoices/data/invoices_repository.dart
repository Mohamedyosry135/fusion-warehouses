
import 'dart:convert';

import 'package:fusion_warehouses/base/base_repositroy.dart';
import 'package:fusion_warehouses/pages/barcode/data/barcode_provider.dart';
import 'package:fusion_warehouses/pages/invoices/data/invoices_provider.dart';
import 'package:fusion_warehouses/pages/invoices/models/warehouse_order_details.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';

import '../models/order_invoice_model.dart';


abstract class IInvoicesRepository {
  Future<WarehousesOrdersDetailsModel> getWarehousesOrderDetails(int id);

  Future<WarehousesOrdersDetailsModel> editStateOfOrder(int id);

  Future<OrderInvoiceModel> getOrderInvoice(int id);

}

class InvoicesRepository extends BaseRepository implements IInvoicesRepository {
  InvoicesRepository({required this.provider});
  final InvoicesProvider provider;

  @override
  Future<WarehousesOrdersDetailsModel> getWarehousesOrderDetails(int id) async{
    print("ere");
    final apiResponse = await provider.getWarehousesOrderDetails(id);
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

  @override
  Future<OrderInvoiceModel> getOrderInvoice(int id) async{
    print("ere");
    final apiResponse = await provider.getOrderInvoice(id);
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

  @override
  Future<WarehousesOrdersDetailsModel> editStateOfOrder(int id) async{
    print("ere");
    final apiResponse = await provider.editStateOfOrder(id);
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

