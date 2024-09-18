import 'package:derma_skin_app/Pages/login.dart';
import 'package:derma_skin_app/Widgets/Navbar.dart';
import 'package:derma_skin_app/consts/firebase_conts.dart';
import 'package:derma_skin_app/routers/router_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  changeScreen() {
    //using getX
    //Get.to(() => LoginScreen());
    auth.authStateChanges().listen((User? user) {
      if (user == null && mounted) {
        Get.to(() => const Login());
        // RouterPage.router.push("/login");
      } else {
        Get.to(() => const Navbar());
        // RouterPage.router.push("/navbar");
      }
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF506D5B), Color(0xFF010101)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 120, left: 20, right: 20, bottom: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              const Text(
                "What is Derma?",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffFFFFFF)),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Derma is a guide to help you answer questions about common skin conditions. While Derma covers over 200 conditions, this is only a small part of medicine",
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.w100,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Derma doesn’t diagnose. Only trained practitioners can do that. When in doubt, have your healthcare provider check it out.",
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.w100,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "If you are feeling ill or have rapidly changing symptoms, please seek medical care.",
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xffFFFFFF),
                  fontWeight: FontWeight.w100,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  RouterPage.router.push("/login");
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const Login()),
                  // );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color(0xffFFFFFF),
                  ),
                  child: const Center(
                    child: Text(
                      "Log In",
                      style: TextStyle(
                          color: Color(0xff506D5B),
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  RouterPage.router.push("/signup");
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const SignUp()),
                  // );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color(0xff506D5B),
                  ),
                  child: const Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
