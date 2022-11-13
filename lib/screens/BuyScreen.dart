// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, non_constant_identifier_names, sized_box_for_whitespace, unnecessary_new, avoid_print, prefer_interpolation_to_compose_strings

import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/MarketPlaceController.dart';
import 'package:myapp/presentations/TextInfo.dart';

class BuyScreen extends StatefulWidget {
  const BuyScreen({Key? key}) : super(key: key);

  @override
  State<BuyScreen> createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
  final marketPlaceController = Get.put(MarketPlaceController());
  getBuyList() {
    marketPlaceController.getBuyList();
  }

  @override
  void initState() {
    getBuyList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 20),
          child: RefreshIndicator(
            onRefresh: () async {},
            color: Colors.green,
            child: Obx(
              () => !marketPlaceController.isLoading.value
                  ? Column(
                      children: [
                        if (marketPlaceController.buyList != null)
                          Column(
                            children: [
                              for (int i = 0;
                                  i < marketPlaceController.buyList.length;
                                  ++i)
                                Card(marketPlaceController.buyList[i],
                                    marketPlaceController),
                            ],
                          )
                        else
                          Center(
                            child: Text("Not Available!"),
                          )
                      ],
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget Card(buyDetails, marketPlaceController) {
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    height: 59,
    padding: EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: basicTextColor,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 6),
        Text(
          "GOLD",
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          buyDetails['amount'] + " G",
          style: TextStyle(
            fontSize: 20,
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 6),
        Text(
          "PRICE",
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          (int.parse(buyDetails['unit_price']) *
                      int.parse(buyDetails['amount']))
                  .toString() +
              " TK",
          style: TextStyle(
            fontSize: 20,
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 8),
        InkWell(
          onTap: () {
            marketPlaceController.buyGold(buyDetails['id']);
          },
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
              ),
              height: 40,
              width: 50,
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Center(child: Text("Buy")),
            ),
          ),
        )
      ],
    ),
  );
}
