import 'package:derma_skin_app/constatnt/colors.dart';
import 'package:flutter/material.dart';

class FoodPage extends StatelessWidget {
  final String title;
  final String description;
  final String foodToEat;
  final String foodToAvoid;
  const FoodPage(
      {super.key,
      required this.title,
      required this.description,
      required this.foodToEat,
      required this.foodToAvoid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Food Selection',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF607C6D),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 36,
                  color: AppColors.appBarColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
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
              const SizedBox(
                height: 15,
              ),
              Text(
                "FOODS TO EAT",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: AppColors.Skinfont,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Bullet points for Foods to Eat
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // _buildBulletPoint(
                  //     "• Fruits and Vegetables: Especially those high in antioxidants (e.g., berries, spinach, kale) to help combat skin damage.\n• Healthy Fats: Avocados and olive oil can support skin health.\n• Omega-3 Fatty Acids: Fatty fish (like salmon) can help reduce inflammation."),
                  _buildBulletPoint(foodToEat),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "FOODS TO AVOID",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.Skinfont,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Bullet points for Foods to Avoid
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBulletPoint(foodToAvoid),
                  // _buildBulletPoint(
                  //     "• Processed Foods: High in sugars and unhealthy fats, which can contribute to skin issues.\n• Excessive Alcohol: Can dehydrate the skin and exacerbate conditions.\n• Refined Carbohydrates: Such as white bread and sugary snacks."),
                  // _buildBulletPoint(
                  //     "• Excessive Alcohol: Can dehydrate the skin and exacerbate conditions."),
                  // _buildBulletPoint(
                  //     "• Refined Carbohydrates: Such as white bread and sugary snacks."),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w400,
          color: AppColors.Skinfont,
        ),
      ),
    );
  }
}
