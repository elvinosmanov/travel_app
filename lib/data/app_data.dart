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

