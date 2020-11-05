import './input_page.dart';
import './result_page.dart';
import '../providers/data_tps.dart';
import '../widgets/calon_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllTPS extends StatefulWidget {
  static const routeName = '/all-tps';

  @override
  _AllTPSState createState() => _AllTPSState();
}

class _AllTPSState extends State<AllTPS> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
        final dataTps = Provider.of<DataTPS>(context, listen: false);

    dataTps.fetchTPSCalon();
  }


  @override
  Widget build(BuildContext context) {
    var _deviceHeight = MediaQuery.of(context).size.height;
    var _2deviceHeight = MediaQuery.of(context).size.height * 0.2;
    var _4deviceHeight = MediaQuery.of(context).size.height * 0.4;
    var _5deviceHeight = MediaQuery.of(context).size.height * 0.5;
    var _deviceWidth = MediaQuery.of(context).size.width;
    final dataTps = Provider.of<DataTPS>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TPS',
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
        child: RefreshIndicator(
          onRefresh: () async {
            await dataTps.fetchTPSCalon();
          },
          child: dataTps.dataAllTps.values.length == 0
          ? 
          Center(
            child: CircularProgressIndicator(),
          )
          : ListView(
            // padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.08),
            // physics: BouncingScrollPhysics(),
            children: [

              if (dataTps.dataAllTps.values.length == 0)
                Container(
                  height: _5deviceHeight,
                  alignment: Alignment.center,
                  child: Text('Tarik ke bawah untuk refresh data'),
                ),
              if (dataTps.dataAllTps.values.length != 0)
                Container(
                  width: _deviceWidth * 0.1,
                  margin: EdgeInsets.only(
                      left: _deviceWidth * 0.05,
                      right: _deviceWidth * 0.05,
                      top: _2deviceHeight * 0.1),
                  height: _4deviceHeight * 0.15,
                  child: RaisedButton(
                    onPressed: () async {
                      Navigator.of(context).pushNamed(InputPage.routeName);
                      // await dataTps.fetchPolings();
                      // await upload
                      //     .imageUpload()
                      //     .whenComplete(() => print('upload image success'));
                    },
                    // color: Theme.of(context).accentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Tambah',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: _4deviceHeight * 0.06,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              if (dataTps.dataAllTps.values.length != 0)
                Container(
                  height: _deviceHeight * 0.82,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: dataTps.dataAllTps.values.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        dataTps.fetchPerTps(index);
                        Navigator.of(context).pushNamed(ResultPage.routeName);
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
                              width: _deviceWidth * 0.4,
                              height: _4deviceHeight * 0.3,
                              // color: Colors.green,
                              alignment: Alignment.centerLeft,
                              child: SingleChildScrollView(
                                // scrollDirection: Axis.horizontal,
                                child: Text(
                                  // 'ssssssssssssssssssss',
                                  '${dataTps.dataAllTps.values.toList()[index].tpsName}',
                                  style: TextStyle(
                                      color: Color(0xff4F4F4F),
                                      fontSize: _2deviceHeight * 0.15,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ),
                            Container(
                              height: _4deviceHeight * 0.3,
                              width: _deviceWidth * 0.41,
                              child: ListView.builder(
                                itemCount: dataTps.dataAllTps.values.toList()[index].calon.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, i) =>
                                    CalonWidget(
                                      // suara: 10,
                                  suara: dataTps.dataAllTps.values.toList()[index].calon.values.toList()[i].suara,
                                  totalSuara: dataTps.calonDashboardTotal.toInt(),
                                  // totalSuara: 1000,
                                  namaCalon: '${dataTps.dataAllTps.values.toList()[index].calon.values.toList()[i].name}',
                                  nomorCalon: '${dataTps.dataAllTps.values.toList()[index].calon.values.toList()[i].nomor}',
                                ),
                                physics: ClampingScrollPhysics(),
                                
                                shrinkWrap: true,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

              // Image.asset(iconsHasil)
            ],
          ),
        ),
      ),
    );
  }
}
