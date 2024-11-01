import 'package:flutter/material.dart';
import 'package:virtusee_slicing_ui/utils/colors.dart';
import 'package:virtusee_slicing_ui/utils/text_styles.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      selectedItemColor: PrimaryColor.c5,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyles.b4,
      unselectedLabelStyle: TextStyles.b4,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
        BottomNavigationBarItem(icon: Icon(Icons.insert_chart), label: 'Aktivitas'),
        BottomNavigationBarItem(icon: Icon(Icons.assessment), label: 'Kinerja'),
        BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Ajuan'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
      ],
    );
  }
}
