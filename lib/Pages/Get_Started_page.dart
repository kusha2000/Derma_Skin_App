import 'package:derma_skin_app/routers/router_page.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/first.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Spacer(),
            const Column(
              children: [
                Text(
                  "Derma",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Give your skin a little love.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  RouterPage.router.push("/intro");
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const IntroPage()),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4F7158),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                ),
                child: const Text("Get Started",
                    style: TextStyle(fontSize: 17, color: Color(0xffffffff))),
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
