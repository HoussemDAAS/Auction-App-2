import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {
  final String image;
  final String title;
  final DateTime deadline;
  final int min;
  final int max;
  final String publisher;
  final String description;
  final String docId; 

  ItemModel(
      {required this.image,
      required this.title,
      required this.deadline,
      required this.min,
      required this.max,
      required this.publisher,
      required this.description ,
      this.docId=""
      });
  factory ItemModel.fromJson(DocumentSnapshot  json) {
    return ItemModel(
        image: json['image'],
        title: json['titre'],
        deadline: json['deadline'].toDate() ,
        min: json['min'],
        max: json['max'],
        publisher: json['publisher'],
        description: json['description'] , 
        docId : json.id,
        );
  }
}
