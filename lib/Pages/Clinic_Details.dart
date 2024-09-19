import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';

class ClinicDetails extends StatelessWidget {
  ClinicDetails({super.key});

  final List<Map<String, String>> clinicData = [
    {
      "city": "Colombo",
      "hospital": "Christell Skin Clinic",
      "phone": "0117499299"
    },
    {
      "city": "Colombo",
      "hospital": "Skin Clinic Sri Lanka",
      "phone": "0112588679"
    },
    {
      "city": "Colombo",
      "hospital": "360 Wellness and Skin Clinic",
      "phone": "0117550099"
    },
    {"city": "Colombo", "hospital": "Lush Skin Clinic", "phone": "0775579576"},
    {
      "city": "Colombo",
      "hospital": "Dermacare Skin Clinic",
      "phone": "0112345678"
    },
    {"city": "Colombo", "hospital": "Skin Solutions", "phone": "0117890123"},
    {
      "city": "Colombo",
      "hospital": "Radiant Skin Clinic",
      "phone": "0115678901"
    },
    {
      "city": "Kandy",
      "hospital": "Dermacare Skin Clinic",
      "phone": "0812223500"
    },
    {"city": "Galle", "hospital": "Skin Clinic", "phone": "0912222345"},
    {
      "city": "Jaffna",
      "hospital": "Dermatological Clinic",
      "phone": "0212225678"
    },
    {
      "city": "Kurunegala",
      "hospital": "Skin Care Center",
      "phone": "0372227890"
    },
    {"city": "Matara", "hospital": "Derma Plus Clinic", "phone": "0412221234"},
    {
      "city": "Anuradhapura",
      "hospital": "Skin Solutions",
      "phone": "0252225678"
    },
    {
      "city": "Batticaloa",
      "hospital": "Radiant Skin Clinic",
      "phone": "0652223456"
    },
    {
      "city": "Negombo",
      "hospital": "Dermacare Skin Clinic",
      "phone": "0312227890"
    }
  ];

  // Function to launch phone dialer with permission check
  void _callNumber(String phoneNumber) async {
    // Request phone call permission
    PermissionStatus status = await Permission.phone.request();

    print("Permission status: $status"); // Log the permission status

    if (status.isGranted) {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );

      if (await canLaunchUrl(launchUri)) {
        await launchUrl(launchUri, mode: LaunchMode.externalApplication);
      } else {
        print('Could not launch the phone dialer for number: $phoneNumber');
      }
    } else if (status.isDenied) {
      print("Phone permission denied.");
      // Optionally, show a message to the user explaining why permission is needed
    } else if (status.isPermanentlyDenied) {
      print("Phone permission permanently denied. Opening app settings.");
      openAppSettings(); // Prompt user to go to settings
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF607C6D),
        title: const Center(
          child: Text(
            "Clinic Details",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: clinicData.length,
        itemBuilder: (context, index) {
          final clinic = clinicData[index];
          return ListTile(
            title: Text('${clinic["hospital"]} - ${clinic["city"]}'),
            subtitle: Text('Phone: ${clinic["phone"]}'),
            trailing: IconButton(
              icon: const Icon(Icons.call, color: Colors.green),
              onPressed: () => _callNumber(clinic["phone"]!),
            ),
          );
        },
      ),
    );
  }
}
