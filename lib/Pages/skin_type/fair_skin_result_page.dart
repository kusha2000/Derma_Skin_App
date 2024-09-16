import 'package:derma_skin_app/constatnt/colors.dart';
import 'package:flutter/material.dart';

class FairSkinResultPage extends StatelessWidget {
  final String title;
  final String description;
  const FairSkinResultPage(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Skin Type',
          style: TextStyle(color: Colors.white),
        ),
        // backgroundColor: const Color(0xFFF5F5F5),
        backgroundColor: const Color(0xFF607C6D),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 36,
                color: AppColors.appBarColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              description,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: AppColors.Skinfont,
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 60,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.appBarColor),
                child: Text(
                  "DONE",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.kButtonColor),
                child: Text(
                  "Retake",
                  style: TextStyle(
                      color: AppColors.appBarColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
