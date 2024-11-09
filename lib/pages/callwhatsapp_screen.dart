import 'package:flutter/material.dart';
import 'package:virtusee_slicing_ui/pages/attendance_details_screen.dart';
import 'package:virtusee_slicing_ui/utils/colors.dart';
import 'package:virtusee_slicing_ui/utils/text_styles.dart';

class CallWhatsappScreen extends StatelessWidget {
  const CallWhatsappScreen({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/img_callwa.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Positioned(
              top: 40,
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyles.b4.copyWith(color: Colors.white),
              )
          ),
          Positioned(
            bottom: 44,
            right: 36,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: DangerColor.c5,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                    Icons.call_end_rounded,
                    size: 30,
                    color: Color(0xFFFBFBFB)
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
