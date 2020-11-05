import './all_tps_page.dart';
import './dashboard_page.dart';
import './input_page.dart';
import './login_page.dart';
import './result_page.dart';
import '../providers/auth.dart';
import '../style/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _logoutLoading = false;

  @override
  Widget build(BuildContext context) {
    var _deviceHeight = MediaQuery.of(context).size.height;
    var _5deviceHeight = MediaQuery.of(context).size.height * 0.5;
    var _2deviceHeight = MediaQuery.of(context).size.height * 0.2;
    var _4deviceHeight = MediaQuery.of(context).size.height * 0.4;
    var _deviceWidth = MediaQuery.of(context).size.width;
    final auth = Provider.of<Auth>(context);

    return Scaffold(
      body: Container(
        // height: _deviceHeight,
        width: _deviceWidth,
        color: Color(0xffFFC200),
        // color: Theme.of(context).backgroundColor,
        child: ListView(
          // padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.08),
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              height: _4deviceHeight * 0.75,
              width: _deviceWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: _2deviceHeight * 0.15),
                    height: _2deviceHeight,
                    width: _deviceWidth * 0.35,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Quick',
                            style: TextStyle(
                                // color: Color(0xff4F4F4F),
                                fontSize: _2deviceHeight * 0.3,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Count',
                            style: TextStyle(
                                // color: Color(0xff4F4F4F),
                                fontSize: _2deviceHeight * 0.3,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                        Container(
                          width: _deviceWidth * 0.5,
                          height: 2,
                          color: Theme.of(context).backgroundColor,
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: _4deviceHeight * 0.6,
                    height: _4deviceHeight * 0.8,
                    // alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      // color: Colors.green,
                      image: DecorationImage(
                        image: AssetImage(iconsVoting),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: _5deviceHeight * 1.4,
              width: _deviceWidth,
              decoration: BoxDecoration(
                // color: Color(0xffFFC200),
                color: Theme.of(context).backgroundColor,
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(DashboardPage.routeName);
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        left: _deviceWidth * 0.04,
                        right: _deviceWidth * 0.04,
                        top: _deviceWidth * 0.1,
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
                      height: _4deviceHeight * 0.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: _deviceWidth * 0.4,
                            height: _4deviceHeight * 0.35,
                            // color: Colors.green,
                            margin:
                                EdgeInsets.only(left: _2deviceHeight * 0.15),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Dashboard',
                              style: TextStyle(
                                  color: Color(0xff4F4F4F),
                                  fontSize: _2deviceHeight * 0.16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            width: _deviceWidth * 0.3,
                            height: _4deviceHeight * 0.3,
                            // color: Colors.green,
                            // margin: EdgeInsets.symmetric(vertical: 1),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              // color: Colors.green,
                              image: DecorationImage(
                                image: AssetImage(iconsDshboard),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(AllTPS.routeName);
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
                      height: _4deviceHeight * 0.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: _deviceWidth * 0.4,
                            height: _4deviceHeight * 0.35,
                            // color: Colors.green,
                            margin:
                                EdgeInsets.only(left: _2deviceHeight * 0.15),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Hasil Pemilu',
                              style: TextStyle(
                                  color: Color(0xff4F4F4F),
                                  fontSize: _2deviceHeight * 0.16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            width: _deviceWidth * 0.35,
                            height: _4deviceHeight * 0.35,
                            // color: Colors.green,
                            // margin: EdgeInsets.only(left: _2deviceHeight * 0.15),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              // color: Colors.green,
                              image: DecorationImage(
                                image: AssetImage(iconsPieChart),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(InputPage.routeName);
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
                      height: _4deviceHeight * 0.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: _deviceWidth * 0.4,
                            height: _4deviceHeight * 0.35,
                            // color: Colors.green,
                            margin:
                                EdgeInsets.only(left: _2deviceHeight * 0.15),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Input',
                              style: TextStyle(
                                  color: Color(0xff4F4F4F),
                                  fontSize: _2deviceHeight * 0.16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            width: _deviceWidth * 0.35,
                            height: _4deviceHeight * 0.35,
                            // color: Colors.green,
                            // margin: EdgeInsets.only(left: _2deviceHeight * 0.15),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              // color: Colors.green,
                              image: DecorationImage(
                                image: AssetImage(iconsInput),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Tooltip(
                    message: 'Klik untuk Keluar',
                    child: Container(
                      margin: EdgeInsets.only(top: _2deviceHeight * 0.1),
                      width: _deviceWidth * 0.91,
                      height: _4deviceHeight * 0.15,
                      child: RaisedButton(
                        color: Color(0xffEB5757),
                        onPressed: () async {
                          setState(() {
                            _logoutLoading = true;
                          });
                          auth.logout(context);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: _logoutLoading
                            ? Container(
                                child: CircularProgressIndicator(),
                              )
                            : Text(
                                'Logout',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: _4deviceHeight * 0.08,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Image.asset(iconsHasil)
          ],
        ),
      ),
    );
  }
}
