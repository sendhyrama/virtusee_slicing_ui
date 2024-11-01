import 'package:flutter/material.dart';
import 'package:virtusee_slicing_ui/utils/colors.dart';
import 'package:virtusee_slicing_ui/utils/text_styles.dart';

class FooterText extends StatelessWidget {
  const FooterText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Copyright ©2024\nPT. Virtusee Peta Sukses',
      textAlign: TextAlign.center,
      style: TextStyles.b4.copyWith(color: NeutralColor.c5)
    );
  }
}
