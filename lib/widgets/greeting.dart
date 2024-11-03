import 'package:flutter/material.dart';
import 'package:virtusee_slicing_ui/utils/text_styles.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Selamat Datang,",
                  style: TextStyles.h1.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w400)),
              Text("Raka", style: TextStyles.h1.copyWith(color: Colors.white)),
              const SizedBox(
                height: 10,
              ),
              Text("Sales", style: TextStyles.b4.copyWith(color: Colors.white)),
            ],
          ),
          const Spacer(),
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
        ],
      ),
    );
  }
}
