import 'package:flutter/material.dart';
import 'package:virtusee_slicing_ui/pages/attendance_details_screen.dart';
import 'package:virtusee_slicing_ui/utils/colors.dart';
import 'package:virtusee_slicing_ui/utils/text_styles.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  void _navigateToDetailsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AttendanceDetailsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor.c5,
        elevation: 0,
        title: Text('Catat Kehadiran',
            style: TextStyles.h2
                .copyWith(color: Colors.white, fontWeight: FontWeight.w500)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/proof.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 60,
            child: GestureDetector(
              onTap: () => _navigateToDetailsPage(context),
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black26,
                    width: 4,
                  ),
                ),
                child: const Icon(
                  Icons.camera_alt,
                  size: 30,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
