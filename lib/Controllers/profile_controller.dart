import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:derma_skin_app/consts/firebase_conts.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileController extends GetxController {
  var profileImgPath = ''.obs;

  var profileImageLink = ''.obs;

  var isloading = false.obs;

  //textfield
  var fnameController = TextEditingController();
  var lnameController = TextEditingController();
  var birthdayController = TextEditingController();

  changeImage(context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (img == null) return;
      profileImgPath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadProfileImage() async {
    try {
      var filename = basename(profileImgPath.value);
      var destination = 'images/${currentUser!.uid}/$filename';
      Reference ref = FirebaseStorage.instance.ref().child(destination);
      await ref.putFile(File(profileImgPath.value));
      profileImageLink.value =
          await ref.getDownloadURL(); // Update profileImageLink
    } catch (e) {
      print('Error uploading profile image: $e');
    }
  }

  updateProfile({fname, lname, birthday, gender, imgUrl}) async {
    var store = firestore.collection(usersCollection).doc(currentUser!.uid);
    await store.set({
      'fname': fname,
      'lname': lname,
      'birthday': birthday,
      'gender': gender,
      'imageUrl': imgUrl,
    }, SetOptions(merge: true));
    isloading(false);
  }
}
