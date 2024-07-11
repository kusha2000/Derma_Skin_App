import 'package:flutter/material.dart';

class TakePhotos extends StatelessWidget {
  const TakePhotos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Container(
            height: 300,
            width: 300,
            color: const Color(0xFFACBCB1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  "Take Photos",
                  style: TextStyle(
                      color: Color(0xFF607C6D),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "By allowing us access to your camera you can take photos of your moles and skin conditions.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF607C6D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 80.0, vertical: 10),
                      ),
                      child: const Text("CONTINUE",
                          style: TextStyle(
                              fontSize: 17, color: Color(0xffffffff))),
                    ),
                  ),
                ),
                const Text(
                  "Do not allow",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
