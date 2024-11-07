import 'package:flutter/material.dart';
import 'package:virtusee_slicing_ui/utils/colors.dart';
import 'package:virtusee_slicing_ui/utils/text_styles.dart';

import '../routes.dart';

class StoreListWidget extends StatefulWidget {
  const StoreListWidget({super.key, required this.name});

  final String? name;

  @override
  _StoreListWidget createState() => _StoreListWidget();
}

class _StoreListWidget extends State<StoreListWidget> {

  final List<Map<String, String>> stores = [
    {
      "name": "Toko Sogol",
      "address": "Jl. Kenangan Blok A No. 53",
      "status": "Belum Dikunjungi",
      "distance": "500m",
      "hours": "09.00 - 20.00"
    },
    {
      "name": "Toko Makmur Jaya",
      "address": "Jl. Kenangan Blok A No. 53",
      "status": "Belum Dikunjungi",
      "distance": "500m",
      "hours": "09.00 - 20.00"
    },
    {
      "name": "Toko Sederhana",
      "address": "Jl. Kenangan Blok A No. 53",
      "status": "Belum Dikunjungi",
      "distance": "500m",
      "hours": "09.00 - 20.00"
    },
    {
      "name": "Cahaya Abadi",
      "address": "Jl. Kenangan Blok A No. 53",
      "status": "Belum Dikunjungi",
      "distance": "500m",
      "hours": "09.00 - 20.00"
    },
    {
      "name": "Toko Sinar Mas",
      "address": "Jl. Kenangan Blok A No. 53",
      "status": "Belum Dikunjungi",
      "distance": "500m",
      "hours": "09.00 - 20.00"
    },
    {
      "name": "Toko Asia Timur",
      "address": "Jl. Kenangan Blok A No. 53",
      "status": "Belum Dikunjungi",
      "distance": "500m",
      "hours": "09.00 - 20.00"
    },
    {
      "name": "Toko Bernadya",
      "address": "Jl. Kenangan Blok A No. 53",
      "status": "Belum Dikunjungi",
      "distance": "500m",
      "hours": "09.00 - 20.00"
    },
    {
      "name": "Toko Nabila",
      "address": "Jl. Kenangan Blok A No. 53",
      "status": "Belum Dikunjungi",
      "distance": "500m",
      "hours": "09.00 - 20.00"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(
          left: 20, right: 20, bottom: 20),
      itemCount: stores.length,
      itemBuilder: (context, index) {
        final store = stores[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            title: Text(
              store["name"]!,
              style: TextStyles.b3.copyWith(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              "${store["address"]!}\n${store["hours"]!}",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
            trailing: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    store["distance"]!,
                    style: const TextStyle(
                      color: PrimaryColor.c5,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: widget.name != null && widget.name != "" && widget.name == store["name"]
                        ? SuccessColor.c5 : Colors.orange,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    widget.name != null && widget.name != ""  && widget.name == store["name"]
                        ? "Sudah Dikunjungi" : store["status"]!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
            onTap:() async {
              Navigator.of(context).pushNamed(Routes.detailToko, arguments: {'data': store, 'status': false, 'checkOut': false});
            }
          ),
        );
      },
    );
  }
}
