import 'package:derma_skin_app/constatnt/colors.dart';
import 'package:flutter/material.dart';

class RiskResultContent extends StatelessWidget {
  final String title;
  final String description1;
  final String description2;
  final String description3;
  final String description4;
  const RiskResultContent(
      {super.key,
      required this.title,
      required this.description1,
      required this.description2,
      required this.description3,
      required this.description4});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 36,
            color: AppColors.appBarColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Text(
          description1,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            color: AppColors.Skinfont,
          ),
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: 20),
        Text(
          description2,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            color: AppColors.Skinfont,
          ),
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: 20),
        Text(
          description3,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            color: AppColors.Skinfont,
          ),
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: 10),
        Text(
          description4,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            color: AppColors.Skinfont,
          ),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
