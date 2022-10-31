// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  var userInfo = [];
  getHomePageData() async {
    final prefs = await SharedPreferences.getInstance();
    userInfo = prefs.getStringList('userInfo')!;
    print("LOG:: printing userinfo form home screen!");
    print(userInfo[0]);
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
                          "deposit"),
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
                  Container(
                    //Initialize chart
                    child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        series: <ChartSeries>[
                          // Initialize line series
                          LineSeries<ChartData, String>(
                              enableTooltip: true,
                              dataSource: [
                                // Bind data source
                                ChartData('1', 6000),
                                ChartData('2', 6100),
                                ChartData('3', 6050),
                                ChartData('4', 6010),
                                ChartData('5', 6200),
                                ChartData('6', 6100),
                                ChartData('7', 6500),
                                ChartData('8', 6400),
                                ChartData('9', 6020),
                                ChartData('10', 6100),
                                ChartData('11', 6050),
                                ChartData('12', 6050),
                                ChartData('13', 6700),
                                ChartData('14', 6720),
                                ChartData('15', 6050),
                                ChartData('16', 6150),
                                ChartData('17', 6850),
                                ChartData('18', 6950),
                                ChartData('19', 7050),
                                ChartData('20', 6950),
                                ChartData('21', 7050),
                                ChartData('22', 7100),
                                ChartData('23', 7050),
                                ChartData('24', 6720),
                                ChartData('25', 7720),
                                ChartData('26', 7300),
                                ChartData('27', 7200),
                                ChartData('28', 7320),
                                ChartData('29', 7312),
                                ChartData('30', 6700)
                              ],
                              xAxisName: "Date",
                              yAxisName: "TK",
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y)
                        ]),
                  ),
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
