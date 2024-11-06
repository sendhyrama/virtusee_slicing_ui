import 'package:flutter/material.dart';
import 'package:virtusee_slicing_ui/utils/text_styles.dart';

import '../utils/colors.dart';

class InfoCheckin extends StatelessWidget {
  const InfoCheckin({required this.name, super.key});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.info_outline_rounded, color: PrimaryColor.c5),
          SizedBox(width: 10),
          Text(
            "Check In di $name",
            style: TextStyles.b4.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
