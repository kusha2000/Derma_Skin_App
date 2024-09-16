import 'package:derma_skin_app/Pages/My_Plan.dart';
import 'package:derma_skin_app/Pages/My_Profile.dart';
import 'package:derma_skin_app/Pages/Risk_Profile/risk_start.dart';
import 'package:derma_skin_app/Pages/Set_Remider.dart';
import 'package:derma_skin_app/Pages/login.dart';
import 'package:derma_skin_app/Pages/skin_type/skin_type_start_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:derma_skin_app/Controllers/auth_controller.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF607C6D),
        title: const Center(
          child: Text(
            "Account",
            style: TextStyle(color: Colors.white),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFeaecdf),
          child: Center(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  color: Color(0xFFBCC1AA),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 16.0), // Add some left padding if needed
                      child: Text(
                        "My Skin Vision",
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
                    TextButton(
                      onPressed: () {
                        Get.to(() => const MyPlan());
                      },
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "My Plan",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(() => MyProfile());
                      },
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "My Profile",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(() => StartSkinType());
                      },
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Skin Type",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(() => StartRiskProfile());
                      },
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Risk Profile",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(() => const SetReminder());
                      },
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Reminders & notifications",
                          style: TextStyle(
                            color: Colors.black,
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
                  color: Color(0xFFBCC1AA),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 16.0), // Add some left padding if needed
                      child: Text(
                        "Help & Support",
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
                    TextButton(
                      onPressed: () {},
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Contact Us",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {},
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Change my password",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {},
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Skin cancer information",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
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
                      onPressed: () async {},
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Instruction for use",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
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
                      onPressed: () async {},
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Delete Account",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 40,
                  color: Color(0xFFBCC1AA),
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
      ),
    );
  }
}
