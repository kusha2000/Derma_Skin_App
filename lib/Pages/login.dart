import 'package:derma_skin_app/Pages/signup_page.dart';
import 'package:derma_skin_app/Widgets/Navbar.dart';
import 'package:derma_skin_app/consts/firebase_conts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:derma_skin_app/Controllers/auth_controller.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  changeScreen() {
    //using getX
    //Get.to(() => LoginScreen());
    auth.authStateChanges().listen((User? user) {
      if (user == null && mounted) {
        Get.to(() => const Login());
      } else {
        Get.to(() => const Navbar());
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
    var controller = Get.put(AuthController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(bottom: 50.0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/signin.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 10, left: 10),
                  child: Text(
                    "Welcome back",
                    style: TextStyle(
                      color: Color(0xFF4F7158),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      color: const Color(0xFFACBCB1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          "Email",
                          style: TextStyle(
                            color: Color(0xFF506D5B),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: controller.emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 10),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Password",
                          style: TextStyle(
                            color: Color(0xFF506D5B),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: controller.passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 10),
                          ),
                        ),
                        const SizedBox(height: 10),
                        controller.isloading.value
                            ? const CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.green),
                              )
                            : ElevatedButton(
                                onPressed: () async {
                                  controller.isloading(true);
                                  await controller
                                      .loginMethod(
                                    context: context,
                                  )
                                      .then((value) {
                                    print("The Value:$value");
                                    if (value != null) {
                                      controller.isloading(false);
                                      VxToast.show(context,
                                          msg: "Logging Success");
                                      Get.offAll(() => const Navbar());
                                    } else {
                                      controller.isloading(false);
                                    }
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF4F7158),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0),
                                ),
                                child: const Text("Log In",
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Color(0xffffffff))),
                              ),
                        Column(
                          children: [
                            const Text("Don't have an account?",
                                style: TextStyle(
                                  color: Color(0xFF506D5B),
                                )),
                            // ignore: prefer_const_constructors
                            SizedBox(width: 5),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 80.0),
                              ),
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xFF506D5B),
                                ),
                              ),
                            ),
                            const Text("Or continue with",
                                style: TextStyle(
                                  color: Color(0xFF506D5B),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
