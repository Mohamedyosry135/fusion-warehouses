import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fusion_warehouses/pages/barcode/presentation/controllers/barcode_controller.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
class PdfView extends GetView<BarcodeController> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: PdfPreview(
        build: (format) => controller.generatePdf(format ),
      ),
    );
  }


}
