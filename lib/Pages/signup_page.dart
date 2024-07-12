import 'package:derma_skin_app/Controllers/auth_controller.dart';
import 'package:derma_skin_app/Pages/login.dart';
import 'package:derma_skin_app/consts/firebase_conts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool? ischecked = false;
  bool? isSuccess = false;
  var controller = Get.put(AuthController());

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(bottom: 50.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/signup.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                      color: Color(0xFF4F7158),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xffACBCB1)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 10),
                    child: Form(
                        child: Padding(
                      padding: const EdgeInsets.all(7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            controller: emailController,
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
                            obscureText: true,
                            controller: passwordController,
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
                            "Verify Password",
                            style: TextStyle(
                              color: Color(0xFF506D5B),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextFormField(
                            obscureText: true,
                            controller: passwordRetypeController,
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
                          const SizedBox(height: 30),
                          controller.isloading.value
                              ? const CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.green),
                                )
                              : ElevatedButton(
                                  onPressed: () async {
                                    setState(() {
                                      ischecked = false;
                                    });

                                    if (emailController.text.isEmpty ||
                                        passwordController.text.isEmpty ||
                                        passwordRetypeController.text.isEmpty) {
                                      VxToast.show(context,
                                          msg: "Please enter valid values");
                                    } else if (passwordController.text !=
                                        passwordRetypeController.text) {
                                      VxToast.show(context,
                                          msg:
                                              "Password and Verify Password are not the same");
                                    } else {
                                      setState(() {
                                        ischecked = true;
                                      });

                                      if (ischecked == true) {
                                        controller.isloading(true);
                                        try {
                                          await controller
                                              .signupMethod(
                                            context: context,
                                            email: emailController.text,
                                            password: passwordController.text,
                                          )
                                              .then(
                                            (value) {
                                              print("The value:$value");
                                              controller.storeUserData(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text,
                                              );
                                              if (value != null) {
                                                VxToast.show(context,
                                                    msg: "Sign Up Success");
                                                Get.offAll(() => const Login());
                                              }
                                            },
                                          );
                                        } catch (e) {
                                          auth.signOut();
                                          VxToast.show(context,
                                              msg: e.toString());
                                        } finally {
                                          setState(() {
                                            controller.isloading(false);
                                          });
                                        }
                                      }
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF4F7158),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 80.0, vertical: 15),
                                  ),
                                  child: const Text("SignUp",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xffffffff))),
                                ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Center(
                            child: Text("Already have an Account?",
                                style: TextStyle(
                                  color: Color(0xFF506D5B),
                                )),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 80.0, vertical: 15),
                            ),
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                fontSize: 17,
                                color: Color(0xFF506D5B),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
