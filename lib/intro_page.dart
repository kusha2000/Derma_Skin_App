import 'package:derma_skin_app/login.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
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
              Container(
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
              )
            ],
          ),
        ),
      )),
    );
  }
}
