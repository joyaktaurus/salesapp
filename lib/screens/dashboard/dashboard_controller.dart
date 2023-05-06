import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/api_resp.dart';
import '../../models/upload_resp.dart';
import '../../services/image_upload_service.dart';
import '../../utils/err_m.dart';

class DashboardViewController extends GetxController {

 //  Rx<bool> status= false.obs;
 // // Rx<File?> pickedfile = File('').obs;
 //  final ImagePicker imagepicked = ImagePicker();
 //  RxList<XFile> imagesList = (List<XFile>.of([])).obs;
 //
 //  void removeImages() {
 //  //  pickedfile.close();
 //  }
 //
 //
 //  uploaImage(BuildContext buildContext) async {
 //    ApiResp respData =
 //    await ImageUploadServices.uploadProcess(imagesList[0], buildContext);
 //    if (respData.ok == false) {
 //      log("not Uploaded");
 //    } else {
 //      ImageUploadResp imageUploadCheck =
 //      ImageUploadResp.fromJson(respData.rdata);
 //      if (imageUploadCheck.code?.toString() == '200') {
 //        showMsg('Image Uploaded successfully', 'Success');
 //        //   multipartVerification(imageUploadCheck.data);
 //        log("Uploaded");
 //      } else {
 //        log("not Uploaded");
 //      }
 //      return true;
 //    }
 //  }
 //
 //  imageFromCamera() async {
 //    XFile? result = await ImagePicker()
 //        .pickImage(source: ImageSource.camera, imageQuality: 50);
 //
 //    if (result != null) {
 //      imagesList.add(result);
 //    }
 //  }
 //
 //  Future<void> takePhoto(ImageSource source) async {
 //    final XFile? pickedFile2 = await imagepicked
 //        .pickImage(source: ImageSource.camera, imageQuality: 100);
 // //   File pickedFile= File(pickedFile2!.path);
 //   // pickedfile.value = pickedFile;
 //    print(pickedFile2);
 //  }
 //
 //  Future<void> Photogallery(ImageSource source) async {
 //    final XFile? pickedFile2 = await imagepicked
 //        .pickImage(source: ImageSource.gallery, imageQuality: 100);
 //   // File pickedFile= File(pickedFile2!.path);
 //  //  pickedfile.value = pickedFile;
 //    print(pickedFile2);
 //  }
}