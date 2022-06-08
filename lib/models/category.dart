import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String id;
  String name;
  final String imageURL;
  CategoryModel({
    required this.id,
    required this.name,
    required this.imageURL,
  });

  @override
  List<Object?> get props => [name, imageURL, id];

  factory CategoryModel.getFromSnapshot(DocumentSnapshot snapshot) {
    CategoryModel categoryModel =
        CategoryModel(name: snapshot['name'], imageURL: snapshot['image_url'], id: snapshot['id']);
    return categoryModel;
  }
}
