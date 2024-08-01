import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:barcode/barcode.dart';
import 'package:flutter/rendering.dart';
import 'package:fusion_warehouses/pages/barcode/presentation/view/UsbPrinter.dart';
import 'package:fusion_warehouses/pages/barcode/presentation/view/barcode_view.dart';
import 'package:fusion_warehouses/pages/shipping_details/models/purchase_order_mode_update.dart';
import 'package:fusion_warehouses/pages/shipping_details/presentation/controllers/shipping_details_controller.dart';
import 'package:get/get.dart';

import '../../data/barcode_repository.dart';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'dart:ui' as ui;
import 'dart:convert';
import 'package:screenshot/screenshot.dart';

class BarcodeController extends SuperController<bool>{
  final BarcodeRepository barcodeRepository;
  BarcodeController({required this.barcodeRepository});
  PurchaseOrderModelUpdateStock? purchaseOrderModelUpdateStock;
  ShippingDetailsController shippingDetailsController = Get.find();
// Create a DataMatrix barcode
  final dm = Barcode.dataMatrix();

// Generate a SVG with "Hello World!"
File? file;
var sbg;

  final doc = pw.Document();
  @override
  void onInit() async{

    change(false, status: RxStatus.loading());

    var args = Get.rootDelegate.arguments();
    purchaseOrderModelUpdateStock = args[0]['purchaseOrderModelUpdateStock'];

     sbg = dm.toSvg(purchaseOrderModelUpdateStock?.data?.barCode ??"", width: 200, height: 200);
print(sbg);
    super.onInit();
    change(true, status: RxStatus.success());

  }

   ScreenshotController screenshotController = ScreenshotController();

  GlobalKey<OverRepaintBoundaryState> globalKey = new GlobalKey();

  MemoryImage?  imageProvider;
  Uint8List? bs64;
  Future<Uint8List?> capturePng() async {
    print('inside');
    RenderRepaintBoundary? boundary =
    globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;

    ui.Image? image = await boundary?.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image?.toByteData(format: ui.ImageByteFormat.png);
    var pngBytes = byteData?.buffer.asUint8List();

    // screenshotController.capture().then((Uint8List pngBytes) {
    //
    // // Capture Done
    //
    // usbprinter
    //     .createUsbListener( "223333", int.parse("1"), pngBytes)
    //     .then((value) {
    //
    // });
    // });
     bs64 = pngBytes!;
    imageProvider  = MemoryImage(pngBytes);
    return pngBytes;
  }
  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }
@override
  void onClose() {
    // TODO: implement onClose
  shippingDetailsController.getPurchaseOrderDetails(shippingDetailsController.id!);
    super.onClose();
  }



  Future<Uint8List> generatePdf(PdfPageFormat format) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.SizedBox(
                width: double.infinity,
                child: pw.FittedBox(
                  child: pw.Container(
                  child: pw.Image(
                      pw.MemoryImage(bs64!)
                  )
                  )
                ),
              ),
              pw.SizedBox(height: 20),
              // pw.Flexible(child: pw.FlutterLogo())
            ],
          );
        },
      ),
    );

    return pdf.save();
  }
}