import 'dart:io';

import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:virtusee_slicing_ui/pages/callwhatsapp_screen.dart';
import 'package:virtusee_slicing_ui/utils/text_styles.dart';

import '../utils/colors.dart';

class HeaderTokoSogol extends StatelessWidget {
  const HeaderTokoSogol({required this.data, super.key});

  final Map<String, String> data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.topCenter,
          child: Image.asset(
            'assets/images/img_tokosogol.png',
            fit: BoxFit.cover,
            height: 250,
            width: MediaQuery.of(context).size.width,
          ),
        ),

        Positioned(
          left: 20,
          bottom: 20,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "${data["name"]}",
                          softWrap: true,
                          style: TextStyles.h1.copyWith(color: Colors.white),
                        ),
                      ),

                      GestureDetector(
                        onTap: () => MapsLauncher.launchCoordinates(-7.292849925298976,112.71184551486886),
                        child: Row(
                          children: [
                            Icon(Icons.location_on_outlined, color: Colors.white),
                            SizedBox(width: 10),
                            Expanded(
                              flex: 3,
                              child: Text(
                                "${data["address"]}",
                                softWrap: true,
                                style: TextStyles.b4.copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            Icon(Icons.access_time, color: Colors.white),
                            SizedBox(width: 10), // Use SizedBox for spacing
                            Text(
                              "${data["hours"]}",
                              style:
                                  TextStyles.b4.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),


                    ],
                  ),
                ),

                const Spacer(),

                // IconButton for Call
                Flexible(
                  child: IconButton(
                    padding: EdgeInsets.only(right: 20),
                    style: IconButton.styleFrom(
                      backgroundColor: PrimaryColor.c5,
                      padding: EdgeInsets.all(12),
                    ),
                    iconSize: 30,
                    icon: Icon(Icons.call, color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CallWhatsappScreen(name: "${data["name"]}",)),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // static Future<void> openMap() async {
  //   String googleUrl = 'https://www.google.com/maps/search/?api=1&query=-7.292849925298976,112.71184551486886';
  //   Uri uri = Uri.parse(googleUrl);
  //
  //   if (await canLaunchUrl(uri)) {
  //     launchUrl(uri, mode: LaunchMode.externalApplication);
  //   } else {
  //     throw 'Could not open the map.';
  //   }
  // }

}
