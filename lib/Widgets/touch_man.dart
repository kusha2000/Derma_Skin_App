import 'package:derma_skin_app/constatnt/colors.dart';
import 'package:flutter/material.dart';

class TouchMan extends StatelessWidget {
  const TouchMan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            '../images/man.jpeg',
            height: MediaQuery.of(context).size.height * 0.4,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
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
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25),
                      topRight: Radius.circular(25),
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
        ],
      ),
    );
  }
}
