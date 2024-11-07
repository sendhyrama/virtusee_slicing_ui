import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:virtusee_slicing_ui/utils/colors.dart';
import 'package:virtusee_slicing_ui/utils/text_styles.dart';

class CustomFormTextfield extends StatelessWidget {
  final String title;
  final String hint;
  final double leftPadding;
  final double rightPadding;

  const CustomFormTextfield({
    super.key,
    required this.title,
    required this.hint,
    this.leftPadding = 20,
    this.rightPadding = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, top: 20, bottom: 14),
          child: Row(
              children: [
                Text(title, style: TextStyles.b3.copyWith(color: Colors.black)),
                Text(" *", style: TextStyles.b3.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.red)),
              ]
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
          child: TextField(
            keyboardType: title == 'Jumlah' ? TextInputType.number : TextInputType.text ,
            decoration: InputDecoration(
              filled: true,
              fillColor: PrimaryColor.c2,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0), // Adds border radius
                borderSide: BorderSide.none, // Removes the border/underline
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              hintText: hint,
              hintStyle: TextStyles.b3.copyWith(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.normal
              ),
            ),
            style: TextStyles.b3.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.normal
            ),
          ),
        )
      ],
    );
  }
}
