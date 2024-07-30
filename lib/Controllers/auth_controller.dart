import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:derma_skin_app/consts/firebase_conts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthController extends GetxController {
  var isloading = false.obs;

  //textcontrollers
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  //login method
  Future<UserCredential?> loginMethod({context}) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
      print("Error : $e");
      return null;
    }
  }

  //signup method
  Future<UserCredential?> signupMethod({email, password, context}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
      print("Error : $e");
      return null;
    }
  }

//storing data method
  storeUserData({password, email}) async {
    // Wait for the signup process to complete and get the user's UID
    await Future.delayed(Duration(
        seconds: 1)); // Add a small delay for the user ID to be available
    User? user = auth.currentUser;
    if (user != null) {
      DocumentReference store = firestore.collection("users").doc(user.uid);
      store.set({
        'email': email,
        'id': user.uid,
        'password': password,
        'imageUrl': '',
        'fname': "",
        'lname': "",
        "birthday": "",
        "gender": ""
      });
    } else {
      print('User is null. Unable to store user data.');
    }
  }

  //signout method
  signoutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
