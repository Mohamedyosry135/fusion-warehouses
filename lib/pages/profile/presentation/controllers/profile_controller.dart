import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:fusion_warehouses/pages/login/data/login_repository.dart';
import 'package:fusion_warehouses/pages/login/model/individual.dart';

import 'package:fusion_warehouses/pages/profile/data/profile_repository.dart';
import 'package:fusion_warehouses/pages/profile/models/certificate_zakat_model.dart';
import 'package:fusion_warehouses/pages/profile/models/profile_model.dart';
import 'package:fusion_warehouses/pages/profile/models/profile_update_model.dart';
import 'package:fusion_warehouses/pages/profile/models/zatca_certificates_resp.dart';
import 'package:fusion_warehouses/resources/strings_generated.dart';
import 'package:fusion_warehouses/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class ProfileController extends SuperController<bool> {
  ProfileController({required this.profileRepository});
  File? image;
  Attachment? attachment;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  Rx<ZatcaCertificateResp> zatcaCertificateResp = ZatcaCertificateResp().obs;
  Rx<CertificateRespModel>certificateRespModel = CertificateRespModel().obs;
  final IProfileRepository profileRepository;
  Rx<ProfileModel> profileData = ProfileModel().obs;

  String otp = "";
  @override
  void onInit() {
    change(false, status: RxStatus.loading());

    print("get profile");
    getProfile();
    super.onInit();
    change(true, status: RxStatus.success());

  }

    getProfile()async{
      change(false, status: RxStatus.loading());

      await profileRepository.getProfile().then((value){
        emailController.text = value.data!.email.toString();
        phoneController.text = value.data!.phone.toString();
        nameController.text = value.data!.name.toString();
        profileData.value =  value;
      }).onError((error, stackTrace) {
        Get.snackbar("", error.toString());
      });
      change(true, status: RxStatus.success());
update();

    }
  // getZatacaCertifi()async{
  //
  //   await profileRepository.getZatacaCertifi().then((value){
  //
  //     zatcaCertificateResp.value =  value;
  //     certificateRespModel.value.data =  zatcaCertificateResp.value.data?.items?.first;
  //   }).onError((error, stackTrace) {
  //     Get.snackbar("", AppStrings.tryAgain);
  //   });
  //   update();
  //   change(true, status: RxStatus.success());
  //
  // }
  //
  // postZatacaCertifi()async{
  //   change(false, status: RxStatus.loading());
  //
  //   await profileRepository.postZatacaCertifi(otp,profileData.value.data?.shop?.taxNumber ??"").then((value){
  //
  //     certificateRespModel.value =  value;
  //     change(true, status: RxStatus.success());
  //
  //   }).onError((error, stackTrace) {
  //     Get.snackbar("", AppStrings.tryAgain);
  //     change(true, status: RxStatus.success());
  //
  //   });
  //   update();
  //
  // }


  Future<void> imagePick(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final pickedImage = (await _picker.pickImage(source: source));
    image = File(pickedImage!.path);
    update();
  }
  Future<void> postUpdateProfile() async {
    change(false, status: RxStatus.loading());

    if (image != null) {
      List<int> imageBytes = image!.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);

      attachment =
          Attachment("profile", ("data:image/png;base64,") + base64Image);
    }
    ProfileUpdateModel data = ProfileUpdateModel(
        nameController.text,
        [attachment]);
    await profileRepository.updateProfile(data).then((value) {
      profileData.value = value;
      Get.back();
      getProfile();
      Get.snackbar("", AppStrings.profileUpdated);
    }).onError((error, stackTrace){
      change(true, status: RxStatus.success());
      Get.snackbar("", AppStrings.tryAgain);

    });
    change(true, status: RxStatus.success());
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
}
