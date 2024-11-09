import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virtusee_slicing_ui/utils/colors.dart';
import 'package:virtusee_slicing_ui/utils/text_styles.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      selectedItemColor: PrimaryColor.c5,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyles.b4,
      unselectedLabelStyle: TextStyles.b4,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/beranda.svg',
            color: Colors.grey,
            height: 24,
            width: 24,
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/beranda.svg',
            color: PrimaryColor.c5,
            height: 24,
            width: 24,
          ),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/aktivitas.svg',
            color: Colors.grey,
            height: 24,
            width: 24,
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/aktivitas.svg',
            color: PrimaryColor.c5,
            height: 24,
            width: 24,
          ),
          label: 'Aktivitas',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/kinerja.svg',
            color: Colors.grey,
            height: 24,
            width: 24,
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/kinerja.svg',
            color: PrimaryColor.c5,
            height: 24,
            width: 24,
          ),
          label: 'Kinerja',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/ajuan.svg',
            color: Colors.grey,
            height: 24,
            width: 24,
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/ajuan.svg',
            color: PrimaryColor.c5,
            height: 24,
            width: 24,
          ),
          label: 'Ajuan',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/profil.svg',
            color: Colors.grey,
            height: 24,
            width: 24,
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/profil.svg',
            color: PrimaryColor.c5,
            height: 24,
            width: 24,
          ),
          label: 'Profil',
        ),
      ],
    );
  }
}
