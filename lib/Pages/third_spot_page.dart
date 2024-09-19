import 'package:derma_skin_app/Widgets/touch_man.dart';
import 'package:derma_skin_app/constatnt/colors.dart';
import 'package:derma_skin_app/routers/router_page.dart';
import 'package:flutter/material.dart';

class ThirdSpotPage extends StatelessWidget {
  final int index;
  const ThirdSpotPage({super.key, required this.index});

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
            padding: const EdgeInsets.only(top: 50),
            child: TouchMan(
              index: index,
            ),
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      topLeft: Radius.circular(25),
                    ),
                    color: AppColors.kButtonColor,
                  ),
                  child: Center(
                    child: Text(
                      "Front",
                      style:
                          TextStyle(color: AppColors.appBarColor, fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  // setState(() {
                  //   _index = 1;
                  //   _showButton = false;
                  // });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: 35,
                  decoration: BoxDecoration(
                    // ignore: prefer_const_constructors
                    borderRadius: BorderRadius.only(
                      bottomRight: const Radius.circular(25),
                      topRight: const Radius.circular(25),
                    ),
                    color: AppColors.kButtonColor,
                  ),
                  child: Center(
                    child: Text(
                      "Back",
                      style:
                          TextStyle(color: AppColors.appBarColor, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
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
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    RouterPage.router.push("/take-photo");
                  },
                  // ignore: sort_child_properties_last
                  child: Text(
                    "Add new",
                    style: TextStyle(color: AppColors.kWhite, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFFACBCB1), // Background color
                    fixedSize: Size(MediaQuery.of(context).size.width * 0.5,
                        30), // Width and height
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    RouterPage.router.push("/body-page");
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: AppColors.kWhite, fontSize: 20),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
