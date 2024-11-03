import 'package:flutter/material.dart';
import 'package:virtusee_slicing_ui/pages/fingerprint_scan_screen.dart';
import 'package:virtusee_slicing_ui/utils/colors.dart';
import 'package:virtusee_slicing_ui/utils/text_styles.dart';
import 'custom_dialog.dart';

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({super.key});

  void _showStartDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          iconData: Icons.info_outline,
          title: 'Presensi Dimulai',
          description:
              'Siapkan sidik jari Anda untuk mengisi presensi otomatis. Pastikan layanan GPS pada perangkat Anda aktif untuk merekam lokasi presensi. Waktu presensi Anda akan dicatat secara otomatis dengan jam, menit, dan detik saat ini.',
          primaryButtonText: 'Lanjutkan',
          secondaryButtonText: 'Batal',
          onPrimaryButtonPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const FingerprintScanScreen()),
            );
          },
          onSecondaryButtonPressed: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "Kam, 1 Mar 2024",
            style: TextStyles.b3.copyWith(color: PrimaryColor.c5),
          ),
          const SizedBox(height: 8),
          const Text("09.00 - 17.00", style: TextStyles.t1),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _showStartDialog(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: PrimaryColor.c5,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Mulai",
                style: TextStyles.b1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
