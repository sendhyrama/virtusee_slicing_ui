import 'package:flutter/material.dart';
import 'package:virtusee_slicing_ui/utils/text_styles.dart';

import '../utils/colors.dart';

class DetailTokoSogol extends StatelessWidget {
  const DetailTokoSogol({required this.data, required this.status, super.key});

  final Map<String, String> data;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: status ? SuccessColor.c6 : WarningColor.c6,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            status ? "Sudah Dikunjungi" : "Belum Dikunjungi",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: PrimaryColor.c1,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Wrap(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: PrimaryColor.c5,
                size: 20,
              ),
              Container(width: 10),
              Text(
                data["distance"]!,
                style: const TextStyle(
                  color: PrimaryColor.c5,
                  fontSize: 15,
                ),
              ),
            ]
          ),
        ),
      ],
    );
  }
}