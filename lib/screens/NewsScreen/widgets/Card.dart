// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, non_constant_identifier_names, sized_box_for_whitespace, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:myapp/presentations/TextInfo.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:myapp/screens/NewsScreen/NewsDetails.dart';
import 'package:myapp/utilities/api.dart';

class NewsCard extends StatefulWidget {
  var newsDeatils;
  NewsCard(this.newsDeatils);

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(NewsDetails(widget.newsDeatils));
      },
      child: Container(
        // ignore: sort_child_properties_last
        margin: const EdgeInsets.only(bottom: 10.0),
        // ignore: sort_child_properties_last
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  imageUrl: appUrl + "/" + widget.newsDeatils['image_url'],
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Container(
                  width: 272,
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: Text(
                    widget.newsDeatils['title'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_right,
                      size: 30,
                    ))
              ],
            ),
            SizedBox(height: 5),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 67, 72, 105),
        ),
      ),
    );
  }
}
