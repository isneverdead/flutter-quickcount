import './result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../style/my_icons.dart';

class DashboardPage extends StatefulWidget {
  static const routeName = '/dashboard';
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    var _deviceHeight = MediaQuery.of(context).size.height;
    var _2deviceHeight = MediaQuery.of(context).size.height * 0.2;
    var _4deviceHeight = MediaQuery.of(context).size.height * 0.4;
    var _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hitung Cepat',
          style: TextStyle(
              fontWeight: FontWeight.w800, fontSize: _4deviceHeight * 0.09),
        ),
        centerTitle: true,
        // backgroundColor: Colors.white,
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: ListView(
          // padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.08),
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              margin: EdgeInsets.only(
                left: _deviceWidth * 0.04,
                right: _deviceWidth * 0.04,
                top: _deviceWidth * 0.04,
                bottom: _deviceWidth * 0.04,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColor,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: _deviceWidth * 0.9,
              height: _4deviceHeight * 0.45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: _deviceWidth * 0.6,
                    height: _4deviceHeight * 0.2,
                    // color: Colors.green,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'John Doe',
                      style: TextStyle(
                          fontSize: _4deviceHeight * 0.1,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    width: _4deviceHeight * 0.25,
                    height: _4deviceHeight * 0.25,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(50)),
                  )
                ],
              ),
            ),
            Container(
              height: _4deviceHeight * 0.7,
              width: _deviceWidth,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: _deviceWidth * 0.9,
                    height: _4deviceHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 10),
                            Text(
                              'Perolehan Tertinggi',
                              style: TextStyle(fontSize: _4deviceHeight * 0.07),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: _deviceWidth,
                              height: 1,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              '2130',
                              style: TextStyle(
                                  fontSize: _4deviceHeight * 0.15,
                                  fontWeight: FontWeight.w800),
                            ),
                            // SizedBox(height: 5),
                            Text(
                              'Suara',
                              style: TextStyle(
                                fontSize: _4deviceHeight * 0.1,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff333333),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(bottom: _4deviceHeight * 0.05),
                          child: Text(
                            '01.Abdul Amin & Arif udin',
                            style: TextStyle(
                              fontSize: _4deviceHeight * 0.09,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff333333),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: _deviceWidth * 0.9,
                    height: _4deviceHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 10),
                            Text(
                              'Perolehan Tertinggi',
                              style: TextStyle(fontSize: _4deviceHeight * 0.07),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: _deviceWidth,
                              height: 1,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              '2130',
                              style: TextStyle(
                                  fontSize: _4deviceHeight * 0.15,
                                  fontWeight: FontWeight.w800),
                            ),
                            // SizedBox(height: 5),
                            Text(
                              'Suara',
                              style: TextStyle(
                                fontSize: _4deviceHeight * 0.1,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff333333),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(bottom: _4deviceHeight * 0.05),
                          child: Text(
                            '01.Abdul Amin & Arif udin',
                            style: TextStyle(
                              fontSize: _4deviceHeight * 0.09,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff333333),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: _deviceWidth * 0.9,
                    height: _4deviceHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 10),
                            Text(
                              'Perolehan Tertinggi',
                              style: TextStyle(fontSize: _4deviceHeight * 0.07),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: _deviceWidth,
                              height: 1,
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              '2130',
                              style: TextStyle(
                                  fontSize: _4deviceHeight * 0.15,
                                  fontWeight: FontWeight.w800),
                            ),
                            // SizedBox(height: 5),
                            Text(
                              'Suara',
                              style: TextStyle(
                                fontSize: _4deviceHeight * 0.1,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff333333),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(bottom: _4deviceHeight * 0.05),
                          child: Text(
                            '01.Abdul Amin & Arif udin',
                            style: TextStyle(
                              fontSize: _4deviceHeight * 0.09,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff333333),
                            ),
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
                left: _deviceWidth * 0.04,
                right: _deviceWidth * 0.04,
                top: _deviceWidth * 0.04,
                bottom: _deviceWidth * 0.04,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColor,
              ),
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: _deviceWidth * 0.9,
              height: _4deviceHeight * 0.35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: _deviceWidth * 0.3,
                    height: _4deviceHeight * 0.2,
                    // color: Colors.green,
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Input',
                      style: TextStyle(
                        fontSize: _4deviceHeight * 0.14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff333333),
                      ),
                    ),
                  ),
                  Container(
                    width: _4deviceHeight * 0.25,
                    height: _4deviceHeight * 0.25,
                    decoration: BoxDecoration(
                      // color: Colors.green,
                      // image: DecorationImage(
                      //   image: AssetImage(iconsInput),
                      // ),
                      color: Colors.green,
                      // borderRadius: BorderRadius.circular(50),
                    ),
                  )
                ],
              ),
            ),
            // SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(ResultPage.routeName);
              },
              child: Container(
                margin: EdgeInsets.only(
                  left: _deviceWidth * 0.04,
                  right: _deviceWidth * 0.04,
                  // top: _deviceWidth * 0.04,
                  bottom: _deviceWidth * 0.04,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColor,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: _deviceWidth * 0.9,
                height: _4deviceHeight * 0.35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: _deviceWidth * 0.3,
                      height: _4deviceHeight * 0.2,
                      // color: Colors.green,
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Hasil',
                        style: TextStyle(
                          fontSize: _4deviceHeight * 0.14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff333333),
                        ),
                      ),
                    ),
                    Container(
                      width: _4deviceHeight * 0.25,
                      height: _4deviceHeight * 0.25,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        // image: DecorationImage(
                        //   image: AssetImage(iconsInput),
                        // ),
                        // color: Colors.green,
                        // borderRadius: BorderRadius.circular(50),
                      ),
                    )
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
