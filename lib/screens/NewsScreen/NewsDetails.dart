// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, non_constant_identifier_names, sized_box_for_whitespace, unused_local_variable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:myapp/presentations/TextInfo.dart';

class NewsDetails extends StatefulWidget {
  const NewsDetails({Key? key}) : super(key: key);

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(
            right: 20,
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
              Text(
                "News details",
                style: TextStyle(
                  color: basicTextColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(255, 25, 44, 61),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: CachedNetworkImage(
                  imageUrl:
                      "https://images.unsplash.com/photo-1610375461246-83df859d849d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Z29sZHxlbnwwfHwwfHw%3D&w=1000&q=80",
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Text(
                "Another option is to use Cached work Image to doin the best ",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 50),
              child: Text(
                "Another option is to use Cached work Image to doin the best  Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best  Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best  Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best  Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best  Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best  Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best  Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best Another option is to use Cached work Image to doin the best ",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
