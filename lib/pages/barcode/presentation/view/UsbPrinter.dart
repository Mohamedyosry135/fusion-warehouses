// import 'dart:async';
//
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
//
// import 'package:flutter/services.dart';
// import 'package:image/image.dart';
//
// import 'package:esc_pos_utils/esc_pos_utils.dart';
//    import 'package:usb_serial/transaction.dart';
// import 'package:usb_serial/usb_serial.dart';
//  import 'package:flutter_usb_write/flutter_usb_write.dart' as usbFlutter;
//
// import 'package:image/image.dart' as im;
// class UsbPrinter {
//   UsbPort? _port;
//   String _status = "Idle";
//   List<Widget> _ports = [];
//   List<Widget> _serialData = [];
//   StreamSubscription<String>? _subscription;
//   Transaction<String>? _transaction;
//   usbFlutter. FlutterUsbWrite _flutterUsbWrite =usbFlutter. FlutterUsbWrite();
//   UsbEvent? _lastEvent;
//   StreamSubscription<UsbEvent>? _usbStateSubscription;
//   List<UsbDevice> mydevices = [];
//   int? _connectedDeviceId;
//   // ignore: non_constant_identifier_names
//
//   Future<void> createUsbListener(String code,int count, Uint8List? image) async {
//     UsbSerial.usbEventStream?.listen((UsbEvent event) {
//       _getPorts(code,count,image);
//     });
//
//     _getPorts(code,count,image);
//   }
//
//   void _getPorts(code,count,image) async {
//
//     List<UsbDevice> devices = await UsbSerial.listDevices();
//     print("devicesdevices ${devices}");
//
//     _serialData.clear();
//
//     if (_subscription != null) {
//       _subscription?.cancel();
//       _subscription = null;
//     }
//
//     if (_transaction != null) {
//       _transaction?.dispose();
//       _transaction = null;
//     }
//
//     if (_port != null) {
//       _port?.close();
//       _port = null;
//     }
//
//
// if(devices.isNotEmpty){
//   devices[0].create();
//
//
//
//   _connect( devices[0],code,count,image);
//
// }
//
//     print("_port_port::::");
//
//   }
//   Future<usbFlutter.UsbDevice?> _connect(device,code,count,image) async {
//     try {
//       var result = await _flutterUsbWrite.open(
//         vendorId: device.vid,
//         productId: device.pid,
//       );
//
//         _connectedDeviceId = result.deviceId;
//
//       printAction(code,count,image);
//      // return result;
//     } on usbFlutter.PermissionException {
//       return null;
//     }
//   }
//
//
//
//   Future<void> printAction(String code,int count,image) async {
//
//     final profile = await CapabilityProfile.load();
//     final generator = Generator(PaperSize.mm58, profile,spaceBetweenRows: 10);
//
//    for (int x=0;x<count;x++){
//      List<int> bytes = [];
//      List<int> barData = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 4];
//
//      // List<int> barData = List();
//      print("lengthlength  ${code.split("").length}");
//      print("lengthlengthcode  ${code}");
//      print("lengthlengthcode  ${barData}");
//      print("lengthlengthcodeimage  ${image}");
//      // final ByteData data = await rootBundle.load('assets/ .jpeg');
//      // final Uint8List bytes2 = data.buffer.asUint8List();
//      // final im.Image image2 = decodeImage(image);
//      // final im.Image image2 = decodeImage(bytes2);
// // Using `ESC *`
// //      bytes +=  generator.image(image2);
// // Using `GS v 0` (obsolete)
// //      bytes +=  generator.imageRaster(image2);
// // Using `GS ( L`
// //      bytes +=  generator.imageRaster(image2, imageFn: PosImageFn.graphics);
//      // if(code.split("").length<10){
//      //   code.split("").forEach((element) {
//      //     barData.add(int.parse(element));
//      //   });
//      //   code.split("").forEach((element) {
//      //     barData.add(int.parse(element));
//      //   });
//      //   code.split("").forEach((element) {
//      //     barData.add(int.parse(element));
//      //   });
//      // }
//      // else {
//      //   code.split("").forEach((element) {
//      //     barData.add(int.parse(element));
//      //   });
//      // }
//
//      print("lengthlengthlengthlength  ${barData}");
//      // bytes += generator.text('Special 2: blåbærgrød',
//      //     styles: PosStyles(codeTable: PosCodeTable.westEur));
//      // code.split("").length;
//      bytes +=  generator.barcode(Barcode.upcA(barData));
//
// //      bytes += generator.text('t_e_s_t',
// //
// //          styles: PosStyles(align: PosAlign.right), linesAfter: 1);
// //
// //      final ByteData data = await rootBundle.load('assets/ic_invoice_items.png');
// //
// //      final Uint8List bytes2 = data.buffer.asUint8List();
// //
// //      final  image = decodeImage(bytes);
// //
// //
// // // Using `ESC *`
// // //      bytes += generator.image(image);
// // // Using `GS v 0` (obsolete)
// //      bytes +=   generator.imageRaster(image);
// // // Using `GS ( L`
// //      generator.imageRaster(image, imageFn: PosImageFn.graphics);
// //
// //
// //      bytes += generator.text('t_e_s_t',
// //          styles: PosStyles(align: PosAlign.right), linesAfter: 1);
// //
// //      // bytes +=  generator.barcode(Barcode.upcA(barData),  width: 1,font: BarcodeFont.fontB);
//      bytes += generator.cut();
//      await _flutterUsbWrite.write(Uint8List.fromList(bytes));
//
//    }
//
//
//     // final profile = await CapabilityProfile.load();
//     // final generator = Generator(PaperSize.mm80, profile,spaceBetweenRows: 100);
//     // List<int> bytes = [];
//     // List<int> barData = [];
//     // code.characters.forEach((element) {
//     //   print(element);
//     //   barData.add(int.parse(element));
//     // }) ;
//     // print(barData);
//     // bytes +=  generator.barcode(Barcode.upcA(barData));
//     // bytes += generator.emptyLines(5);
//     //
//     //
//   }
// }