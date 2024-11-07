import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:virtusee_slicing_ui/utils/colors.dart';
import 'package:virtusee_slicing_ui/utils/text_styles.dart';

class CustomDateButton extends StatefulWidget {
  const CustomDateButton({super.key});

  @override
  _CustomDateButton createState() => _CustomDateButton();
}

class _CustomDateButton extends State<CustomDateButton> {

  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => selectDate(context),
            style: ElevatedButton.styleFrom(
              alignment: Alignment.centerLeft,
              backgroundColor: PrimaryColor.c2,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '${DateFormat('dd MMMM yyyy').format(date)}',
                style: TextStyles.b3.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.normal
                ),
              ),
            ),
          ),
        ),
      );
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.light(
              primary: Colors.lightBlue,         // Header background color
              onPrimary: Colors.white,           // Header text color
              onSurface: Colors.black,           // Body text color
            ),
            dialogBackgroundColor: Colors.white, // Background color of the dialog
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != date) {
      setState(() {
        date = pickedDate;
      });
    }
  }
}
