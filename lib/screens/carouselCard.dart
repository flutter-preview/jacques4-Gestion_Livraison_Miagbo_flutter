import 'package:flutter/material.dart';

class CarouselCard extends StatelessWidget {
  final String imageUrl;

  CarouselCard({
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      shadowColor: Colors.grey,
      elevation: 10.0,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(
            imageUrl,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width * 0.9,
          )),
    );
  }
}
