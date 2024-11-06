import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/text_styles.dart';
import 'custom_dialog.dart';

class ScheduleWidget2 extends StatefulWidget {
  const ScheduleWidget2({super.key});

  @override
  _ScheduleWidget2State createState() => _ScheduleWidget2State();
}

class _ScheduleWidget2State extends State<ScheduleWidget2> {
  bool isAttendanceStarted = true;
  bool isPaused = false;
  bool isStopped = false;
  String displayTime = "00 : 09 : 35"; // Initial time display

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          title: 'Konfirmasi Berhenti',
          iconData: Icons.info_outline,
          description:
              'Jika kamu memilih berhenti, kamu tidak bisa check-in lagi hari ini. Pastikan semua kunjungan toko sudah selesai.',
          primaryButtonText: 'Berhenti',
          secondaryButtonText: 'Kembali',
          onPrimaryButtonPressed: () {
            setState(() {
              isAttendanceStarted = false;
              isPaused = false;
              isStopped = true;
              displayTime = "09.00 - 17.00"; // Update time to new value
            });
            Navigator.of(context).pop();
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
          Text(displayTime, style: TextStyles.t1), // Display updated time
          const SizedBox(height: 16),
          if (isStopped)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
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
            )
          else if (isAttendanceStarted)
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        isPaused = !isPaused;
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: PrimaryColor.c5,
                        width: 1.5,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(isPaused ? 'Lanjutkan' : 'Jeda',
                        style: TextStyles.b1.copyWith(color: PrimaryColor.c5)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _showConfirmationDialog(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PrimaryColor.c5,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('Berhenti',
                        style: TextStyles.b1.copyWith(color: Colors.white)),
                  ),
                ),
              ],
            )
          else
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
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
