import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../Utils/logger.dart';




onProfilePickImage(Function onCallback) {
  Get.bottomSheet(
    BottomSheet(
        onClosing: () {},
        builder: (ctx) {
          return SizedBox(
            height: 180,
            child: Scaffold(
              appBar: AppBar(
                iconTheme: const IconThemeData(color: Colors.black),
                automaticallyImplyLeading: false,
                title: const Text('Upload Image'),
                actions: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.close,color: Colors.white,))
                ],
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                            onCamera(onCallback);
                          },
                          child: Column(
                            children: const [
                              Icon(
                                  Icons.camera_alt,
                                  size: 80,
                                  color: Colors.black
                              ),
                              Text('Take a Picture',style: TextStyle(color: Colors.black))
                            ],
                          ),
                        )),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.back();
                          onGallery(onCallback);
                        },
                        child: Column(
                          children: const [
                            Icon(
                                Icons.image,
                                size: 80,
                                color: Colors.black
                            ),
                            Text('Select From Gallery',style: TextStyle(color: Colors.black),)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }),
  );
}

void onCamera(onPick) async {
  String  imagepath = "";
  ImagePicker picker = ImagePicker();
  var imagechoosed =
  await picker.pickImage(source: ImageSource.camera, imageQuality: 75);
  if(imagechoosed != null) {
    imagepath=  imagechoosed.path;
    cropImage(imagepath, onPick);

  }
}

void onGallery(onPick) async {
  String  imagepath = "";
  ImagePicker picker = ImagePicker();
  var imagechoosed =
  await picker.pickImage(source: ImageSource.gallery, imageQuality: 75);
  if(imagechoosed != null) {
    imagepath=  imagechoosed.path;
    cropImage(imagepath, onPick);
  }
}
cropImage(imagepath, onPick) async {
  late File imagefile;
  CroppedFile? croppedFile = await ImageCropper().cropImage(
    sourcePath: imagepath,
    compressFormat: ImageCompressFormat.jpg,
    compressQuality: 100,
    uiSettings: [
      AndroidUiSettings(
        toolbarTitle: 'Cropper',
        // toolbarColor: Constants.appThemeColor,
        toolbarWidgetColor: Colors.black,
        initAspectRatio: CropAspectRatioPreset.square,
        lockAspectRatio: false,
        aspectRatioPresets: [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio4x3,
        ],
      ),
      IOSUiSettings(
        title: 'Cropper',
        aspectRatioPresets: [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio4x3,
        ],
      ),
    ],
  );
  if (croppedFile != null) {
    imagefile = File(croppedFile.path);
    var base64 = imagefile.readAsBytesSync();
    // onPick(base64);
    onPick(imagefile);
  } else {
    Logger.showWarningAlert( 'Image is not cropped',  '');
  }
}



