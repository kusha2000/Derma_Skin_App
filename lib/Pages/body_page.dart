import 'package:derma_skin_app/Widgets/touch_man.dart';
import 'package:derma_skin_app/constatnt/colors.dart';
import 'package:flutter/material.dart';

class BodyPage extends StatefulWidget {
  const BodyPage({super.key});

  @override
  State<BodyPage> createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.appBarColor,
              ),
              child: const Icon(
                Icons.person,
                size: 60,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Ishani Samaraweera",
              style: TextStyle(
                  color: Color(0xff506D5B),
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.40,
                    height: 35,
                    color: AppColors.kmainCardColor,
                    child: Center(
                      child: Text(
                        "Find Skin Type",
                        style: TextStyle(color: AppColors.kWhite, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.40,
                    height: 35,
                    color: AppColors.kmainCardColor,
                    child: Center(
                      child: Text(
                        "Find Risk Profile",
                        style: TextStyle(color: AppColors.kWhite, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TouchMan(),
          ],
        ),
      ),
    );
  }
}
