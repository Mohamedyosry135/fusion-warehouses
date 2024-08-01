  import 'package:fusion_warehouses/consts/storage.dart';
import 'package:fusion_warehouses/pages/login/model/individual.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class AuthService extends GetxService {
  static AuthService get to => Get.find();
  GetStorage box = GetStorage(StorageKeys.userDataBox);
  GetStorage box2 = GetStorage(StorageKeys.appLanguage);
  final isLoggedIn = false.obs;
  final isSelectedLanguage = false.obs;
  LoginResponeModel? userInfo;
  String language = 'ar';
  bool get isLoggedInValue => isLoggedIn.value;

  @override
  void onInit() {
    super.onInit();
    if (box.hasData(StorageKeys.userDataKey)) {
      isLoggedIn.value = true;
      print(userInfo?.data?.authToken ??"");
      userInfo = LoginResponeModel.fromJson(box.read(StorageKeys.userDataKey));
    }

    if (box2.hasData(StorageKeys.language)) {
      isSelectedLanguage.value = true;
      language = box2.read(StorageKeys.language);
    }
  }

  void login(LoginResponeModel userInfo) {
    isLoggedIn.value = true;
    this.userInfo = userInfo;
    box.write(StorageKeys.userDataKey, userInfo.toJson());
  }

  void logout() {
    isLoggedIn.value = false;
    userInfo = null;
    box.remove(StorageKeys.userDataKey);
  }

  void selectLanguage(language) {
    isSelectedLanguage.value = true;
    this.language = language;
    box2.write(StorageKeys.language, language);
  }
}
