import 'package:derma_skin_app/helpers/snackbar.dart';
import 'package:derma_skin_app/routers/router_page.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class SkinModel extends StatefulWidget {
  @override
  _SkinModelState createState() => _SkinModelState();
}

class _SkinModelState extends State<SkinModel> {
  File? _image;
  final picker = ImagePicker();
  String?
      _detectedDisease; // Changed to String? to track if any disease is detected
  String _result = '';

  // Function to pick an image from the gallery
  Future<void> getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        uploadImage(); // Call the upload function
      } else {
        print('No image selected.');
        _result = 'Please select an image';
        _detectedDisease = null; // Reset if no image is selected
      }
    });
  }

  // Function to upload the image and get the prediction
  Future<void> uploadImage() async {
    if (_image == null) return;

    try {
      final request = http.MultipartRequest(
          'POST', Uri.parse('http://10.0.2.2:5000/predict')); // Update URL
      request.files
          .add(await http.MultipartFile.fromPath('file', _image!.path));
      final response = await request.send();

      if (response.statusCode == 200) {
        final respStr = await response.stream.bytesToString();
        final Map<String, dynamic> result = json.decode(respStr);

        setState(() {
          _result =
              '${result['class']} with ${result['probability']}% probability';
          _detectedDisease = result['class']; // Store detected disease
        });
      } else {
        setState(() {
          _result = 'Failed to get prediction';
          _detectedDisease = null; // Reset detected disease on failure
        });
      }
    } catch (e) {
      setState(() {
        _result = 'Server error';
        _detectedDisease = null; // Reset detected disease on error
      });
    }
  }

  // Function to navigate to the relevant food page based on the disease
  void navigateToFoodPage() {
    if (_detectedDisease == 'Actinic keratosis') {
      RouterPage.router.push(
        "/food-page",
        extra: {
          "title": "Actinic keratosis",
          "description":
              "Eating a diet rich in fruits and vegetables high in antioxidants can play a crucial role in protecting your skin from further damage. These foods help neutralize harmful free radicals and support skin repair. Healthy fats, such as those found in avocados and fatty fish, promote skin hydration and overall health. Conversely, processed foods and excessive alcohol can lead to inflammation and dehydration, worsening skin conditions. By focusing on nourishing foods, you can enhance your skin's resilience against damage.",
          "foodToEat":
              "• Fruits and Vegetables: Especially those high in antioxidants (e.g., berries, spinach, kale) to help combat skin damage.\n• Healthy Fats: Avocados and olive oil can support skin health.\n• Omega-3 Fatty Acids: Fatty fish (like salmon) can help reduce inflammation.",
          "foodToAvoid":
              "• Processed Foods: High in sugars and unhealthy fats, which can contribute to skin issues.\n• Excessive Alcohol: Can dehydrate the skin and exacerbate conditions.\n• Refined Carbohydrates: Such as white bread and sugary snacks.",
        },
      );
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => MyPlan()));
    } else if (_detectedDisease == 'Melanocytic nevus') {
      RouterPage.router.push(
        "/food-page",
        extra: {
          "title": "Melanocytic nevus",
          "description":
              "A balanced diet rich in antioxidants can support skin health and help prevent changes that may lead to more serious conditions. Colorful fruits and vegetables provide essential vitamins and minerals that promote skin vitality. Whole grains and hydrating foods help maintain energy levels and skin hydration. However, high-sugar and processed foods can contribute to inflammation and negatively affect your skin’s appearance. Making mindful dietary choices can significantly impact your skin's health and appearance.",
          "foodToEat":
              "• Antioxidant-Rich Foods: Berries, nuts, and green tea to protect skin cells.\n• Whole Grains: Like oats and quinoa for sustained energy and overall health.\n• Hydrating Foods: Cucumbers and watermelon for maintaining skin hydration.",
          "foodToAvoid":
              "High-Sugar Foods: Can lead to inflammation.\n• Trans Fats: Found in many fried and processed foods can negatively impact skin health.\n• Excessive Sun Exposure: Not a food, but emphasize the importance of sun protection in conjunction with diet.",
        },
      );
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => FoodPage2()));
    } else if (_detectedDisease == 'Melanoma') {
      RouterPage.router.push(
        "/food-page",
        extra: {
          "title": "Melanoma",
          "description":
              "For those at risk of melanoma, a diet rich in colorful fruits and vegetables is essential. These foods are packed with vitamins and antioxidants that can help protect skin cells from damage. Green tea, with its polyphenols, may offer additional protective benefits. On the other hand, processed meats and high-glycemic foods can increase inflammation and are associated with higher cancer risks. Prioritizing nutrient-dense foods can empower you in your fight against skin cancer.",
          "foodToEat":
              "• Colorful Fruits and Vegetables: Carrots, sweet potatoes, and dark leafy greens for beta-carotene and vitamins.\n• Green Tea: Contains polyphenols that may have protective effects against skin cancer.\n• Nuts and Seeds: High in omega-3s and other beneficial nutrients.",
          "foodToAvoid":
              "• Processed Meats: Linked to higher cancer risk.\n• High-Glycemic Foods: Sugary drinks and snacks can increase inflammation.\n• Excessive Salt: Processed and fast foods high in salt can be harmful.",
        },
      );
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => FoodPage3()));
    } else if (_detectedDisease == 'Squamous cell carcinoma') {
      RouterPage.router.push(
        "/food-page",
        extra: {
          "title": "Squamous cell carcinoma",
          "description":
              "A diet that emphasizes cruciferous vegetables and fruits rich in vitamin C is important for supporting immune function and tissue repair, particularly for those at risk for squamous cell carcinoma. Lean proteins contribute to healing and overall wellness. In contrast, excessive consumption of refined sugars, unhealthy fats, and alcohol can lead to inflammation and weaken the body's defenses. Making healthy food choices is vital in maintaining skin health and reducing risk factors.",
          "foodToEat":
              "• Cruciferous Vegetables: Broccoli and cauliflower can support detoxification.\n• Fruits High in Vitamin C: Oranges and strawberries for immune support.\n• Lean Proteins: Chicken, turkey, and legumes for tissue repair.",
          "foodToAvoid":
              "• Refined Sugars and Carbs: Can lead to weight gain and inflammation.\n• Alcohol: Limit intake as it can affect skin health.\n• Unhealthy Fats: Minimize fried and processed foods.",
        },
      );
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => FoodPage4()));
    } else if (_detectedDisease == 'Tinea Ringworm Candidiasis') {
      RouterPage.router.push(
        "/food-page",
        extra: {
          "title": "Tinea Ringworm Candidiasis",
          "description":
              "When managing fungal infections like tinea and candidiasis, a diet rich in probiotics and antifungal foods is essential. Probiotic-rich foods support gut health, while garlic offers natural antifungal properties. Foods high in sugar and refined carbohydrates can feed yeast, worsening the condition. Avoiding these trigger foods can enhance your body’s ability to combat infections, making dietary choices a critical part of your treatment strategy.",
          "foodToEat":
              "• Probiotic-Rich Foods: Yogurt and fermented foods to support gut health.\n• Garlic: Has antifungal properties.\n• Fiber-Rich Foods: Whole grains and vegetables to maintain healthy digestion.",
          "foodToAvoid":
              "• Sugar: Feeds yeast and can exacerbate fungal infections.\n• Refined Carbohydrates: Like white bread and pasta.\n• Dairy Products: For some, dairy can worsen fungal infections.",
        },
      );
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => FoodPage5()));
    } else if (_detectedDisease == 'Vascular lesion') {
      RouterPage.router.push(
        "/food-page",
        extra: {
          "title": "Vascular lesion",
          "description":
              "For vascular lesions, a diet abundant in fruits and vegetables rich in vitamins and antioxidants is crucial for promoting healthy circulation and skin integrity. Nuts and seeds provide beneficial nutrients that support vascular health. However, high-sodium foods and trans fats can negatively impact blood pressure and vascular function. By focusing on heart-healthy and skin-friendly foods, you can improve your overall vascular health and reduce the risk of complications.",
          "foodToEat":
              "• Berries and Citrus Fruits: High in vitamin C and antioxidants for vascular health.\n• Leafy Greens: Spinach and kale help improve circulation.\n• Nuts and Seeds: Rich in vitamin E for healthy skin.",
          "foodToAvoid":
              "• High-Sodium Foods: Can contribute to blood pressure issues.\n• Trans Fats: Found in many processed snacks and fast foods.\n• Alcohol: Can dilate blood vessels and worsen the condition.",
        },
      );
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => FoodPage6()));
    } else {
      AppHelpers.showSnackBar(context, "No detected any diseases");
      // ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text('No matching food recommendations found.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disease Prediction'),
      ),
      body: Container(
        color: const Color(0xFFBCC1AA),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _image == null
                    ? const Text('No image selected.')
                    : ClipOval(
                        child: Container(
                          width: 250.0, // Width of the image container
                          height: 250.0, // Height of the image container
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 4.0,
                            ),
                          ),
                          child: Image.file(_image!, fit: BoxFit.cover),
                        ),
                      ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: getImage,
                  child: const Text('Pick Image'),
                ),
                const SizedBox(height: 20),
                _result.isNotEmpty
                    ? Text(
                        _result,
                        style: const TextStyle(fontSize: 20.0),
                      )
                    : const SizedBox(), // Hide result if empty

                // Only show the Food Selection button if a disease is detected
                if (_detectedDisease != null) ...[
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4F7158),
                    ),
                    onPressed: navigateToFoodPage,
                    child: const Text(
                      'Food Selection',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4F7158),
                    ),
                    onPressed: () {
                      RouterPage.router.push("/clinic-details");
                    },
                    child: const Text(
                      'Clinic Details',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
