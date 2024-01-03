import 'package:flutter/material.dart';
import 'package:auction_app/models/item.model.dart';

class ItemDetails extends StatelessWidget {
  final ItemModel item;

  const ItemDetails({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
           children: [
             Image.network(
              item.image,
              height: 400,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: BackButton(color: Colors.white,),
            )
           ],
          ),
          const SizedBox(height: 16),
          Text(
            item.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text('Deadline: ${item.deadline.toString()}'),
          const SizedBox(height: 8),
          Text('Min Bid: \$${item.min}'),
          const SizedBox(height: 8),
          Text('Max Bid: \$${item.max}'),
          const SizedBox(height: 8),
          Text('Publisher: ${item.publisher}'),
          const SizedBox(height: 8),
          Text('Description: ${item.description}'),
        ],
      ),
    );
  }
}
