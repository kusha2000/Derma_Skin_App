import 'package:flutter/material.dart';

class InstructionsPage extends StatelessWidget {
  const InstructionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF607C6D),
        title: Text(
          "Instructions",
          style: TextStyle(color: Colors.white, fontSize: 22),
          textAlign: TextAlign.left,
        ),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          color: const Color(0xFFeaecdf),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: const Text(
                  "Welcome To Derma App!",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF607C6D),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Welcome to the Derma Skin App! Below are the step-by-step instructions on how to navigate and use the application effectively.",
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16),

              // Section: Sign Up and Login
              const Text(
                "1. Sign Up and Login",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Begin by creating a new account or logging in with your existing credentials. Ensure to fill in all required details.",
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16),

              // Section: My Plan
              const Text(
                "2. My Plan",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Access your personalized skincare plan based on your skin type and needs. This plan includes recommendations for products and care routines.",
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16),

              // Section: My Profile
              const Text(
                "3. My Profile",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "You can view and update your personal details in the My Profile section. Ensure your information is accurate for better recommendations.",
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16),

              // Section: Skin Type
              const Text(
                "4. Skin Type",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Take a questionnaire to determine your skin type. This information will be used to provide you with a personalized skincare routine.",
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16),

              // Section: Risk Profile
              const Text(
                "5. Risk Profile",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Identify your risk for certain skin conditions by completing a short survey. Your risk profile helps guide preventative care recommendations.",
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16),

              // Section: Reminders & Notifications
              const Text(
                "6. Reminders & Notifications",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Set reminders for your skincare routine or upcoming dermatologist appointments. Never miss an important date in your skincare journey.",
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16),

              // New Section: Take Photos for Skin Disease Prediction
              const Text(
                "7. Take Photos & Upload for Skin Disease Prediction",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "You can take and upload photos of your skin to identify potential skin diseases. Here’s how to use the feature:",
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 8),
              const Text(
                "- Go to the 'Take Photos' section in the app.",
                style: TextStyle(fontSize: 16.0),
              ),
              const Text(
                "- Allow camera access and take a photo of the affected area.",
                style: TextStyle(fontSize: 16.0),
              ),
              const Text(
                "- The app will upload the photo to our server for analysis.",
                style: TextStyle(fontSize: 16.0),
              ),
              const Text(
                "- You will receive a prediction about potential skin conditions based on the image.",
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16),

              // Section: Log Out
              const Text(
                "8. Log Out",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "To log out of the application, click the 'Log Out' button at the bottom of the Account page.",
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
