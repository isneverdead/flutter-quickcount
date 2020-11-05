import '../providers/data_tps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pie_chart/pie_chart.dart';
import '../style/my_icons.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatefulWidget {
  static const routeName = '/result';
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  

  Stream<int> timedCounter(Duration interval, [int maxCount]) async* {
    int i = 0;
    while (true) {
      await Future.delayed(interval);
      yield i++;
      if (i == maxCount) break;
    }
  }


  Map<String, double> dataMap = {
    "Nurhadi - Aldo": 7.5,
    "Wisnu - Aldi": 2.5,
  };
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    var _deviceHeight = MediaQuery.of(context).size.height;
    var _2deviceHeight = MediaQuery.of(context).size.height * 0.2;
    var _4deviceHeight = MediaQuery.of(context).size.height * 0.4;
    var _deviceWidth = MediaQuery.of(context).size.width;
        final dataTps = Provider.of<DataTPS>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hasil Per-TPS',
          style: TextStyle(
              fontWeight: FontWeight.w800, fontSize: _4deviceHeight * 0.09),
        ),
        centerTitle: true,
        // backgroundColor: Colors.white,
      ),
      body: dataTps.resultPerTps.length == 0 ? 
      Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      )
      :Container(
        color: Theme.of(context).backgroundColor,
        child: ListView(
          // padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.08),
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              width: _deviceWidth * 0.1,
              margin: EdgeInsets.symmetric(
                horizontal: _deviceWidth * 0.05,
                vertical: _4deviceHeight * 0.1,
              ),
              // decoration: BoxDecoration(color: ),
              alignment: Alignment.center,
              height: _4deviceHeight * 0.15,
              child: Text(
                '${dataTps.resultPerTps.keys.toList()[0]}',
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Color(0xff4F4F4F),
                    fontSize: _4deviceHeight * 0.07),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // color: Colors.white,
                // boxShadow: [
                //   BoxShadow(
                //     color: Color.fromARGB(64, 0, 0, 0),
                //     // color: Color.fromARGB(255, 0, 255, 109),
                //     offset: Offset(0, 1),
                //     blurRadius: 5,
                //     spreadRadius: 2.0,
                //   ),
                // ],
              ),
              margin: EdgeInsets.only(
                left: _deviceWidth * 0.04,
                right: _deviceWidth * 0.04,
                // top: _deviceWidth * 0.04,
                // bottom: _deviceWidth * 0.02,
              ),
              padding: EdgeInsets.symmetric(horizontal: 15),
              width: _deviceWidth * 0.9,
              height: _deviceHeight * 0.5,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  PieChart(
                    dataMap: dataMap,
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
                          dataMap: dataMap,
                          animationDuration: Duration(milliseconds: 800),
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

            Container(
              margin: EdgeInsets.only(
                left: _deviceWidth * 0.07,
                right: _deviceWidth * 0.07,
                // top: _4deviceHeight * 0.01,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: _deviceWidth * 0.15,
                        height: _4deviceHeight * 0.15,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          border: Border.all(
                            width: 1,
                            color: Colors.white,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'No',
                          style: TextStyle(
                            fontSize: _2deviceHeight * 0.1,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Container(
                        width: _deviceWidth * 0.47,
                        height: _4deviceHeight * 0.15,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          border: Border.all(
                            width: 1,
                            color: Colors.white,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Calon',
                          style: TextStyle(
                            fontSize: _2deviceHeight * 0.1,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Container(
                        width: _deviceWidth * 0.23,
                        height: _4deviceHeight * 0.15,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          border: Border.all(
                            width: 1,
                            color: Colors.white,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Total Suara',
                          style: TextStyle(
                            fontSize: _2deviceHeight * 0.1,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: _deviceWidth * 0.15,
                        height: 1,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          border: Border(
                            top: BorderSide(width: 1, color: Colors.white),
                            left:  BorderSide(width: 1, color: Colors.white),
                            right: BorderSide(width: 1, color: Colors.white),

                          ),
                        ),
                        
                      ),
                      Container(
                        width: _deviceWidth * 0.47,
                        height: 1,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          border: Border(
                           left:  BorderSide(width: 1, color: Colors.white),
                              top: BorderSide(width: 1, color: Colors.white),
                          ),
                        ),
                        
                      ),
                      Container(
                        width: _deviceWidth * 0.23,
                        height: 1,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          border: Border.all(
                            width: 1,
                            color: Colors.white,
                          ),
                        ),
                        
                      ),
                    ],
                  ),
                  Expanded(child: ListView.builder(itemBuilder: (context, index)=> Container( width: _deviceWidth, height: 20, child: Row(children: [Container(width: 10, height: 10,)],)))),
                  // Expanded(
                  //   child: ListView.builder(
                  //     itemCount: dataTps.resultPerPage.values.length,
                  //     itemBuilder: (context, index) =>
                  //        Container(
                  //          width: _deviceWidth * 0.89,
                  //          child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //           Container(
                  //             width: _deviceWidth * 0.15,
                  //             height: _4deviceHeight * 0.1,
                  //             decoration: BoxDecoration(
                  //               color: Theme.of(context).primaryColor,
                  //               border: Border(
                  //                 // top: BorderSide(width: 1, color: Colors.white),
                  //                 left:  BorderSide(width: 1, color: Colors.white),
                  //                 right: BorderSide(width: 1, color: Colors.white),

                  //               ),
                  //             ),
                  //             child: Column(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                 Text('1.'),
                  //               ],
                  //             ),
                  //           ),
                  //           Container(
                  //             width: _deviceWidth * 0.47,
                  //             height: _4deviceHeight * 0.1,
                  //             decoration: BoxDecoration(
                  //               color: Theme.of(context).primaryColor,
                  //               border: Border(
                  //                left:  BorderSide(width: 1, color: Colors.white),
                  //                right: BorderSide(width: 1, color: Colors.white),
                  //               ),
                  //             ),
                  //             child: Column(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                 Text('Nurhadi - Aldo.'),
                  //               ],
                  //             ),
                  //           ),
                  //           Container(
                  //             width: _deviceWidth * 0.23,
                  //             height: _4deviceHeight * 0.1,
                  //             decoration: BoxDecoration(
                  //               color: Theme.of(context).primaryColor,
                  //               border: Border(
                  //                left:  BorderSide(width: 1, color: Colors.white),
                  //                right: BorderSide(width: 1, color: Colors.white),
                  //               ),
                  //             ),
                  //             child: Column(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                 Text('2000'),
                  //               ],
                  //             ),
                  //           ),
                  //       ],
                  //     ),
                  //        ),
                  //   ),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: _deviceWidth * 0.15,
                        height: _4deviceHeight * 0.1,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          border: Border(
                            // top: BorderSide(width: 1, color: Colors.white),
                            left:  BorderSide(width: 1, color: Colors.white),
                            right: BorderSide(width: 1, color: Colors.white),

                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('2.'),
                          ],
                        ),
                      ),
                      Container(
                        width: _deviceWidth * 0.47,
                        height: _4deviceHeight * 0.1,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          border: Border(
                            left:  BorderSide(width: 1, color: Colors.white),
                            right: BorderSide(width: 1, color: Colors.white),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Wisnu Aldi.'),
                          ],
                        ),
                      ),
                      Container(
                        width: _deviceWidth * 0.23,
                        height: _4deviceHeight * 0.1,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          border: Border(
                            left:  BorderSide(width: 1, color: Colors.white),
                            right: BorderSide(width: 1, color: Colors.white),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('500'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: _deviceWidth * 0.62,
                        height: _4deviceHeight * 0.1,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          border: Border(
                           left:  BorderSide(width: 1, color: Colors.white),
                           right: BorderSide(width: 1, color: Colors.white),
                           top: BorderSide(width: 2, color: Colors.white),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Total Suara',
                          style: TextStyle(
                            fontSize: _2deviceHeight * 0.1,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Container(
                        width: _deviceWidth * 0.23,
                        height: _4deviceHeight * 0.1,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          border: Border(
                           left:  BorderSide(width: 1, color: Colors.white),
                           right: BorderSide(width: 1, color: Colors.white),
                           top: BorderSide(width: 2, color: Colors.white),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '2500',
                          style: TextStyle(
                            fontSize: _2deviceHeight * 0.1,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            // Container(
            //   margin: EdgeInsets.only(
            //     left: _deviceWidth * 0.07,
            //     right: _deviceWidth * 0.07,
            //     // top: _4deviceHeight * 0.01,
            //   ),
            //   child: StreamBuilder<int>(
            //     stream: timedCounter(Duration(seconds: 1), 1000),
            //     //print an integer every 2secs, 10 times
            //     builder: (context, snapshot) {
            //       if (!snapshot.hasData) {
            //         return Text("Loading");
            //       }
            //       int count = snapshot.data;
            //       return DataTable(
            //         rows: [
            //           DataRow(
            //             // color: ,
            //             cells: [
            //               DataCell(Container(
            //                 width: 50,
            //                 height: 50,
            //                 color: Colors.green,
            //               )),
            //               DataCell(Text("${count + 2}")),
            //               DataCell(Text("${count + 3}")),
            //             ],
            //           ),
            //           DataRow(
            //             cells: [
            //               DataCell(Text("${count + 4}")),
            //               DataCell(Text("${count + 5}")),
            //               DataCell(Text("${count + 5}")),
            //             ],
            //           ),
            //           DataRow(
            //             cells: [
            //               DataCell(Text("${count + 6}")),
            //               DataCell(Text("${count + 7}")),
            //               DataCell(Text("${count + 8}")),
            //             ],
            //           ),
            //         ],
            //         columns: [
            //           DataColumn(
            //             label: Text("From 1"),
            //           ),
            //           DataColumn(
            //             label: Text("From 4"),
            //           ),
            //           DataColumn(
            //             label: Text("From 6"),
            //           ),
            //         ],
            //       );
            //     },
            //   ),
            // ),
            // Image.asset(iconsHasil)
          ],
        ),
      ),
    );
  }
}
