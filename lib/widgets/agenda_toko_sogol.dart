import 'package:flutter/material.dart';
import 'package:virtusee_slicing_ui/utils/text_styles.dart';

import '../utils/colors.dart';
import 'card_agenda.dart';

class AgendaTokoSogol extends StatelessWidget {
  const AgendaTokoSogol({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, top: 10, bottom: 6),
          child: Text(
            "Agenda",
            style: TextStyles.b4.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
        ),
        const Row(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CardAgenda(
                    description: "Pengecekan\nStok",
                    image: "assets/images/agenda_cekstok.png")),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: CardAgenda(
                    description: "Tindak Lanjut\nPesanan",
                    image: "assets/images/agenda_tindaklanjut.png")),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: CardAgenda(
                    description: "Penawaran\nProduk Baru",
                    image: "assets/images/agenda_produkbaru.png")),
          ],
        )
      ],
    );
  }
}
