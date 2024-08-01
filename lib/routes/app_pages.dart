
import 'package:fusion_warehouses/middleware/auth_middleware.dart';
import 'package:fusion_warehouses/pages/barcode/bindings/barcode_binding.dart';
import 'package:fusion_warehouses/pages/barcode/presentation/view/barcode_view.dart';
import 'package:fusion_warehouses/pages/barcode/presentation/view/pdf_view_widget.dart';
import 'package:fusion_warehouses/pages/bottom_navigation/biniding/home_binding.dart';
import 'package:fusion_warehouses/pages/bottom_navigation/view/bottom_navigation_widget.dart';
import 'package:fusion_warehouses/pages/daily_shipping_list/bindings/daily_shipping_binding.dart';
import 'package:fusion_warehouses/pages/daily_shipping_list/presentation/view/daily_shipping_view.dart';


import 'package:fusion_warehouses/pages/invoices/bindings/invoices_binding.dart';
import 'package:fusion_warehouses/pages/invoices/presentation/view/invoices_view.dart';



import 'package:fusion_warehouses/pages/login/bindings/login_binding.dart';
import 'package:fusion_warehouses/pages/login/presentation/views/login_view.dart';
import 'package:fusion_warehouses/pages/notifications/bindings/notifications_binding.dart';
import 'package:fusion_warehouses/pages/notifications/presentation/views/notifications_view.dart';
import 'package:fusion_warehouses/pages/product_details/bindings/product_details_binding.dart';
import 'package:fusion_warehouses/pages/product_details/presentation/views/bc_product_details_view.dart';
import 'package:fusion_warehouses/pages/product_details/presentation/views/sh_product_details_view.dart';


import 'package:fusion_warehouses/pages/purshase_management/bindings/purchase_management_binding.dart';
import 'package:fusion_warehouses/pages/purshase_management/presentation/view/purchase_management_view.dart';
import 'package:fusion_warehouses/pages/returns/bindings/returns_binding.dart';
import 'package:fusion_warehouses/pages/returns/presentation/view/returns_view.dart';
import 'package:fusion_warehouses/pages/shipping_details/bindings/shipping_details_binding.dart';
import 'package:fusion_warehouses/pages/shipping_details/presentation/view/shipping_details_view.dart';
import 'package:fusion_warehouses/pages/splash/bindings/splash_binding.dart';
import 'package:fusion_warehouses/pages/splash/presentation/views/splash_view.dart';
import 'package:fusion_warehouses/pages/stocktaking/bindings/stocktaking_binding.dart';
import 'package:fusion_warehouses/pages/stocktaking/presentation/views/stocktaking_view.dart';
import 'package:fusion_warehouses/pages/stocktaking_counts/bindings/stocktaking_counts_binding.dart';
import 'package:fusion_warehouses/pages/stocktaking_counts/presentation/views/stocktaking_counts_view.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/bindings/stocktaking_details_binding.dart';
import 'package:fusion_warehouses/pages/stocktaking_details/presentation/views/stocktaking_details_view.dart';
import 'package:fusion_warehouses/pages/warehouse_delivery/bindings/warehouse_delivery_binding.dart';
import 'package:fusion_warehouses/pages/warehouse_delivery/presentation/view/warehouse_delivery_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      middlewares: [EnsureAuthMiddleware()],
      name: Routes.BOTTOM_NAVIGATION_SCREEN,
      page: () => BottomNavigationScreen(),
      binding: NavigationBinding(),
    ),
    GetPage(
      middlewares: [EnsureAuthMiddleware()],

      name: Routes.SHIPPING_DAILY,
      page: () => DailyShippingView(),
      binding: DailyShippingBinding(),
    ),
    GetPage(
      middlewares: [EnsureAuthMiddleware()],

      name: Routes.BARCODE,
      page: () => BarcodeView(),
      binding: BarCodeBinding(),
    ),
    GetPage(
      middlewares: [EnsureAuthMiddleware()],

      name: Routes.DETAILS,
      page: () => ShippingDetailsView(),
      binding: ShippingDetailsBinding(),
    ),
    GetPage(
      middlewares: [EnsureAuthMiddleware()],

      name: Routes.PURCHASE_MANAGEMENT,
      page: () => PurchaseManagementView(),
      binding: PurchaseManagementBinding(),
    ),
    GetPage(
      middlewares: [EnsureAuthMiddleware()],

      name: Routes.WAREHOUSES,
      page: () => WarehousesView(),
      binding: WarehousesBinding(),
    ),
    GetPage(
      middlewares: [EnsureAuthMiddleware()],

      name: Routes.INVOICESES,
      page: () => InvoicesView(),
      binding: InvoicesBinding(),
    ),
    GetPage(
      middlewares: [EnsureAuthMiddleware()],

      name: Routes.PRODUCT_DETAILS,
      page: () => ProductDetailsView(),
      binding: ProductDetailsBinding(),
    ),
    GetPage(
      middlewares: [EnsureAuthMiddleware()],

      name: Routes.NOTIFICATIONS,
      page: () => NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      middlewares: [EnsureAuthMiddleware()],

      name: Routes.RETURNS,
      page: () => ReturnsView(),
      binding: ReturnsBinding(),
    ),
    GetPage(
      middlewares: [EnsureAuthMiddleware()],

      name: Routes.STOCKTAKING,
      page: () => StocktakingView(),
      binding: StocktakingBinding(),
    ),

    GetPage(
      middlewares: [EnsureAuthMiddleware()],

      name: Routes.STOCK_DETAILS,
      page: () => StocktakingDetailsView(),
      binding: StocktakingDetailsBinding(),
    ),
    GetPage(
      middlewares: [EnsureAuthMiddleware()],

      name: Routes.STOCK_TAKING_COUNTS,
      page: () => StocktakingCountsView(),
      binding: StocktakingCountsBinding(),
    ),

    GetPage(
      middlewares: [EnsureAuthMiddleware()],

      name: Routes.PDF_VIEW,
      page: () => PdfView(),
      binding: BarCodeBinding(),
    ),
    GetPage(
      middlewares: [EnsureAuthMiddleware()],

      name: Routes.SH_PRODUCT_VIEW,
      page: () => ShProductDetailsView(),
      binding: ProductDetailsBinding(),
    ),
  ];
}
