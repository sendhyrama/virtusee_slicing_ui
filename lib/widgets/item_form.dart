import 'package:flutter/material.dart';
import 'package:virtusee_slicing_ui/utils/text_styles.dart';

import '../pages/form_cekstok_screen.dart';
import '../routes.dart';
import '../utils/colors.dart';

class ItemForm extends StatelessWidget {
  const ItemForm({required this.data, required this.done, required this.title, super.key});

  final Map<String, String> data;
  final bool done;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        style: TextButton.styleFrom(
          shadowColor: Colors.grey,
          backgroundColor:Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        ),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => FormCekStokScreen(data: data))
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyles.b4.copyWith(color: Colors.black)),
              if(done) Icon(Icons.check_circle_outline, color: SuccessColor.c5) else Container()
            ]
        ),
      ),
    );
  }
}
