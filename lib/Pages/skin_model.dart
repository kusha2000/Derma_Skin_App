import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

class SkinModel extends StatefulWidget {
  @override
  _SkinModelState createState() => _SkinModelState();
}

class _SkinModelState extends State<SkinModel> {
  File? _image;
  final picker = ImagePicker();
  String _result = '';

  // Function to pick an image from the gallery
  Future<void> getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        uploadImage();
      } else {
        print('No image selected.');
      }
    });
  }

  // Function to upload the image to the backend and get the prediction
  Future<void> uploadImage() async {
    if (_image == null) return;

    try {
      // Change URL based on the device you are using
      final request = http.MultipartRequest('POST',
          Uri.parse('http://10.0.2.2:5000/predict')); // For Android Emulator
      // final request = http.MultipartRequest('POST', Uri.parse('http://192.168.1.100:5000/predict')); // For Physical Device
      // final request = http.MultipartRequest('POST', Uri.parse('http://127.0.0.1:5000/predict')); // For iOS Simulator

      request.files
          .add(await http.MultipartFile.fromPath('file', _image!.path));
      final response = await request.send();

      if (response.statusCode == 200) {
        final respStr = await response.stream.bytesToString();
        final Map<String, dynamic> result = json.decode(respStr);
        setState(() {
          _result =
              '${result['class']} with ${result['probability']}% probability';
        });
      } else {
        setState(() {
          _result = 'Failed to get prediction';
        });
      }
    } catch (e) {
      setState(() {
        _result = 'Server error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Disease  Prediction',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF607C6D),
        leading: const BackButton(
          color: Colors.white, // Change the color here
        ),
      ),
      body: Container(
        color: Color(0xFFBCC1AA),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _image == null
                    ? Text('No image selected.')
                    : ClipOval(
                        child: Container(
                          width: 250.0, // Set the width
                          height: 250.0, // Set the height
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white, // Border color
                              width: 4.0, // Border width
                            ),
                          ),
                          child: Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4F7158),
                  ),
                  onPressed: getImage,
                  child: const Text(
                    'Pick Image',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    _result,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
