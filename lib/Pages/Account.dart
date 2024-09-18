import 'package:derma_skin_app/Pages/Get_Started_page.dart';
import 'package:derma_skin_app/Pages/My_Plan.dart';
import 'package:derma_skin_app/Pages/My_Profile.dart';
import 'package:derma_skin_app/Pages/Risk_Profile/risk_start.dart';
import 'package:derma_skin_app/Pages/Set_Remider.dart';
import 'package:derma_skin_app/Pages/login.dart';
import 'package:derma_skin_app/Pages/skin_type/skin_type_start_page.dart';
import 'package:derma_skin_app/help_supprot_pages/app_instruction_page.dart';
import 'package:derma_skin_app/help_supprot_pages/change_password_page.dart';
import 'package:derma_skin_app/helpers/snackbar.dart';
import 'package:derma_skin_app/routers/router_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:derma_skin_app/Controllers/auth_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> deleteAccount(BuildContext context) async {
    User? user = _auth.currentUser;

    if (user != null) {
      try {
        await _firestore.collection('users').doc(user.uid).delete();

        await user.delete();

        AppHelpers.showSnackBar(context, "User account deleted successfully");
        // Get.offAll(() => const GetStarted());
        RouterPage.router.go("/");
      } catch (e) {
        print("Error deleting user: $e");

        AppHelpers.showSnackBar(
            context, "Error deleting account. Please try again.");
      }
    } else {
      AppHelpers.showSnackBar(context, "No User SignIn");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFeaecdf),
      appBar: AppBar(
        backgroundColor: const Color(0xFF607C6D),
        title: const Center(
          child: Text(
            "Account",
            style: TextStyle(color: Colors.white),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 40,
                color: const Color(0xFFBCC1AA),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      "My Skin Vision",
                      style: TextStyle(
                        color: Color(0xFF607C6D),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  TextButton(
                    onPressed: () {
                      // Get.to(() => const MyPlan());
                      RouterPage.router.push("/myplan");
                    },
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "My Plan",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextButton(
                    onPressed: () {
                      // Get.to(() => const MyProfile());
                      RouterPage.router.push("myprofile");
                    },
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "My Profile",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextButton(
                    onPressed: () {
                      // Get.to(() => const StartSkinType());
                      RouterPage.router.push("/start_skin_type");
                    },
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Skin Type",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextButton(
                    onPressed: () {
                      // Get.to(() => const StartRiskProfile());
                      RouterPage.router.push("/start_risk-profile");
                    },
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Risk Profile",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextButton(
                    onPressed: () {
                      RouterPage.router.push("/reminder");
                    },
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Reminders & notifications",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 40,
                color: const Color(0xFFBCC1AA),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      "Help & Support",
                      style: TextStyle(
                        color: Color(0xFF607C6D),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  TextButton(
                    onPressed: () async {
                      final Uri emailUri = Uri(
                        scheme: 'mailto',
                        path: 'dermaskin@skin.com',
                        query:
                            'subject=Skin Care Inquiry&body=Hi Derma Skin Support Team,', // Optional
                      );

                      if (await canLaunchUrl(emailUri)) {
                        await launchUrl(emailUri);
                      } else {
                        throw 'Could not launch $emailUri';
                      }
                    },
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Contact Us",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  TextButton(
                    onPressed: () {
                      // Get.to(() => const ChangePasswordPage());
                      RouterPage.router.push("/change-password");
                    },
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Change my password",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  TextButton(
                    onPressed: () async {
                      RouterPage.router.push("/cancer-info");
                    },
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Skin cancer information",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  // TextButton(
                  //   onPressed: () async {},
                  //   child: const Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: Text(
                  //       "FAQ",
                  //       style: TextStyle(
                  //         color: Colors.black,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  TextButton(
                    onPressed: () {
                      // Get.to(() => const InstructionsPage());
                      RouterPage.router.push("/use-info");
                    },
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Instruction for use",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  // TextButton(
                  //   onPressed: () async {},
                  //   child: const Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: Text(
                  //       "Privacy Policy",
                  //       style: TextStyle(
                  //         color: Colors.black,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // TextButton(
                  //   onPressed: () async {},
                  //   child: const Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: Text(
                  //       "Terms & Conditions",
                  //       style: TextStyle(
                  //         color: Colors.black,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // TextButton(
                  //   onPressed: () async {},
                  //   child: const Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: Text(
                  //       "Privacy & Security Settings",
                  //       style: TextStyle(
                  //         color: Colors.black,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  TextButton(
                    onPressed: () async {
                      await deleteAccount(context);
                    },
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Delete Account",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 40,
                color: const Color(0xFFBCC1AA),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 16.0), // Add some left padding if needed
                    child: Text(
                      "",
                      style: TextStyle(
                        color: Color(0xFF607C6D),
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  TextButton(
                    onPressed: () async {
                      await Get.put(AuthController()).signoutMethod(context);
                      Get.offAll(() => const Login());
                    },
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Log Out",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
