import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; 
class AppSVGAssets {
static const stocktaking = "assets/svg_icons/stocktaking.svg";
static const user = "assets/svg_icons/user.svg";
static const shoppingCart = "assets/svg_icons/shopping_cart.svg";
static const lockIcon = "assets/svg_icons/lock_icon.svg";
static const barcodeRead = "assets/svg_icons/barcode_read.svg";
static const filter = "assets/svg_icons/filter.svg";
static const notification = "assets/svg_icons/notification.svg";
static const leftBack = "assets/svg_icons/left_back.svg";
static const code = "assets/svg_icons/code.svg";
static const arrow = "assets/svg_icons/arrow.svg";
static const okay = "assets/svg_icons/okay.svg";
static const edit = "assets/svg_icons/edit.svg";
static const returns = "assets/svg_icons/returns.svg";
static const back = "assets/svg_icons/back.svg";
static const outPurchaseOrders = "assets/svg_icons/out_purchase_orders.svg";
static const storageManagement = "assets/svg_icons/storage_management.svg";
static const location = "assets/svg_icons/location.svg";
static const search = "assets/svg_icons/search.svg";
static const timer = "assets/svg_icons/timer.svg";
static const badgeDone = "assets/svg_icons/badge_done.svg";
static const newBill = "assets/svg_icons/new_bill.svg";
static const personal = "assets/svg_icons/personal.svg";
static const warehouse = "assets/svg_icons/warehouse.svg";
static const dailyShipping = "assets/svg_icons/daily_shipping.svg";
static const fail = "assets/svg_icons/fail.svg";
static const date = "assets/svg_icons/date.svg";
static const phoneCall = "assets/svg_icons/phone_call.svg";
static const at = "assets/svg_icons/at.svg";
static const taxNumber = "assets/svg_icons/tax_number.svg";
static const download = "assets/svg_icons/download.svg";
static const clock = "assets/svg_icons/clock.svg";
static const shop = "assets/svg_icons/shop.svg";
static const translate = "assets/svg_icons/translate.svg";
static const home = "assets/svg_icons/home.svg";
static const yellowLeftArrow = "assets/svg_icons/yellow_left_arrow.svg";
static const downArrow = "assets/svg_icons/down_arrow.svg";
static const gtimer = "assets/svg_icons/gtimer.svg";
static const gpersonal = "assets/svg_icons/gpersonal.svg";

     static SvgPicture getWidget(String assetName,{ BoxFit fit = BoxFit.none, Color? color,
      double? width, double? height}) {
    if (width != null && height != null) {
      return SvgPicture.asset(
        assetName,
        fit: fit,
        color: color,
        width: width,
        height: height,
      );
    }
    return SvgPicture.asset(
      assetName,
      fit: fit,
      color: color
    );
  }
    }