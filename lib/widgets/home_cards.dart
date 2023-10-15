import 'package:flutter/material.dart';
import 'package:zenzephyr/Utils/colors.dart';

class CustomCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final VoidCallback onPressed;

  CustomCard({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0),
        ),
        onPressed: onPressed,
        child: Card(
          elevation: 4,
          shadowColor: const Color(0xFF00BF63),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 65,
                child: Image.asset(imagePath),
              ),
              Container(
                height: 30,
                child: Center(child: Text(title)),
              ),
              Container(
                height: 40,
                child: Center(
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textColor, // Assuming you want black text color
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
