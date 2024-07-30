import 'package:derma_skin_app/Widgets/touch_man.dart';
import 'package:derma_skin_app/constatnt/colors.dart';
import 'package:flutter/material.dart';

class AddSpotPage extends StatelessWidget {
  const AddSpotPage({super.key});

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
                  "Add a new spot by tapping on the body",
                  style: TextStyle(color: AppColors.kWhite, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Pinch to zoom in",
                  style: TextStyle(color: AppColors.kfontC, fontSize: 20),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
