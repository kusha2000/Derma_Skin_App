import 'package:derma_skin_app/Widgets/risk_result_content.dart';
import 'package:flutter/material.dart';

class CancerResultPage extends StatelessWidget {
  final String type;
  final String title;
  final String description1;
  final String description2;
  final String description3;
  final String description4;
  const CancerResultPage(
      {super.key,
      required this.title,
      required this.description1,
      required this.description2,
      required this.description3,
      required this.description4,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          type,
          style: const TextStyle(color: Colors.white),
        ),
        // backgroundColor: const Color(0xFFF5F5F5),
        backgroundColor: const Color(0xFF607C6D),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              RiskResultContent(
                title: title,
                description1: description1,
                description2: description2,
                description3: description3,
                description4: description4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
