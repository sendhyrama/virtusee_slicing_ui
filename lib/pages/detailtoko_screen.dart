import 'package:flutter/material.dart';
import 'package:virtusee_slicing_ui/utils/colors.dart';
import 'package:virtusee_slicing_ui/utils/text_styles.dart';
import 'package:virtusee_slicing_ui/widgets/agenda_toko_sogol.dart';
import 'package:virtusee_slicing_ui/widgets/custom_button.dart';
import 'package:virtusee_slicing_ui/widgets/custom_dialog.dart';
import 'package:virtusee_slicing_ui/widgets/custom_outline_button.dart';
import 'package:virtusee_slicing_ui/widgets/detail_toko_sogol.dart';
import 'package:virtusee_slicing_ui/widgets/header_toko_sogol.dart';
import 'package:virtusee_slicing_ui/widgets/keterangan_toko_sogol.dart';
import '../routes.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/greeting.dart';
import '../widgets/schedule.dart';
import '../widgets/store_list.dart';


class DetailTokoScreen extends StatefulWidget {
  const DetailTokoScreen({required this.data, required this.status, super.key});

  final Map<String, String> data;
  final bool status;

  @override
  _DetailTokoScreen createState() => _DetailTokoScreen();
}

// void _startAttendance(BuildContext context) {}

class _DetailTokoScreen extends State<DetailTokoScreen> {

  bool locationActive = false;
  bool checkIn = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: PrimaryColor.c5,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
                'Detail Toko',
                style: TextStyles.b1.copyWith(fontWeight: FontWeight.bold, color: Colors.white)
            ),
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderTokoSogol(data: widget.data),
                Padding(padding: EdgeInsets.all(20), child: DetailTokoSogol(data: widget.data, status: widget.status)),
                Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: KeteranganTokoSogol()),
                AgendaTokoSogol(),
                if(checkIn)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CustomOutlineButton(text: "Isi Formulir", onPressed: (){
                      Navigator.of(context).pushNamed(
                          Routes.formList, arguments: {'name': widget.data["name"], 'done': false }
                      );
                    }),
                  )
                else Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CustomButton(text: "Check In", onPressed: (){
                    if(locationActive) {
                      _showCheckInSuccessDialog();
                      setState(() {
                        checkIn = true;
                      });
                    } else _showActivateLocationDialog();
                  }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: CustomButton(text: "Check Out", onPressed: null)
                ),
              ],
            ),
          ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  void _showCheckInSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          title: 'Check In Berhasil',
          iconData: Icons.check_circle_outline_rounded,
          iconColor: SuccessColor.c6,
          primaryButtonText: 'Oke',
          onPrimaryButtonPressed: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  void _showActivateLocationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          title: 'Konfirmasi',
          iconData: Icons.info_outline,
          description: "Untuk melanjutkan, perangkat Anda harus menggunakan Akurasi Lokasi",
          primaryButtonText: 'Aktifkan',
          secondaryButtonText: 'Lain Kali',
          onPrimaryButtonPressed: () {
            setState(() {
              locationActive = true;
            });
            Navigator.of(context).pop();
          },
          onSecondaryButtonPressed: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
