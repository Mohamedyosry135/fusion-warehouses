part of 'app_pages.dart';

abstract class Routes {
  static const SPLASH = '/splash';
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const NOTOFICATION = '/notification';

  static const  BOTTOM_NAVIGATION_SCREEN = '/bottomNavigationScreen';
  static const EDIT_PROFILE_VIEW = '/editProfile';
  static const  EDIT_VEHICLE_VIEW = '/editVehicleView';
  static const  DONE_SCREEN = '/doneScreen';
  static const  INVOICE_DETAILS = '/invoiceDetailsView';
  static const  CREATE_INVOICE = '/createInvoice';
  static const  ADD_PRODUCT = '/addProduct';
  static const  DONE_INVOICE_SCREEN = '/doneInvoiceScreen';
  static const  SHIPPING_DAILY = '/shippingDaily';
  static const  BARCODE = '/barcode';
  static const  DETAILS = '/details';
  static const  PURCHASE_MANAGEMENT = '/purchaseManagement';
  static const  WAREHOUSES = '/warehouses';
  static const  RETURNS = '/returns';

  static const  INVOICESES = '/invoiceses';
  static const  PRODUCT_DETAILS = '/productDetails';
  static const NOTIFICATIONS = '/notifications';
  static const  STOCKTAKING = '/stocktaking';

  static const  STOCK_DETAILS = '/stockDetails';
  static const  STOCK_TAKING_COUNTS = '/stocktakingCountsView';
  static const PDF_VIEW = '/pdfView';
  static const SH_PRODUCT_VIEW = '/sh_productView';




  static String LOGIN_THEN(String afterSuccessfulLogin) =>
      '$LOGIN?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
}
