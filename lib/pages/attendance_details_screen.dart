import 'package:flutter/material.dart';
import 'package:virtusee_slicing_ui/utils/colors.dart';
import '../utils/status_bar.dart';
import '../utils/text_styles.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_dialog.dart';
import 'home_screen_2.dart';

class AttendanceDetailsScreen extends StatelessWidget {
  const AttendanceDetailsScreen({super.key});

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          title: 'Absensi Berhasil Disimpan!',
          iconColor: Colors.green,
          iconData: Icons.check_circle_outline,
          primaryButtonText: 'Kembali ke Beranda',
          onPrimaryButtonPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen2()),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    StatusBar.setTransparentStatusBar();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Catat Kehadiran',
          style: TextStyles.h2
              .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: PrimaryColor.c5,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text('Rabu, 25 Januari 2024',
                style: TextStyles.b1.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/proof.png',
                width: 180,
                height: 240,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: Colors.white,
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Informasi Absensi',
                        style: TextStyles.b1
                            .copyWith(fontWeight: FontWeight.w600)),
                    const Divider(),
                    _buildInfoRow('Tanggal', '25 Jan 2024'),
                    _buildInfoRow('Jam Masuk', '08:56:00'),
                    _buildInfoRow('Jam Keluar', '17:05:05'),
                    _buildInfoRow('Lokasi', 'Toko Makmur'),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: PrimaryColor.c5),
                        color: PrimaryColor.c1,
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.location_on,
                              color: PrimaryColor.c5, size: 20),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Jl. Kali Sekretaris No.29, RT.4/RW.5, Duri Kepa, Kec. Kb. Jeruk, Kota Jakarta Barat',
                              style: TextStyles.b4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            CustomButton(
              text: 'Simpan',
              onPressed: () => _showSuccessDialog(context),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyles.b2),
          Text(value, style: TextStyles.b2),
        ],
      ),
    );
  }
}
