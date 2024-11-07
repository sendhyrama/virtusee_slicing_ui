import 'package:flutter/material.dart';
import 'package:virtusee_slicing_ui/utils/text_styles.dart';

import '../utils/colors.dart';

class KeteranganTokoSogol extends StatelessWidget {
  const KeteranganTokoSogol({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Prioritas : Tinggi",
          style: TextStyles.b4.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 6),
        Text(
          "Prioritas tinggi artinya toko tersebut memiliki potensi penjualan tinggi, stok kritis, masalah urgen, promosi khusus, atau hubungan strategis.",
          style: TextStyles.b4.copyWith(fontWeight: FontWeight.normal, height: 2),
        ),
      ],
    );
  }
}