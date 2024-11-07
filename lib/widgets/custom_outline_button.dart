import 'package:flutter/material.dart';
import 'package:virtusee_slicing_ui/utils/colors.dart';
import 'package:virtusee_slicing_ui/utils/text_styles.dart';

class CustomOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color color;
  final Color textColor;

  const CustomOutlineButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = PrimaryColor.c5,
    this.textColor = PrimaryColor.c5,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed == null ? null : onPressed,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          foregroundColor: PrimaryColor.c5,
          side: BorderSide(color: onPressed == null ? Color(0xFF4B5563) : color),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: TextStyles.b3.copyWith(
              color: onPressed == null ? Colors.grey[500] : textColor,
              fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }
}
