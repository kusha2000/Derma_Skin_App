import 'package:flutter/material.dart';

class TouchMan extends StatefulWidget {
  final int index;
  const TouchMan({super.key, required this.index});

  @override
  State<TouchMan> createState() => _TouchManState();
}

class _TouchManState extends State<TouchMan> {
  // int _index = 0;
  // bool _showButton = false;

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          widget.index == 0
              ? Image.asset(
                  'images/man.jpeg',
                  height: MediaQuery.of(context).size.height * 0.4,
                )
              : Image.asset(
                  'images/manback.jpeg',
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
          const SizedBox(
            height: 10,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     GestureDetector(
          //       onTap: () {
          //         // setState(() {

          //         //   _showButton = false;
          //         // });
          //       },
          //       child: Container(
          //         width: MediaQuery.of(context).size.width * 0.25,
          //         height: 35,
          //         decoration: BoxDecoration(
          //           borderRadius: const BorderRadius.only(
          //             bottomLeft: Radius.circular(25),
          //             topLeft: Radius.circular(25),
          //           ),
          //           color: AppColors.kButtonColor,
          //         ),
          //         child: Center(
          //           child: Text(
          //             "Front",
          //             style:
          //                 TextStyle(color: AppColors.appBarColor, fontSize: 20),
          //           ),
          //         ),
          //       ),
          //     ),
          //     const SizedBox(
          //       width: 10,
          //     ),
          //     GestureDetector(
          //       onTap: () {
          //         // setState(() {
          //         //   _index = 1;
          //         //   _showButton = false;
          //         // });
          //       },
          //       child: Container(
          //         width: MediaQuery.of(context).size.width * 0.25,
          //         height: 35,
          //         decoration: BoxDecoration(
          //           borderRadius: const BorderRadius.only(
          //             bottomRight: Radius.circular(25),
          //             topRight: Radius.circular(25),
          //           ),
          //           color: AppColors.kButtonColor,
          //         ),
          //         child: Center(
          //           child: Text(
          //             "Back",
          //             style:
          //                 TextStyle(color: AppColors.appBarColor, fontSize: 20),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // if (_showButton)
          //   ElevatedButton(
          //     onPressed: () {
          //       RouterPage.router.push("/take-photo");
          //     },
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: AppColors.kButtonColor,
          //       padding:
          //           const EdgeInsets.symmetric(horizontal: 80.0, vertical: 10),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(20),
          //       ),
          //     ),
          //     child: const Text("Take Photos",
          //         style: TextStyle(fontSize: 17, color: Color(0xffffffff))),
          //   ),
        ],
      ),
    );
  }
}
