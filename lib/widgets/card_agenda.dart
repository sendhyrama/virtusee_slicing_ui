import 'package:flutter/material.dart';
import 'package:virtusee_slicing_ui/utils/colors.dart';
import 'package:virtusee_slicing_ui/utils/text_styles.dart';

class CardAgenda extends StatelessWidget {
  final String description;
  final String image;

  const CardAgenda({super.key, required this.description, required this.image});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      children: [
        Container(
          width: 70,
          height: 70,
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                  image,
                  width: 50,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Text(
            description,
            style: TextStyles.b4.copyWith(color: Color(0xFF2A2A2A), fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
