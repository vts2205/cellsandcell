import 'package:carousel_slider/carousel_slider.dart';
import 'package:cellsandcell/constants/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  StoreScreen({Key? key}) : super(key: key);

  final imagesList = [
    'assets/images/introimg2.png',
    'assets/images/introimg3.png',
    'assets/images/introimg4.png',
  ];

  final titleList = ['Join with Us', 'Earn Money', 'Share Money'];

  final descriptionList = [
    'Let\'s join together to become digitalized',
    'Make money digitally by buying accessories from us',
    'Share your money to your friends and buy a product using that'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pale,
      body: Center(
        child: CarouselSlider.builder(
            itemCount: imagesList.length,
            itemBuilder: (context, index, realIndex) {
              final image = imagesList[index];
              final title = titleList[index];
              final description = descriptionList[index];
              return buildCarouselImage(image, title, description, index);
            },
            options: CarouselOptions(
                viewportFraction: 1,
                height: 500,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5))),
      ),
    );
  }

  buildCarouselImage(String image, title, description, int index) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Column(
          children: [
            Image.asset(
              image,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
