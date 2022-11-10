// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, non_constant_identifier_names, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/MarketPlaceController.dart';
import 'package:myapp/presentations/TextInfo.dart';
import 'package:myapp/utilities/showToastMessage.dart';

class SellScreen extends StatefulWidget {
  const SellScreen({Key? key}) : super(key: key);

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  final marketPlaceController = Get.put(MarketPlaceController());
  var amount;
  var unit_price;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 20),
          child: RefreshIndicator(
            onRefresh: () async {},
            color: Colors.green,
            child: ListView(
              children: [
                Card(),
                Card(),
                Card(),
                Card(),
                Card(),
                Card(),
                Card(),
                Card(),
                Card(),
                Card(),
                Card(),
                Card(),
                Card(),
                Card(),
                Card(),
                Card(),
                Card(),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            showDialog(
              context: context,
              builder: (
                BuildContext context,
              ) {
                return StatefulBuilder(builder: (BuildContext context,
                    StateSetter setState /*You can rename this!*/) {
                  return AlertDialog(
                    backgroundColor: Color.fromARGB(255, 25, 44, 61),
                    content: Stack(
                      clipBehavior: Clip.none,
                      children: <Widget>[
                        Positioned(
                          right: -40.0,
                          top: -40.0,
                          child: InkResponse(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: CircleAvatar(
                              child: Icon(Icons.close),
                              backgroundColor: Colors.green,
                            ),
                          ),
                        ),
                        Container(
                          height: 250,
                          child: Column(
                            children: [
                              Text(
                                "Add Sale",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                onChanged: ((value) {
                                  amount = value;
                                }),
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  fillColor: Color.fromARGB(255, 216, 216, 216),
                                  filled: true,
                                  border: InputBorder.none,
                                  hintText: "Amount",
                                  hintStyle: TextStyle(
                                      fontSize: 18.0,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                  prefixIcon: Icon(
                                    Icons.diamond,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                onChanged: ((value) {
                                  unit_price = value;
                                }),
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  fillColor: Color.fromARGB(255, 216, 216, 216),
                                  filled: true,
                                  border: InputBorder.none,
                                  hintText: "Unit price",
                                  hintStyle: TextStyle(
                                      fontSize: 18.0,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                  prefixIcon: Icon(
                                    Icons.currency_exchange,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                              Obx(
                                () => ElevatedButton(
                                  onPressed: () {
                                    if (amount != null && unit_price != null) {
                                      Map info = {
                                        "amount": amount,
                                        "unit_price": unit_price
                                      };
                                      marketPlaceController.sellGold(
                                          info, context);
                                    } else {
                                      showToastMessage(
                                          "All field are required!");
                                    }
                                  },
                                  child: !marketPlaceController.isLoading.value
                                      ? Text("Add Sale")
                                      : SizedBox(
                                          height: 10,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          )),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                });
              },
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ));
  }
}

Widget Card() {
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    height: 59,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: basicTextColor,
    ),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.black,
          ),
        ),
        SizedBox(width: 10),
        Text(
          "29-7-2022",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 10),
        Text(
          "2.0 G",
          style: TextStyle(
            fontSize: 20,
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 10),
        Text(
          "Pending",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 10),
        InkWell(
          onTap: () {},
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
              ),
              height: 40,
              width: 70,
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Center(child: Text("Delete")),
            ),
          ),
        )
      ],
    ),
  );
}
