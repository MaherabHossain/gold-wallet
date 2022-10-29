// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget BannerImage() {
  return Container(
    child: CarouselSlider(
      items: [
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhs-S2WIGlSISDXrpr3TQCsm2MlGCr2mNcug&usqp=CAU"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(
                  "https://img.freepik.com/free-photo/gold-growing-arrow-with-gold-coin-money-stacks-gold-bar-business-finance-savings-investment-concept-background-3d-illustration_56104-1960.jpg?w=2000"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgoWCSkN5CnvolDrEnYgPnOCaMsTTlt7ymYQ&usqp=CAU'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
      options: CarouselOptions(
        height: 150.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
    ),
  );
}
