import 'package:travel_app/core/R.dart';

class Category {
  static const data = [
    Category('History and Culture', R.historyAndCultureImage),
    Category('Museum and Art', R.museumAndArtImage),
    Category('Accommodation', R.accomodationImage),
    Category('Shopping', R.shoppingImage),
    Category('Gastronomy', R.gastronomyImage),
    Category('Nature and Agro', R.natureAndAgroImage),
  ];

  final String name;
  final String image;

  const Category(this.name, this.image);
}

class Category2 {
  static final data = [
    Category2(text: 'The Romanian – Solo Exhibition', imageName: R.accomodationImage, place: "Baku", isLiked: false),
    Category2(text: 'a good view of the lower', imageName: R.gastronomyImage, place: "Gobustan", isLiked: false),
    Category2(text: 'The Romanian', imageName: R.museumAndArtImage, place: "Baku", isLiked: false),
    Category2(
        text: 'The Romanian – Solo Exhibition',
        imageName: R.museumAndArtImage,
        place: " keep guests company",
        isLiked: false),
    Category2(text: 'Solo', imageName: R.natureAndAgroImage, place: "Baku", isLiked: false),
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
