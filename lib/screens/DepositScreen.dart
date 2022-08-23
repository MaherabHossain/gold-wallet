// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, non_constant_identifier_names, sized_box_for_whitespace, unused_local_variable

import 'package:flutter/material.dart';
import 'package:myapp/presentations/TextInfo.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen({Key? key}) : super(key: key);

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  bool bkash = false;
  bool nagad = false;
  bool roket = false;
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
                "Deposit",
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
              cursorColor: Colors.green,
              decoration: InputDecoration(
                labelText: 'Enter Amount',
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
              "Payment Method",
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
                      bkash = true;
                      nagad = false;
                      roket = false;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: !bkash
                          ? Colors.green
                          : Color.fromARGB(255, 20, 100, 23),
                      boxShadow: [
                        BoxShadow(
                            color: !bkash
                                ? Colors.green
                                : Color.fromARGB(255, 20, 100, 23),
                            spreadRadius: 3),
                      ],
                    ),
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Center(
                      child: Text("Bkash"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      bkash = false;
                      nagad = true;
                      roket = false;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: !nagad
                          ? Colors.green
                          : Color.fromARGB(255, 20, 100, 23),
                      boxShadow: [
                        BoxShadow(
                            color: !nagad
                                ? Colors.green
                                : Color.fromARGB(255, 20, 100, 23),
                            spreadRadius: 3),
                      ],
                    ),
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Center(
                      child: Text("Nagad"),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      bkash = false;
                      nagad = false;
                      roket = true;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: !roket
                          ? Colors.green
                          : Color.fromARGB(255, 20, 100, 23),
                      boxShadow: [
                        BoxShadow(
                            color: !roket
                                ? Colors.green
                                : Color.fromARGB(255, 20, 100, 23),
                            spreadRadius: 3),
                      ],
                    ),
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: Center(
                      child: Text("Nagad"),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            if (bkash || nagad || roket)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bkash
                        ? "Pay to 01777777777"
                        : roket
                            ? "Pay to 01888888888"
                            : nagad
                                ? "Pay to 01999999999"
                                : '',
                    style: TextStyle(
                      color: basicTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      labelText: 'Enter phone number',
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
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      labelText: 'Enter trxID',
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
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {},
                        // ignore: sort_child_properties_last
                        child: Text(
                          "Pay",
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                        )),
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}
