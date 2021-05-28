import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final int numberOfStars;

  RatingStars(this.numberOfStars);

  List<Icon> getStars() {
    List<Icon> star = [];

    for (int i = 0; i < numberOfStars; i++) {
      star.add(Icon(
        Icons.star,
        color: Colors.yellow,
      ));
    }
    return star;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: getStars(),
    );
  }
}
