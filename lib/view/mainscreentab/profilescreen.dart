import 'dart:io';
import 'package:cellsandcell/constants/color.dart';
import 'package:cellsandcell/constants/commonfunction.dart';
import 'package:cellsandcell/controller/profilecontroller.dart';
import 'package:cellsandcell/service/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var controller = Get.put(ProfileController());
  File? imageFile;

  Future<void> _showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext contexts) {
          return AlertDialog(
              title: const Text('Add Photo!'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(contexts);
                        _openGallery(context);
                      },
                      child: const Text('Gallery'),
                    ),
                    const Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(contexts);
                        _openCamera(context);
                      },
                      child: const Text('Camera'),
                    )
                  ],
                ),
              ));
        });
  }

  void _openGallery(BuildContext context) async {
    var pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 40,
      maxWidth: 500,
      maxHeight: 500,
      // preferredCameraDevice:CameraDevice.values[CameraDevice.front];
    );

    File image = File(pickedFile!.path);
    fileSizeverify(await image.length(), image);
  }

  void _opencamerpicker(BuildContext context) async {
    var pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 40,
      maxWidth: 500,
      maxHeight: 500,
      // preferredCameraDevice:CameraDevice.values[CameraDevice.front];
    );

    File image = File(pickedFile!.path);
    fileSizeverify(await image.length(), image);
  }

  void _openCamera(BuildContext context) async {
    XFile image = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const TakePhoto(),
      ),
    );
    File cameraimg = File(image.path);
    if (cameraimg != null) {
      fileSizeverify(await cameraimg.length(), cameraimg);
    }
  }

  Future fileSizeverify(size, croppedImage) async {
    if (size >= 5000000) {
      commonfunction.toast('File is Larger than 5 MB', Colors.red);
      return true;
    } else {
      imageFile = croppedImage;

      // accountinfocontroller.accountSelfiePicUpdate(croppedImage);

      // setState(() {});

      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: pale, body: buildBody());
  }

  Obx buildBody() {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
            child: CircularProgressIndicator(
          color: Colors.black,
        ));
      }
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 30),
              buildProfileImage(),
              const SizedBox(height: 15),
              TextFormField(
                //initialValue: '${controller.ProfileInfo[0].name}',
                // controller: TextEditingController()
                //   ..text = controller.ProfileInfo.isNotEmpty
                //       ? controller.ProfileInfo[0].name
                //       : '',
                cursorColor: purple,
                controller: controller.namecontroller,
                style: const TextStyle(color: Colors.black, fontSize: 15),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                cursorColor: purple,
                style: const TextStyle(color: Colors.black, fontSize: 15),
                controller: controller.phonecontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintText: "Phone Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                cursorColor: purple,
                style: const TextStyle(color: Colors.black, fontSize: 15),
                controller: controller.addresscontroller,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintText: "Address",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                cursorColor: purple,
                style: const TextStyle(color: Colors.black, fontSize: 15),
                controller: controller.citycontroller,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintText: "City",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                cursorColor: purple,
                style: const TextStyle(color: Colors.black, fontSize: 15),
                controller: controller.districtcontroller,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintText: "District",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                cursorColor: purple,
                style: const TextStyle(color: Colors.black, fontSize: 15),
                controller: controller.pincodecontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintText: "Pincode",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: purple),
                  onPressed: () {
                    if (controller.pincodecontroller.text.trim() != '' ||
                        controller.districtcontroller.text.trim() != '' ||
                        controller.citycontroller.text.trim() != '' ||
                        controller.addresscontroller.text.trim() != '' ||
                        controller.namecontroller.text.trim() != '') {
                      controller.FetchProfileUpdate();
                    } else {
                      commonfunction.toast('Enter All fields', Colors.red);
                    }
                  },
                  child: const Text(
                    'SAVE',
                    style: TextStyle(fontSize: 18),
                  ))
            ],
          ),
        ),
      );
    });
  }

  GestureDetector buildProfileImage() {
    return GestureDetector(
      onTap: () {
        _showSelectionDialog(context);
      },
      child: Center(
        child: Stack(
          children: [
            controller.profileImg.value == ''
                ? Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                            image: AssetImage('assets/images/profile.jpg'))),
                  )
                : Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      shape: BoxShape.circle,
                    ),
                    // image: DecorationImage(
                    //     image: AssetImage('assets/images/logo.jpg'))),
                    child: Image.network(controller.profileImg.value),
                  ),
            Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2,
                    ),
                    color: const Color(0xff9c2d93),
                  ),
                  child: const Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.white,
                    size: 15,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
