import 'package:derma_skin_app/Widgets/touch_man.dart';
import 'package:derma_skin_app/constatnt/colors.dart';
import 'package:derma_skin_app/routers/router_page.dart';
import 'package:flutter/material.dart';

class AddSpotPage extends StatefulWidget {
  final int index;
  const AddSpotPage({super.key, required this.index});

  @override
  State<AddSpotPage> createState() => _AddSpotPageState();
}

class _AddSpotPageState extends State<AddSpotPage> {
  @override
  Widget build(BuildContext context) {
    int select = widget.index;
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
            child: GestureDetector(
              onTap: () {
                select == 0
                    ?
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const SecondSpotPage(
                    //               index: 0,
                    //             )),
                    //   )

                    RouterPage.router.push("/second-spot-page", extra: 0)
                    :
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const ThirdSpotPage(
                    //               index: 1,
                    //             )),
                    //   );
                    RouterPage.router.push("/third-spot-page", extra: 1);
              },
              child: TouchMan(
                index: widget.index,
              ),
            ),
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    select = 0;
                  });
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const AddSpotPage(
                  //             index: 0,
                  //           )),
                  // );
                  RouterPage.router.push("/add-spot-page", extra: 0);
                },
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
                  setState(() {
                    select = 1;
                  });
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const AddSpotPage(
                  //       index: 1,
                  //     ),
                  //   ),
                  // );
                  RouterPage.router.push("/add-spot-page", extra: 1);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
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
                const SizedBox(
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
