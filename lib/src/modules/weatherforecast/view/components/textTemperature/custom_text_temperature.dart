import 'package:flutter/material.dart';

class CustomTextTemperature extends StatelessWidget {
  final String city;
  final String description;
  final String temperature;
  final IconData icon;

  const CustomTextTemperature({
    Key? key,
    required this.city,
    required this.description,
    required this.temperature,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Icon(icon, size: 70),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              description,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              temperature,
              style: const TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              city,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
