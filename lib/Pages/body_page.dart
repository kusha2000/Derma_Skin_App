import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:derma_skin_app/helpers/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:derma_skin_app/Widgets/touch_man.dart';
import 'package:derma_skin_app/constatnt/colors.dart';
import 'package:derma_skin_app/routers/router_page.dart';

class BodyPage extends StatefulWidget {
  const BodyPage({super.key});

  @override
  State<BodyPage> createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  @override
  Widget build(BuildContext context) {
    // Check if the current user is logged in
    User? currentUser = FirebaseAuth.instance.currentUser;

    // If the user is not logged in, just display "User Name" and default person icon
    if (currentUser == null) {
      return _buildDefaultUserDisplay();
    }

    // If the user is logged in, fetch their name from Firestore
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(currentUser.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError ||
                !snapshot.hasData ||
                !snapshot.data!.exists) {
              // In case of error or no user data, display the default user name and icon
              return _buildDefaultUserDisplay();
            } else {
              // Get the user's data from Firestore
              Map<String, dynamic>? userData =
                  snapshot.data!.data() as Map<String, dynamic>?;

              // Safeguard against missing user data
              String firstName = userData?['fname'] ?? 'User';
              String lastName = userData?['lname'] ?? 'Name';
              String imageUrl = userData?['imageUrl'] ?? '';

              // Display user's profile image and name, or default icon if no image
              return _buildUserDisplay(firstName, lastName, imageUrl);
            }
          },
        ),
      ),
    );
  }

  // Function to display default user icon and "User Name"
  Widget _buildDefaultUserDisplay() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
              const SizedBox(height: 10),
              const Text(
                "User Name", // Default name
                style: TextStyle(
                  color: Color(0xff506D5B),
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              _buildButtonRow(),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  AppHelpers.showSnackBar(
                      context, "Please Select man Front or Back side");
                },
                child: const TouchMan(
                  index: 0,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
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
                          style: TextStyle(
                              color: AppColors.appBarColor, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
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
                          style: TextStyle(
                              color: AppColors.appBarColor, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to display user's profile image or name
  Widget _buildUserDisplay(String firstName, String lastName, String imageUrl) {
    return Column(
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: AppColors.appBarColor,
          ),
          child: imageUrl.isEmpty
              ? const Icon(Icons.person,
                  size: 60) // Show person icon if no image
              : ClipOval(
                  child: Image.network(
                    imageUrl,
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      // Fallback to default person icon if image loading fails
                      return const Icon(Icons.person, size: 60);
                    },
                  ),
                ),
        ),
        const SizedBox(height: 10),
        Text(
          "$firstName $lastName", // Display user's name
          style: const TextStyle(
            color: Color(0xff506D5B),
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 20),
        _buildButtonRow(),
        const SizedBox(height: 20),
        const TouchMan(
          index: 0,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => const AddSpotPage(
                //             index: 1,
                //           )),
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
      ],
    );
  }

  // Function to build the "Find Skin Type" and "Find Risk Profile" buttons
  Widget _buildButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            RouterPage.router.push("/start_skin_type");
          },
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
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            RouterPage.router.push("/start_risk-profile");
          },
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
    );
  }
}
