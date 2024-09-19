import 'package:derma_skin_app/Widgets/risk_result_content.dart';
import 'package:derma_skin_app/constatnt/colors.dart';
import 'package:derma_skin_app/routers/router_page.dart';
import 'package:flutter/material.dart';

class RiskResultPage extends StatelessWidget {
  final String title;
  final String description1;
  final String description2;
  final String description3;
  final String description4;
  const RiskResultPage(
      {super.key,
      required this.title,
      required this.description1,
      required this.description2,
      required this.description3,
      required this.description4});

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
        padding: const EdgeInsets.all(1),
        child: Column(
          children: [
            RiskResultContent(
              title: title,
              description1: description1,
              description2: description2,
              description3: description3,
              description4: description4,
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  RouterPage.router.push("/navbar");
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.appBarColor),
                child: const Text(
                  "DONE",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  RouterPage.router.push("/start_risk-profile");
                },
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
