import 'package:derma_skin_app/Controllers/profile_controller.dart';
import 'package:derma_skin_app/consts/firebase_conts.dart';
import 'package:derma_skin_app/services/firestore_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart';

const imgProfile2 = "images/profile.png";

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final ProfileController controller = Get.put(ProfileController());
  late DocumentSnapshot userData;
  String _selectedGender = '';
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(currentDate.year - 100),
      lastDate: DateTime(currentDate.year + 100),
    );

    if (selectedDate != null && selectedDate != currentDate) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFACBCB1),
        actions: [
          TextButton(
            onPressed: () async {
              if (userData != null) {
                controller.isloading(true);

                // If image is not selected
                if (controller.profileImgPath.value.isNotEmpty) {
                  await controller.uploadProfileImage();
                  print("Upload OK");
                } else {
                  controller.profileImageLink.value = userData['imageUrl'];
                }

                await controller.updateProfile(
                  imgUrl: controller.profileImageLink.value,
                  fname: controller.fnameController.text,
                  lname: controller.lnameController.text,
                  birthday: _dateController.text,
                  gender: _selectedGender, // Include gender
                );
                VxToast.show(context, msg: "Profile Updated");

                controller.isloading(false);
              }
            },
            child: const Text(
              'Save',
              style: TextStyle(color: Color(0xFF506D5B), fontSize: 20),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          StreamBuilder(
            stream: FirestoreServices.getUser(currentUser!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                    child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ));
              } else if (snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text('No user data found'),
                );
              } else {
                userData = snapshot.data!.docs[0];

                controller.fnameController.text = userData['fname'];
                controller.lnameController.text = userData['lname'];
                if (_dateController.text.isEmpty) {
                  _dateController.text = userData[
                      'birthday']; // Set initial value for date of birth
                }
                if (_selectedGender.isEmpty) {
                  _selectedGender =
                      userData['gender']; // Set initial value for gender
                }

                return Obx(() => Container(
                      color: const Color(0xFFACBCB1),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 1,
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () => controller.changeImage(context),
                              child: ClipOval(
                                child: userData['imageUrl'] == '' &&
                                        controller.profileImgPath.isEmpty
                                    ? Image.asset(imgProfile2,
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover)
                                    : userData['imageUrl'] != '' &&
                                            controller.profileImgPath.isEmpty
                                        ? Image.network(
                                            userData['imageUrl'],
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          )
                                        : Image.file(
                                            File(controller
                                                .profileImgPath.value),
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            userData['email'],
                            style: const TextStyle(
                                color: Color(0xFF506D5B), fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            color: const Color(0xFF607C6D),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Gender",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  PopupMenuButton<String>(
                                    onSelected: (String value) {
                                      setState(() {
                                        _selectedGender = value;
                                      });
                                    },
                                    itemBuilder: (BuildContext context) {
                                      return ['Male', 'Female']
                                          .map((String choice) {
                                        return PopupMenuItem<String>(
                                          value: choice,
                                          child: Text(
                                            choice,
                                          ),
                                        );
                                      }).toList();
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          _selectedGender,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 17),
                                        ),
                                        const Icon(Icons.arrow_drop_down,
                                            color: Colors.white),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "First Name",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: controller.fnameController,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 17),
                                    decoration: const InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2.0),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2.0),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Last Name",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  TextFormField(
                                    controller: controller.lnameController,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 17),
                                    decoration: const InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2.0),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 2.0),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Date of Birth",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => _selectDate(context),
                                    child: AbsorbPointer(
                                      child: TextFormField(
                                        controller: _dateController,
                                        decoration: const InputDecoration(
                                          suffixIcon: Icon(Icons.calendar_today,
                                              color: Colors.white),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 2.0),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 2.0),
                                          ),
                                        ),
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 17),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ));
              }
            },
          ),
          Obx(() {
            if (controller.isloading.value) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.green),
                ),
              );
            }
            return SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}
