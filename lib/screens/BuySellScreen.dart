// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, non_constant_identifier_names, sized_box_for_whitespace, unused_local_variable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/GoldController.dart';
import 'package:myapp/controller/TransactionController.dart';
import 'package:myapp/presentations/TextInfo.dart';
import 'package:myapp/utilities/showToastMessage.dart';

class BuySellScreen extends StatefulWidget {
  const BuySellScreen({Key? key}) : super(key: key);

  @override
  State<BuySellScreen> createState() => _BuySellScreenState();
}

class _BuySellScreenState extends State<BuySellScreen> {
  final goldController = Get.put(GoldController());
  bool buy = false;
  bool sell = false;
  var amount;
  var isLoading = false;
  var trx_id;
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
                "Buy/Sell",
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
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              onChanged: (value) {
                amount = value;
              },
              cursorColor: Colors.green,
              decoration: InputDecoration(
                labelText: 'Enter Amount of gold',
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 13, 192, 61)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 13, 192, 61)),
                ),
                labelStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Action",
              style: TextStyle(
                color: basicTextColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      buy = true;
                      sell = false;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: !buy
                          ? Colors.green
                          : Color.fromARGB(255, 20, 100, 23),
                      boxShadow: [
                        BoxShadow(
                            color: !buy
                                ? Colors.green
                                : Color.fromARGB(255, 20, 100, 23),
                            spreadRadius: 3),
                      ],
                    ),
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Center(
                      child: Text("Buy"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      buy = false;
                      sell = true;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: !sell
                          ? Colors.green
                          : Color.fromARGB(255, 20, 100, 23),
                      boxShadow: [
                        BoxShadow(
                            color: !sell
                                ? Colors.green
                                : Color.fromARGB(255, 20, 100, 23),
                            spreadRadius: 3),
                      ],
                    ),
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Center(
                      child: Text("Sell"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () async {
                        var action = buy ? 3 : 4;

                        var data = {"action": action, "quantity": amount};
                        // print("LOG:: printing form data");
                        print(data);
                        setState(() {
                          isLoading = true;
                        });
                        if (amount != null) {
                          await GoldController().buySellGold(data);
                        } else {
                          showToastMessage("All field are required");
                        }
                        setState(() {
                          isLoading = false;
                        });
                      },
                      // ignore: sort_child_properties_last
                      child: isLoading
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text("Submit"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
