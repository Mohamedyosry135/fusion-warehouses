import 'package:fusion_warehouses/routes/app_pages.dart';
import 'package:fusion_warehouses/services/auth_service.dart';
import 'package:get/get.dart';


class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.addRequestModifier<dynamic>((request) {
      final userInfo = AuthService.to.userInfo;
      final languageApp = AuthService.to.language;
      print("here");
      print("${request.url}");
      print("${request.bodyBytes}");

      if (userInfo != null && userInfo.data?.authToken != null) {
        request.headers.putIfAbsent(
            "Authorization", () =>
        // "Y1RLNUJRQ1k0dy9NdUY3amJ0c0J3cUdnR1E1YW9od2kvL2NDRlk1Y1dWb3hOY01iakJQa3R0QkZObVdyTENRV1V5NjR4U2gzVksyZllEdnNqdWp4UmFOMmFZQUp4bXNaSEliUDlBTnQ4ZmJhbms1ZEs5aVVIdEpJSnNVbmNCTGlDYTR2RUVJaCtvK213ZEJiL1ZwMVhZZUI0cDF2UXpSUTZ1NktDUHRwS0w4SFdJYXlFZGFveUw5K2syYllOQjR1MWg1YXJad1dJM3dQdm9OQy9aWFVRY0h5NFZNVk1sdHI0Y3dUQ1YvVURSb3BqWFcyRVk3MFdPeVRuOHRyTzZLZkhna1hyZU5NM0U4UjViYkJjODFRbjIzU2c5MndmZGVmWDVwbUZPN1pMK2tBdWpDVmdoWHJGMVdQUGpIYmdNM1ItLWNmSm5SQTROTFYwOHN5NVpiTkdmaVE9PQ==--46177336db8b726c173ae6e6b59407842f568c67"
        "${AuthService.to.userInfo!.data!.authToken}"
        );
        print("token ${AuthService.to.userInfo!.data!.authToken}");

      }
      request.headers.putIfAbsent("Content-Type", () => "application/json");
      request.headers.putIfAbsent("Accept", () => "application/json");
      request.headers.putIfAbsent("lang", () => AuthService.to.language);

      // print("Authorization  ${AuthService.to.userInfo!.data?.authToken ?? ""}");

      return request;
    });

    httpClient.addResponseModifier((request, response) {
      printInfo(info: request.url.toString());
      printInfo(info: response.bodyString!);
      // if (response.unauthorized || response.status.code == 401) {
      //   AuthService.to.logout();
      //   Get.rootDelegate.offNamed(Routes.LOGIN);
      // }
      return response;
    });
  }
}
