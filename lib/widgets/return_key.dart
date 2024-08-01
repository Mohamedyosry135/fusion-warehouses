import 'package:fusion_warehouses/resources/strings_generated.dart';

String returnOrderStatus(String orderStatus) {

  print("orderStatusorderStatus ${orderStatus}");
  return orderStatus == "waiting_payment" ? AppStrings.waitingPayment
      : orderStatus == "waiting_payment_confirmation" ?AppStrings.waitingPaymentConfirmation
      :orderStatus == "completed" ?AppStrings.completed
      : orderStatus == "cancelled" ? AppStrings.cancelled
      : orderStatus == "payment_confirmed" ? AppStrings.paymentConfirmed
      : orderStatus == "processing" ? AppStrings.processing
      : orderStatus == "on_way" ? AppStrings.onWay
      : orderStatus == "delivered" ? AppStrings.delivered
      : AppStrings.pending;
}