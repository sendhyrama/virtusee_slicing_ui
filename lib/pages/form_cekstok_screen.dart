import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:virtusee_slicing_ui/pages/form_list_screen.dart';
import 'package:virtusee_slicing_ui/utils/colors.dart';
import 'package:virtusee_slicing_ui/utils/text_styles.dart';
import 'package:virtusee_slicing_ui/widgets/agenda_toko_sogol.dart';
import 'package:virtusee_slicing_ui/widgets/custom_button.dart';
import 'package:virtusee_slicing_ui/widgets/custom_dialog.dart';
import 'package:virtusee_slicing_ui/widgets/custom_form_textfield.dart';
import 'package:virtusee_slicing_ui/widgets/custom_outline_button.dart';
import 'package:virtusee_slicing_ui/widgets/detail_toko_sogol.dart';
import 'package:virtusee_slicing_ui/widgets/header_toko_sogol.dart';
import 'package:virtusee_slicing_ui/widgets/info_checkin.dart';
import 'package:virtusee_slicing_ui/widgets/item_form.dart';
import 'package:virtusee_slicing_ui/widgets/keterangan_toko_sogol.dart';
import '../routes.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/custom_date_button.dart';
import '../widgets/greeting.dart';
import '../widgets/schedule.dart';
import '../widgets/store_list.dart';

class FormCekStokScreen extends StatefulWidget {
  const FormCekStokScreen({super.key, required this.data});

  final Map<String, String> data;

  @override
  _FormCekStokScreen createState() => _FormCekStokScreen();
}

class _FormCekStokScreen extends State<FormCekStokScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: PrimaryColor.c5,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
            'Formulir Pengecekan Stok',
            style: TextStyles.b1.copyWith(fontWeight: FontWeight.bold, color: Colors.white)
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                    padding: EdgeInsets.only(left: 20, top: 20, bottom: 14),
                    child: Row(
                        children: [
                          Text("Tanggal Kunjungan", style: TextStyles.b3.copyWith(color: Colors.black)),
                          Text(" *", style: TextStyles.b3.copyWith(fontWeight: FontWeight.bold, color: Colors.red)),
                        ]
                    ),
                ),
                CustomDateButton(),

                CustomFormTextfield(title: "Nama Produk", hint: "cth: Tas Ransel"),
                CustomFormTextfield(title: "Jumlah Produk", hint: "cth: 500 pcs"),
                CustomFormTextfield(title: "Produk yang Hampir Habis (20%)", hint: "cth: Botol Minum"),

                Row(
                  children: [
                    Flexible(flex: 6, child: CustomFormTextfield(title: "Penarikan Produk", hint: "cth: Ikat Pinggang", rightPadding: 10, leftPadding: 20,)),
                    Flexible(flex: 2, child: CustomFormTextfield(title: "Jumlah", hint: "10", leftPadding: 0, rightPadding: 20)),
                  ],
                ),

                CustomFormTextfield(title: "Catatan Tambahan", hint: "cth: Penarikan Bolpoin Vtech karena tinta kering"),

                Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 40),
                    child: CustomButton(text: "Simpan", onPressed: (){
                      _showStartDialog(context);
                      /// TODO : show dialog > back to detail toko page > checkout active > checkout dialog
                    })
                )
              ],
            ),
            ),
          ),
      );
  }

  void _showStartDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          iconData: Icons.check_circle_outline_rounded,
          title: 'Berhasil Disimpan',
          primaryButtonText: 'Oke',
          onPrimaryButtonPressed: () {
            Navigator.popAndPushNamed(context, Routes.formList, arguments: {"data": widget.data, "done": true});
            // Navigator.pushReplacement(context,
            //   MaterialPageRoute(builder: (context) => FormListScreen(name: widget.name, done: true)));
          },
          onSecondaryButtonPressed: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

}
