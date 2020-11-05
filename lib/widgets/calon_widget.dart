import 'package:flutter/material.dart';

class CalonWidget extends StatelessWidget {
  final int suara;
  final int totalSuara;
  final String namaCalon;
  final String nomorCalon;
  CalonWidget({
    @required this.suara,
    @required this.totalSuara,
    @required this.namaCalon,
    @required this.nomorCalon,
  });
  @override
  Widget build(BuildContext context) {
    var _deviceHeight = MediaQuery.of(context).size.height;
    var _2deviceHeight = MediaQuery.of(context).size.height * 0.2;
    var _4deviceHeight = MediaQuery.of(context).size.height * 0.4;
    var _5deviceHeight = MediaQuery.of(context).size.height * 0.5;
    var _deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: 10),
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
                '${(suara / totalSuara * 100).toStringAsFixed(0)}%',
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '0$nomorCalon',
                    style: TextStyle(
                      fontSize: _2deviceHeight * 0.09,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: _2deviceHeight * 0.02),
                    width: _2deviceHeight * 0.23,
                    height: _2deviceHeight * 0.14,
                    child: Text(
                      '$namaCalon',
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
    );
  }
}
