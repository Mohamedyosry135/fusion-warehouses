import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:fusion_warehouses/config/ConfigReader.dart';
import 'package:fusion_warehouses/consts/colors.dart';
import 'package:fusion_warehouses/consts/storage.dart';
import 'package:fusion_warehouses/consts/text_styles.dart';
import 'package:fusion_warehouses/consts/themes.dart';
import 'package:fusion_warehouses/lang/translation_service.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/routes/app_pages.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:fusion_warehouses/shared/logger/logger_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fusion_warehouses/widgets/custom_button.dart';
import 'package:fusion_warehouses/widgets/custom_button_container.dart';
import 'package:fusion_warehouses/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init('userData');
  await GetStorage.init('appLanguage');
  await GetStorage.init('language');
  await GetStorage.init('appData');
  await ConfigReader.initialize();
  Get.put(AuthService());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent, // navigation bar color
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark// status bar color
  ));
  // FirebaseMessaging messaging = FirebaseMessaging.instance;


  // token = await messaging.getToken();
  // print("firebase token ${token}");
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   print('Got a message whilst in the foreground!');
  //   print('Message data: ${message.data}');
  //
  //   if (message.notification != null) {
  //     print('Message also contained a notification: ${message.notification}');
  //     print("SNACK BAR");
  //     Get.snackbar(message.notification?.title ??"", message.notification?.body ??"",backgroundColor: Color(ColorCode.green),colorText: Color(ColorCode.white));
  //   }
  // });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 731),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) {
        return GetMaterialApp.router(
          debugShowCheckedModeBanner: false,
          enableLog: true,
          logWriterCallback: Logger.write,
          theme: Themes.light,
          themeMode: ThemeMode.light,
          getPages: AppPages.routes,
          locale: Locale(AuthService.to.language != null
              ? AuthService.to.language.toString()
              : 'ar'),
          fallbackLocale: TranslationService.fallbackLocale,
          supportedLocales: const [Locale('ar', ''), Locale('en', '')],
          translations: TranslationService(),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        );
      },
    );
  }
}
