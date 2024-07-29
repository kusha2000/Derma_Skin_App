import 'package:derma_skin_app/Widgets/touch_man.dart';
import 'package:derma_skin_app/constatnt/colors.dart';
import 'package:flutter/material.dart';

class SecondSpotPage extends StatelessWidget {
  const SecondSpotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        title: Text(
          "0 spots",
          style: TextStyle(
            fontSize: 20,
            color: AppColors.kWhite,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: TouchMan(),
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.2,
            color: AppColors.appBarColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Do you want to add a new spot?",
                  style: TextStyle(color: AppColors.kWhite, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Add new",
                    style: TextStyle(color: AppColors.kWhite, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFACBCB1), // Background color
                    fixedSize: Size(MediaQuery.of(context).size.width * 0.5,
                        30), // Width and height
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Cancel",
                  style: TextStyle(color: AppColors.kWhite, fontSize: 20),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
