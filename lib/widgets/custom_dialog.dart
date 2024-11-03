import 'package:flutter/material.dart';
import 'package:virtusee_slicing_ui/utils/colors.dart';
import 'package:virtusee_slicing_ui/utils/text_styles.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String? description;
  final IconData? iconData;
  final Color? iconColor;
  final String? primaryButtonText;
  final String? secondaryButtonText;
  final VoidCallback? onPrimaryButtonPressed;
  final VoidCallback? onSecondaryButtonPressed;

  const CustomDialog({
    super.key,
    required this.title,
    this.description,
    this.iconData,
    this.iconColor,
    this.primaryButtonText,
    this.secondaryButtonText,
    this.onPrimaryButtonPressed,
    this.onSecondaryButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (iconData != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Icon(
                  iconData,
                  color: iconColor ?? PrimaryColor.c5,
                  size: 50,
                ),
              ),
            Text(title, style: TextStyles.b1),
            const SizedBox(height: 12),
            if (description != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Text(
                  description!,
                  style: TextStyles.b4.copyWith(color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
              ),
            if (description == null)
              const SizedBox(
                  height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (secondaryButtonText != null)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: onSecondaryButtonPressed ??
                          () => Navigator.of(context).pop(),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: PrimaryColor.c5,
                        side: const BorderSide(color: PrimaryColor.c5),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        textStyle: TextStyles.b3,
                      ),
                      child: Text(secondaryButtonText!),
                    ),
                  ),
                if (secondaryButtonText != null) const SizedBox(width: 12),
                if (primaryButtonText != null)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onPrimaryButtonPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: PrimaryColor.c5,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        textStyle: TextStyles.b3.copyWith(color: Colors.white),
                      ),
                      child: Text(primaryButtonText!),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
