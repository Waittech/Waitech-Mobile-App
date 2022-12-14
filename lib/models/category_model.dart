import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final Image image;

  const Category({required this.id, required this.name, required this.image});

  @override
  List<Object?> get props => [id, name, image];

  static List<Category> categories = [
    Category(
      id: 1,
      name: 'Pizzalar',
      image: Image.asset('assets/images/BikeAnimated.png'),
    ),
    Category(
      id: 2,
      name: 'Burgerlar',
      image: Image.asset('assets/images/BikeAnimated.png'),
    ),
    Category(
      id: 3,
      name: 'Salatalar',
      image: Image.asset('assets/images/BikeAnimated.png'),
    ),
    Category(
      id: 4,
      name: 'Tatlılar',
      image: Image.asset('assets/images/BikeAnimated.png'),
    ),
    Category(
      id: 5,
      name: 'Çorbalar',
      image: Image.asset('assets/images/BikeAnimated.png'),
    ),
  ];
}
