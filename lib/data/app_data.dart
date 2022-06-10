import 'package:travel_app/core/R.dart';

  class Category {
    static const data = [
      Category('History and Culture', R.flagInterestImage),
      Category('Museum and Art', R.flagInterestImage),
      Category('Accommodation', R.flagInterestImage),
      Category('Shopping', R.flagInterestImage),
      Category('Gastronomy', R.flagInterestImage),
      Category('Nature and Agro', R.flagInterestImage),
    ];

    final String name;
    final String image;

    const Category(this.name, this.image);
  }

  class Category2 {
    static final data = [
      Category2(
          text: 'The Romanian – Solo Exhibition',
          imageName: R.flagInterestImage,
          place: "Baku",
          isLiked: false),
      Category2(
          text: 'Good view of the lower',
          imageName: R.flagInterestImage,
          place: "Gobustan",
          isLiked: false),
      Category2(text: 'The Romanian', imageName: R.flagInterestImage, place: "Baku", isLiked: false),
      Category2(
          text: 'The Romanian – Solo Exhibition',
          imageName: R.flagInterestImage,
          place: " keep guests company",
          isLiked: false),
      Category2(text: 'Solo', imageName: R.flagInterestImage, place: "Baku", isLiked: false),
      Category2(
          text: 'Cahid Suleymanov',
          imageName: R.tripImage,
          place: "Bakuf ssdf sadfdfsdfdssa",
          isLiked: false),
      Category2(
          text: 'Good view of the lower',
          imageName: R.flagInterestImage,
          place: "Gobustan",
          isLiked: false),
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

    static alma(){

    }
  }


