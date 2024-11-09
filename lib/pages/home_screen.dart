import 'package:flutter/material.dart';
import 'package:virtusee_slicing_ui/utils/text_styles.dart';
import '../utils/status_bar.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/greeting.dart';
import '../widgets/schedule.dart';
import '../widgets/store_list.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.name});

  final String? name;
  final ValueNotifier<bool> isStarted = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    StatusBar.setLightStatusBar();

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFF3EC3FF),
                    Color(0xFF093F68),
                  ],
                  stops: [0.0, 0.99],
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GreetingWidget(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: ScheduleWidget(),
                  ),
                  SizedBox(height: 24.0),
                ],
              ),
            ),
            Container(
              color: Colors.white54,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    const Text('Daftar Toko Kunjungan', style: TextStyles.b3),
                    const Spacer(),
                    Text(
                      'Hari ini',
                      style: TextStyles.b3.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.white54,
                child: StoreListWidget(name: name, isStarted: isStarted),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
