import 'package:get/get.dart';

class NavController extends GetxController {
  @override
  void onInit() {
    //getUsername();
    super.onInit();
  }

  var currentNavIndex = 0.obs;

  //var username = '';

  // var searchController = TextEditingController();

  // getUsername() async {
  //   var n = await firestore
  //       .collection(usersCollection)
  //       .where('id', isEqualTo: currentUser!.uid)
  //       .get()
  //       .then((value) {
  //     if (value.docs.isNotEmpty) {
  //       return value.docs.single['name'];
  //     }
  //   });

  //   username = n;
  //print(username);
  // }
}
