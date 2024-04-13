import 'package:cloud_firestore/cloud_firestore.dart';

class CardModel {
  final String? id;
  final String? term;
  final String? definition;
  final String? imgUrl;

  CardModel({this.id, this.term, this.definition, this.imgUrl});

  factory CardModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    if (data == null) throw Exception("Invalid data in Firestore");
    return CardModel(
      id: snapshot.id,
      term: data['front'],
      definition: data['back'],
      imgUrl: data['imgUrl'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "front": term,
      "back": definition,
      "imgUrl": imgUrl,
    };
  }
}
