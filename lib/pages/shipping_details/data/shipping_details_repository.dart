
import 'dart:convert';

import 'package:fusion_warehouses/base/base_repositroy.dart';
import 'package:fusion_warehouses/pages/shipping_details/data/shipping_details_api_provider.dart';
import 'package:fusion_warehouses/pages/shipping_details/models/buy_stock_model_request.dart';
import 'package:fusion_warehouses/pages/shipping_details/models/purchase_order_details_model.dart';
import 'package:fusion_warehouses/pages/shipping_details/models/purchase_order_mode_update.dart';
import 'package:fusion_warehouses/pages/shipping_details/models/suppliers_model.dart';
import 'package:fusion_warehouses/pages/shipping_details/models/update_state_purchase_order_request.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';


abstract class IShippingDetailsRepository {
  Future<PurchaseOrderDetails> getOrderDetails(int id);
  Future<PurchaseOrderModelUpdateStock> updateStockRecieved(int id,String num);
  Future<PurchaseOrderDetails> updateStateOrder(int id,UpdateStatePurchaseOrderRequest updateStatePurchaseOrderRequest,bool state);
  Future<SuppliersModel> getSuppliers();

  Future<PurchaseOrderModelUpdateStock> buyStock(int id,BuyStockModel buyStockModel);
  Future<PurchaseOrderModelUpdateStock> refundStock(int id,String num);

}

class ShippingDetailsRepository extends BaseRepository implements IShippingDetailsRepository {
  ShippingDetailsRepository({required this.provider});
  final IShippingDetailsProvider provider;

  @override
  Future<PurchaseOrderDetails> getOrderDetails(int id) async{
    print("ere");
    final apiResponse = await provider.getOrderDetails(id);
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
  Future<PurchaseOrderModelUpdateStock> updateStockRecieved(int id, String num)async {
    print("ere");
    final apiResponse = await provider.updateStockRecieved(id, num);
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
  Future<PurchaseOrderDetails> updateStateOrder(int id, UpdateStatePurchaseOrderRequest updateStatePurchaseOrderRequest, bool state) async{
    print("ere");
    final apiResponse = await provider.updateStateOrder(id, updateStatePurchaseOrderRequest, state);
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
  Future<SuppliersModel> getSuppliers() async{
    print("ere");
    final apiResponse = await provider.getSuppliers();
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
  Future<PurchaseOrderModelUpdateStock> buyStock(int id, BuyStockModel buyStockModel) async{
    print("ere");
    final apiResponse = await provider.buyStock(id, buyStockModel);
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
  Future<PurchaseOrderModelUpdateStock> refundStock(int id, String num) async{
    print("ere");
    final apiResponse = await provider.refundStock(id, num);
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
