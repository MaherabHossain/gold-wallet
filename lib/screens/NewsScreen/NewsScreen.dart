// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, non_constant_identifier_names, sized_box_for_whitespace, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/NewsController.dart';
import 'package:myapp/presentations/TextInfo.dart';
import 'package:myapp/screens/NewsScreen/widgets/Card.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final newsController = Get.put(NewsController());
  getNews() async {
    await newsController.getNews();
  }

  @override
  void initState() {
    getNews();
    super.initState();
  }

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
              Text(
                "News",
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
      body: Obx(
        () => Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 8),
          child: !newsController.isLoading.value
              ? ListView(
                  children: [
                    for (int i = 0; i < newsController.newsList.length; ++i)
                      NewsCard(newsController.newsList[i]),
                  ],
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
