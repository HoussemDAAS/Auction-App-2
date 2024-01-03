// ignore_for_file: file_names

import 'package:auction_app/models/item.model.dart';
import 'package:auction_app/pages/details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemWidget extends StatelessWidget {
 final ItemModel item ;
   const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 280,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.orange,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              item.image,
              height: 150,
            ),
            Container(
              height: 100,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                     Text(item.deadline.day.toString() +'/' + item.deadline.month.toString()+'/' + item.deadline.year.toString()),
                    Center(
                        child:
                         SizedBox(
                          width: 180,
                          child: ElevatedButton(
                      onPressed: () { 
                        Get.to(()=>ItemDetails(item: item));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black54,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20.0), // Adjust the radius as needed
                        ),
                      ),
                      child: const Text(
                        "Voir Plus",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                         )
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
