import 'package:flutter/material.dart';
import 'package:virtusee_slicing_ui/utils/colors.dart';
import 'package:virtusee_slicing_ui/utils/text_styles.dart';
import 'package:virtusee_slicing_ui/widgets/agenda_toko_sogol.dart';
import 'package:virtusee_slicing_ui/widgets/custom_button.dart';
import 'package:virtusee_slicing_ui/widgets/custom_dialog.dart';
import 'package:virtusee_slicing_ui/widgets/custom_outline_button.dart';
import 'package:virtusee_slicing_ui/widgets/detail_toko_sogol.dart';
import 'package:virtusee_slicing_ui/widgets/header_toko_sogol.dart';
import 'package:virtusee_slicing_ui/widgets/info_checkin.dart';
import 'package:virtusee_slicing_ui/widgets/item_form.dart';
import 'package:virtusee_slicing_ui/widgets/keterangan_toko_sogol.dart';
import '../routes.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/greeting.dart';
import '../widgets/schedule.dart';
import '../widgets/store_list.dart';


class FormListScreen extends StatefulWidget {
  const FormListScreen({required this.data, required this.done, super.key});

  final Map<String, String> data;
  final bool done;

  @override
  _FormListScreen createState() => _FormListScreen();
}

class _FormListScreen extends State<FormListScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: PrimaryColor.c5,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => widget.done
                  ? Navigator.popAndPushNamed(context, Routes.detailToko, arguments: {"data": widget.data, "status": true, "checkOut": true})
                  : Navigator.of(context).pop()
            ),
            title: Text(
                'Isi Formulir',
                style: TextStyles.b1.copyWith(fontWeight: FontWeight.bold, color: Colors.white)
            ),
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoCheckin(name: "${widget.data["name"]}"),

                ItemForm(title: "Formulir Pengecekan Stok", done: widget.done, data: widget.data),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(height: 1, color: Color(0xFFCDCDCD))
                ),

                ItemForm(title: "Formulir Tindak Lanjut Pesanan", done: widget.done, data: widget.data,),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(height: 1, color: Color(0xFFCDCDCD))
                ),

                ItemForm(title: "Formulir Penawaran Produk Baru", done: widget.done, data: widget.data,),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(height: 1, color: Color(0xFFCDCDCD))
                ),
                
              ],
            ),
          ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
