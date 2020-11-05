import './result_page.dart';
import '../providers/data_tps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../style/my_icons.dart';
import 'package:pie_chart/pie_chart.dart';

class DashboardPage extends StatefulWidget {
  static const routeName = '/dashboard';
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final dataTps = Provider.of<DataTPS>(context, listen: false);
    dataTps.fetchDashboard().whenComplete(() {
      setState(() {
        _isLoading = false;
      });
    });
  }

  // Map<String, double> dataMap = {'nama': 10};
  @override
  Widget build(BuildContext context) {
    var _deviceHeight = MediaQuery.of(context).size.height;
    var _5deviceHeight = MediaQuery.of(context).size.height * 0.5;
    var _2deviceHeight = MediaQuery.of(context).size.height * 0.2;
    var _4deviceHeight = MediaQuery.of(context).size.height * 0.4;
    var _deviceWidth = MediaQuery.of(context).size.width;
    final dataTps = Provider.of<DataTPS>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(
              fontWeight: FontWeight.w800, fontSize: _4deviceHeight * 0.09),
        ),
        centerTitle: true,
        // backgroundColor: Colors.white,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              height: _deviceHeight,
              width: _deviceWidth,
              color: Theme.of(context).backgroundColor,
              child: ListView(
                // padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.08),
                physics: BouncingScrollPhysics(),
                children: [
                  Container(
                    height: _5deviceHeight * 0.99,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: dataTps.calonDashboard.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          dataTps.fetchDashboard();
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            left: _deviceWidth * 0.04,
                            right: _deviceWidth * 0.04,
                            top: _deviceWidth * 0.04,
                            // bottom: _deviceWidth * 0.02,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(64, 0, 0, 0),
                                // color: Color.fromARGB(255, 0, 255, 109),
                                offset: Offset(0, 1),
                                blurRadius: 5,
                                spreadRadius: 2.0,
                              ),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          width: _deviceWidth * 0.9,
                          height: _4deviceHeight * 0.35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: _deviceWidth * 0.23,
                                height: _4deviceHeight * 0.35,
                                // color: Colors.green,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '0${dataTps.calonDashboard.values.toList()[index].nomor}',
                                  style: TextStyle(
                                      color: Color(0xff4F4F4F),
                                      fontFamily: 'RobotoCondensed',
                                      fontSize: _deviceHeight / _deviceWidth * 40,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Container(
                                width: _deviceWidth * 0.25,
                                height: _4deviceHeight * 0.35,
                                padding: EdgeInsets.symmetric(
                                    vertical: _4deviceHeight * 0.06),
                                decoration: BoxDecoration(
                                    // color: Colors.green,
                                    // borderRadius: BorderRadius.circular(50),
                                    ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            child: Text(
                                          '${dataTps.calonDashboard.values.toList()[index].name}',
                                          style: TextStyle(
                                              color: Color(0xff4F4F4F),
                                              fontSize: _deviceHeight / _deviceWidth * 10,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ),
                                    ),
                                    // Container(
                                    //   // margin: EdgeInsets.symmetric(vertical: 2),
                                    //   height: 1,
                                    //   color: Color(0xffBDBDBD),
                                    // ),
                                    // Container(
                                    //   padding: EdgeInsets.symmetric(horizontal: 10),
                                    //   child: Text(
                                    //     'Wisnu Aldo',
                                    //     style: TextStyle(
                                    //         color: Color(0xff4F4F4F),
                                    //         fontSize: _4deviceHeight * 0.055,
                                    //         fontWeight: FontWeight.w800),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              Container(
                                // margin: EdgeInsets.symmetric(vertical: 2),
                                width: 1,
                                // height: _4deviceHeight * 0.33,
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                color: Color(0xffBDBDBD),
                              ),
                              Container(
                                width: _deviceWidth * 0.25,
                                height: _4deviceHeight * 0.35,
                                padding: EdgeInsets.symmetric(
                                    vertical: _4deviceHeight * 0.05),
                                decoration: BoxDecoration(
                                    // color: Colors.green,
                                    // borderRadius: BorderRadius.circular(50),
                                    ),
                                child: Column(
                                  children: [
                                    Container(
                                      // padding: EdgeInsets.symmetric(horizontal: 10),
                                      // color: Colors.green,
                                      child: Text(
                                        '${(dataTps.calonDashboard.values.toList()[index].suara / dataTps.calonDashboardTotal * 100).toStringAsFixed(1)}%',
                                        style: TextStyle(
                                            color: Color(0xff4F4F4F),
                                            fontSize: _deviceHeight / _deviceWidth * 12,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    Container(
                                      // margin: EdgeInsets.symmetric(vertical: 2),
                                      height: 1,
                                      color: Color(0xffBDBDBD),
                                    ),
                                    Container(
                                      // padding:
                                      //     EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        '${dataTps.calonDashboard.values.toList()[index].suara}',
                                        style: TextStyle(
                                            color: Color(0xff4F4F4F),
                                            fontSize: _deviceHeight / _deviceWidth * 12,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        'Suara',
                                        style: TextStyle(
                                            color: Color(0xff4F4F4F),
                                            fontSize: _deviceHeight / _deviceWidth * 10,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      dataTps.fetchDashboard();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(64, 0, 0, 0),
                            // color: Color.fromARGB(255, 0, 255, 109),
                            offset: Offset(0, 1),
                            blurRadius: 5,
                            spreadRadius: 2.0,
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(
                        left: _deviceWidth * 0.04,
                        right: _deviceWidth * 0.04,
                        // top: _deviceWidth * 0.04,
                        // bottom: _deviceWidth * 0.02,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      width: _deviceWidth * 0.9,
                      height: _deviceHeight * 0.7,
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          PieChart(
                            dataMap: dataTps.dataMap,
                            animationDuration: Duration(milliseconds: 800),
                            chartLegendSpacing: 32,
                            chartRadius: _deviceWidth * 0.7,
                            // colorList: colorList,
                            initialAngleInDegree: 0,
                            chartType: ChartType.disc,
                            // ringStrokeWidth: 32,
                            // centerText: "HYBRID",
                            legendOptions: LegendOptions(
                              showLegendsInRow: false,
                              legendPosition: LegendPosition.bottom,
                              showLegends: false,
                              legendShape: BoxShape.circle,
                              legendTextStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            chartValuesOptions: ChartValuesOptions(
                              showChartValueBackground: true,
                              showChartValues: true,
                              showChartValuesInPercentage: true,
                              showChartValuesOutside: false,
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            // color: Colors.green,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                PieChart(
                                  dataMap: dataTps.dataMap,
                                  animationDuration:
                                      Duration(milliseconds: 800),
                                  chartLegendSpacing: 0,
                                  chartRadius: 0,
                                  // colorList: colorList,
                                  initialAngleInDegree: 0,
                                  chartType: ChartType.disc,
                                  // ringStrokeWidth: 32,
                                  // centerText: "HYBRID",
                                  legendOptions: LegendOptions(
                                    showLegendsInRow: false,
                                    legendPosition: LegendPosition.bottom,
                                    showLegends: true,
                                    legendShape: BoxShape.circle,
                                    legendTextStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  chartValuesOptions: ChartValuesOptions(
                                    showChartValueBackground: true,
                                    showChartValues: false,
                                    showChartValuesInPercentage: true,
                                    showChartValuesOutside: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Image.asset(iconsHasil)
                ],
              ),
            ),
    );
  }
}
