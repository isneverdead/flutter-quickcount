import 'package:flutter/material.dart';

class SelectTPS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _deviceHeight = MediaQuery.of(context).size.height;
    var _2deviceHeight = MediaQuery.of(context).size.height * 0.2;
    var _4deviceHeight = MediaQuery.of(context).size.height * 0.4;
    var _5deviceHeight = MediaQuery.of(context).size.height * 0.5;
    var _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pilih TPS',
          style: TextStyle(
              fontWeight: FontWeight.w800, fontSize: _2deviceHeight * 0.15),
        ),
        centerTitle: true,
        // backgroundColor: Colors.white,
      ),
      body: Container(
        height: _deviceHeight,
        width: _deviceWidth,
        color: Theme.of(context).backgroundColor,
        child: ListView(
          // padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.08),
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              width: _deviceWidth * 0.1,
              margin: EdgeInsets.only(
                  left: _deviceWidth * 0.05,
                  right: _deviceWidth * 0.05,
                  top: _2deviceHeight * 0.1),
              height: _4deviceHeight * 0.15,
              child: RaisedButton(
                onPressed: () async {
                  // await upload
                  //     .imageUpload()
                  //     .whenComplete(() => print('upload image success'));
                },
                // color: Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: _4deviceHeight * 0.06,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              height: _5deviceHeight * 0.99,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) => Container(
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
                        width: _deviceWidth * 0.25,
                        height: _4deviceHeight * 0.3,
                        // color: Colors.green,
                        alignment: Alignment.centerLeft,
                        child: SingleChildScrollView(
                          child: Text(
                            'TPS 01 - Gajah Mungkur',
                            style: TextStyle(
                                color: Color(0xff4F4F4F),
                                fontSize: _2deviceHeight * 0.15,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            width: _deviceWidth * 0.15,
                            height: _2deviceHeight * 0.55,
                            decoration: BoxDecoration(
                              color: Color(0xff4F4F4F),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Container(
                                    alignment: Alignment.topCenter,
                                    width: _deviceWidth * 0.17,
                                    height: _2deviceHeight * 0.3,
                                    child: Text(
                                      '10%',
                                      style: TextStyle(
                                        fontSize: _2deviceHeight * 0.2,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    width: _deviceWidth * 0.15,
                                    height: _2deviceHeight * 0.15,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                        ),
                                        color: Theme.of(context).accentColor),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '02',
                                          style: TextStyle(
                                            fontSize: _2deviceHeight * 0.09,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.only(
                                              left: _2deviceHeight * 0.02),
                                          width: _2deviceHeight * 0.23,
                                          height: _2deviceHeight * 0.14,
                                          child: Text(
                                            'Abdul Aziz Abdul Amin',
                                            style: TextStyle(
                                              fontSize: _2deviceHeight * 0.05,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            width: _deviceWidth * 0.15,
                            height: _2deviceHeight * 0.55,
                            decoration: BoxDecoration(
                              color: Color(0xff4F4F4F),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Container(
                                    alignment: Alignment.topCenter,
                                    width: _deviceWidth * 0.17,
                                    height: _2deviceHeight * 0.3,
                                    child: Text(
                                      '20%',
                                      style: TextStyle(
                                        fontSize: _2deviceHeight * 0.2,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    width: _deviceWidth * 0.15,
                                    height: _2deviceHeight * 0.15,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                        ),
                                        color: Theme.of(context).accentColor),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '02',
                                          style: TextStyle(
                                            fontSize: _2deviceHeight * 0.09,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.only(
                                              left: _2deviceHeight * 0.02),
                                          width: _2deviceHeight * 0.23,
                                          height: _2deviceHeight * 0.14,
                                          child: Text(
                                            'Abdul Aziz Abdul Amin',
                                            style: TextStyle(
                                              fontSize: _2deviceHeight * 0.05,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
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
