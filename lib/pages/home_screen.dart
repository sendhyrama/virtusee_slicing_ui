import 'package:flutter/material.dart';
import 'package:virtusee_slicing_ui/utils/colors.dart';
import 'package:virtusee_slicing_ui/utils/text_styles.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/greeting.dart';
import '../widgets/schedule.dart';
import '../widgets/store_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.name});

  final String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [
              PrimaryColor.c5,
              Colors.blue.shade50,
            ],
            stops: const [0.0, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GreetingWidget(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ScheduleWidget(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 10.0),
                child: Row(
                  children: [
                    const Text('Daftar Toko Kunjungan', style: TextStyles.b3),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Text(
                        'Hari ini',
                        style: TextStyles.b3.copyWith(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: StoreListWidget(name: name)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
