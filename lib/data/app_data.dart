import 'package:travel_app/core/R.dart';

class Category {
  static const data = [
    Category('History and Culture', R.historyAndCulture),
    Category('Museum and Art', R.museumAndArt),
    Category('Accommodation', R.accomodation),
    Category('Shopping', R.shopping),
    Category('Gastronomy', R.gastronomy),
    Category('Nature and Agro', R.natureAndAgro),
  ];

  final String name;
  final String image;

  const Category(this.name, this.image);
}

class Category2 {
  static final data = [
    Category2(text: 'The Romanian – Solo Exhibition', imageName: R.accomodation, place: "Baku", isLiked: false),
    Category2(text: 'a good view of the lower', imageName: R.gastronomy, place: "Gobustan", isLiked: false),
    Category2(text: 'The Romanian', imageName: R.museumAndArt, place: "Baku", isLiked: false),
    Category2(
        text: 'The Romanian – Solo Exhibition',
        imageName: R.museumAndArt,
        place: " keep guests company",
        isLiked: false),
    Category2(text: 'Solo', imageName: R.natureAndAgro, place: "Baku", isLiked: false),
    Category2(text: 'Cahid Suleymanov', imageName: R.tripImage, place: "Bakuf ssdf sadfdfsdfdssa", isLiked: false),
  ];

  final String text;
  final String imageName;
  final String place;
  bool isLiked;
  Category2({
    required this.text,
    required this.imageName,
    required this.place,
    required this.isLiked,
  });
}
