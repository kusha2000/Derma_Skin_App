import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;

class UVIndexPage extends StatefulWidget {
  @override
  _UVIndexPageState createState() => _UVIndexPageState();
}

class _UVIndexPageState extends State<UVIndexPage> {
  Position? _currentPosition;
  double? _uvIndex;
  String? _cityName;
  String apiKey = '0816dac7aafa00905cff8fdd88507b20';

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF607C6D),
      ),
      body: Container(
        color: const Color(0xFF607C6D),
        child: Center(
          child: _uvIndex != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Image.network(
                        "https://www.sknclinics.co.uk/wp-content/uploads/2018/07/UV-index-scale-scaled.jpg"),
                    const SizedBox(height: 10),
                    const Text(
                      'UV Index',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '$_uvIndex',
                      style: const TextStyle(
                          fontSize: 48,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    if (_cityName != null)
                      Text(
                        'City: $_cityName',
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    const SizedBox(height: 20),
                    _getUVIndexInfo(_uvIndex!),
                  ],
                )
              : _currentPosition == null
                  ? const CircularProgressIndicator()
                  : const Text(
                      'Fetching UV Index...',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
        ),
      ),
    );
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _currentPosition = position;
    });

    _fetchUVIndex(position.latitude, position.longitude);
    _getCityName(position.latitude, position.longitude);
  }

  Future<void> _fetchUVIndex(double lat, double lon) async {
    final url =
        'http://api.openweathermap.org/data/2.5/uvi?lat=$lat&lon=$lon&appid=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _uvIndex = data['value'];
        });
        print('Fetched UV Index: $_uvIndex');
      } else {
        print('Failed to load UV index, status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching UV index: $e');
    }
  }

  Future<void> _getCityName(double lat, double lon) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
      if (placemarks.isNotEmpty) {
        setState(() {
          _cityName = placemarks[0].locality;
        });
      }
    } catch (e) {
      print('Error getting city name: $e');
    }
  }

  Widget _getUVIndexInfo(double uvIndex) {
    String description;
    String imageUrl;

    if (uvIndex >= 0 && uvIndex <= 2) {
      description =
          "Low risk of harm from unprotected sun exposure. It's generally safe to be outside.";
    } else if (uvIndex > 2 && uvIndex <= 5) {
      description =
          "Moderate risk of harm from unprotected sun exposure. Precautions should be taken.";
    } else if (uvIndex > 5 && uvIndex <= 7) {
      description =
          "High risk of harm from unprotected sun exposure. Protection is essential.";
    } else if (uvIndex > 7 && uvIndex <= 10) {
      description =
          "Very high risk of harm from unprotected sun exposure. Serious health risks are possible.";
    } else {
      description =
          "Extreme risk of harm from unprotected sun exposure. Health risks are significant.";
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(description,
              style: const TextStyle(color: Colors.white, fontSize: 20)),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
