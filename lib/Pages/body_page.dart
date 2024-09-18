import 'package:cloud_firestore/cloud_firestore.dart';
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

    // If the user is not logged in, just display "User Name"
    if (currentUser == null) {
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
                "User Name", // Default name if no user is logged in
                style: TextStyle(
                  color: Color(0xff506D5B),
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
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
                          style: TextStyle(
                            color: AppColors.kWhite,
                            fontSize: 18,
                          ),
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
                          style: TextStyle(
                            color: AppColors.kWhite,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TouchMan(),
            ],
          ),
        ),
      );
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
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading user data'));
            } else if (!snapshot.hasData || !snapshot.data!.exists) {
              return const Center(child: Text('No user data found'));
            } else {
              // Get the user's data from Firestore
              Map<String, dynamic>? userData =
                  snapshot.data!.data() as Map<String, dynamic>?;

              // Add null checks for user data fields
              String firstName = userData?['fname'] ?? 'User';
              String lastName = userData?['lname'] ?? 'Name';

              return Column(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.appBarColor,
                    ),
                    child: currentUser != null
                        ? StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('users')
                                .doc(currentUser.uid)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return const Icon(
                                  Icons.person,
                                  size: 60,
                                );
                              } else if (snapshot.hasData &&
                                  snapshot.data!.exists) {
                                var userData = snapshot.data!.data()
                                    as Map<String, dynamic>?;

                                // Get the imageUrl from the user document
                                String imageUrl = userData?['imageUrl'] ?? '';

                                // If imageUrl is empty, show default icon
                                if (imageUrl.isEmpty) {
                                  return const Icon(
                                    Icons.person,
                                    size: 60,
                                  );
                                } else {
                                  // Otherwise, show the user's profile photo
                                  return ClipOval(
                                    child: Image.network(
                                      imageUrl,
                                      width: 90,
                                      height: 90,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Icon(
                                          Icons.person,
                                          size: 60,
                                        );
                                      },
                                    ),
                                  );
                                }
                              } else {
                                return const Icon(
                                  Icons.person,
                                  size: 60,
                                );
                              }
                            },
                          )
                        : const Icon(
                            Icons.person,
                            size: 60,
                          ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  // Dynamically display the user's full name
                  Text(
                    "$firstName $lastName",
                    style: const TextStyle(
                      color: Color(0xff506D5B),
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
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
                              style: TextStyle(
                                  color: AppColors.kWhite, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
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
                              style: TextStyle(
                                  color: AppColors.kWhite, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TouchMan(),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
