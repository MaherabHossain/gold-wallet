// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/GoldController.dart';
import 'package:myapp/presentations/TextInfo.dart';
import 'package:myapp/screens/DepositScreen.dart';
import 'package:myapp/widgets/Banner.dart';
import 'package:myapp/widgets/MenuIcon.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/ChartData.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final goldController = Get.put(GoldController());
  var userInfo = [];
  List<ChartData> dataSource = [];
  getHomePageData() async {
    final prefs = await SharedPreferences.getInstance();
    userInfo = prefs.getStringList('userInfo')!;
    print("LOG:: printing userinfo form home screen!");
    print(userInfo[0]);
    setState(() {});
    await goldController.getGoldPrice();
    for (int i = 0; i < goldController.goldPrice.length; ++i) {
      dataSource.add(
        ChartData(goldController.goldPrice[i]['date'],
            double.parse(goldController.goldPrice[i]['buy_price'])),
      );
    }
    setState(() {});
  }

  @override
  void initState() {
    getHomePageData();
    // TODO: implement initState
    super.initState();
  }

  String welcome = "WElcome";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome!",
                            style: TextStyle(
                              color: basicTextColor,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            userInfo.isNotEmpty ? userInfo[0] : "",
                            style: TextStyle(
                              color: basicTextColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BannerImage(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                          Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                          "Diposit",
                          "deposit"),
                      Card(
                          Icon(
                            Icons.arrow_circle_up_rounded,
                            color: Colors.black,
                          ),
                          "Reffer",
                          "deposit"),
                      Card(
                          Icon(
                            Icons.money_off,
                            color: Colors.black,
                          ),
                          "Withdraw",
                          "withdraw"),
                      Card(
                          Icon(
                            Icons.newspaper,
                            color: Colors.black,
                          ),
                          "Blogs",
                          "news"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Gold price graph",
                    style: TextStyle(
                      color: basicTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  !goldController.isLoading.value
                      ? Container(
                          //Initialize chart
                          child: SfCartesianChart(
                              primaryXAxis: CategoryAxis(),
                              series: <ChartSeries>[
                                // Initialize line series
                                LineSeries<ChartData, String>(
                                    enableTooltip: true,
                                    dataSource: dataSource,
                                    xAxisName: "Date",
                                    yAxisName: "TK",
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) => data.y)
                              ]),
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget Card(Icon icon, text, screen) {
  return InkWell(
    onTap: () {
      Get.toNamed(screen);
      print("Tapped");
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: basicTextColor,
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          icon,
          Text(
            text,
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    ),
  );
}
