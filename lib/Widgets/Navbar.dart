import 'package:derma_skin_app/Controllers/nav_controller.dart';
import 'package:derma_skin_app/Pages/TakePhotos.dart';
import 'package:derma_skin_app/Pages/UV_index.dart';
import 'package:derma_skin_app/Pages/Account.dart';
import 'package:derma_skin_app/Pages/body_page.dart';
import 'package:derma_skin_app/Pages/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    //init name controller
    var controller = Get.put(NavController());
    var navbarItem = [
      const BottomNavigationBarItem(
        icon: SizedBox.shrink(),
        label: 'My body',
      ),
      const BottomNavigationBarItem(
        icon: SizedBox.shrink(),
        label: 'Messages',
      ),
      BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'images/navCircle.png',
            width: 60,
            height: 60,
          ),
        ),
        label: "",
      ),
      const BottomNavigationBarItem(
        icon: SizedBox.shrink(),
        label: 'UV index',
      ),
      const BottomNavigationBarItem(
        icon: SizedBox.shrink(),
        label: 'Account',
      ),
    ];

    var navBody = {
      const BodyPage(),
      const Message(),
      const TakePhotos(),
      const UVIndex(),
      const Account(),
    };

    return Scaffold(
      body: Column(children: [
        Obx(
          () => Expanded(
            child: navBody.elementAt(controller.currentNavIndex.value),
          ),
        ),
      ]),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 95,
          child: Obx(
            () => BottomNavigationBar(
              currentIndex: controller.currentNavIndex.value,
              selectedItemColor: Color(0xFF607C6D),
              unselectedItemColor: Colors.white,
              selectedLabelStyle: const TextStyle(fontSize: 16.0),
              unselectedLabelStyle: const TextStyle(fontSize: 13.0),
              type: BottomNavigationBarType.fixed,
              backgroundColor: const Color(0xff1D4443),
              items: navbarItem,
              onTap: (value) {
                controller.currentNavIndex.value = value;
              },
            ),
          ),
        ),
      ),
    );
  }
}
