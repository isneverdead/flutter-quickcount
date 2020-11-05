import './camera_screen.dart';
import '../providers/data_tps.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CalonSuara {
  final int id;
  final int idCalon;
  final int suara;
  // final TextEditingController controller;
  // final String urlFotoC1;
  // final String createdAt;
  CalonSuara({
    @required this.id,
    @required this.idCalon,
    @required this.suara,
    // @required this.controller
    // @required this.namaDaerah,
    // @required this.urlFotoC1,
    // @required this.createdAt,
  });
}
class InputPage extends StatefulWidget {
  static const routeName = '/input';
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool _submitLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
        final dataTps = Provider.of<DataTPS>(context, listen: false);
          dataTps.fetchCalon();
  }
  final _tpsController = TextEditingController();
  final _pasanganAController = TextEditingController();
  final _pasanganBController = TextEditingController();
  File _image;

  List<TextEditingController> controllersCalon = List();
  Map<int, CalonsSuara> mapCalonSuara = {};
  final picker = ImagePicker();
    String _selectedLocation; // Option 2

  
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        final dataTps = Provider.of<DataTPS>(context, listen: false);
        dataTps.setImagePath(_image);
      } else {
        print('No image selected.');
      }
    });
  }
  _updateMapCalon(int index, int idCalon, int suara){
      print('$index , $idCalon, $suara');
    mapCalonSuara.update(index, (value) {
      print(value);
      try {
      return CalonsSuara(id: index, idCalon: idCalon, suara: suara);
        
      } catch (e) {
        throw e;
      }
    });

  }
  String _token;
   Future<void> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('userToken');
    print('token is > $_token');
  }


  Future <void> _uploadFile(File file,  Map<int, CalonsSuara> map, BuildContext context) async {
    if(file == null || map == null) {
      setState(() {
        _submitLoading = false;
      });  
        Fluttertoast.showToast(
            msg: 'Harap isi semua data',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black87,
            textColor: Colors.white,
            fontSize: 16.0
        );
           
    }
    final url = '${DataTPS.endPoint}/api/insert/add';
    // final url = 'http://3d75b149c386.ngrok.io';
    await getUserData();
    String fileName = file.path.split('/').last;
    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token',
    };
    final ptps = Provider.of<DataTPS>(context, listen: false);

    FormData data = FormData.fromMap({
      'tps_name': ptps.namaTPS,
      'photo': await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
      // 'count': jsonEncode({
      //   "1": 500,
        // "2": 699

      // }),
      // 'count[1]': 500,
    });
        for(var i = 0; i < map.length; i++) {
          data.fields.add(MapEntry('count[${map.values.toList()[i].idCalon}]', '${map.values.toList()[i].suara}'));
        }

    // print(calon.length);
    // for(var i = 0; i < _calon.length; i++) {
    //   data.fields.add(MapEntry('count[${calon.values.toList()[i].id}]', controllersCalonSuara[int.parse(calon.values.toList()[i].id)].text));
    //   print(MapEntry('count[${calon.values.toList()[i].id}]', controllersCalonSuara[int.parse(calon.values.toList()[i].id)].text));
    // }
    // print(data.fields);
    
    Dio dio = new Dio();
    dio .post(url, data: data, options: Options(headers: requestHeaders))
        .then((response) {

          print(response);
            if(response.statusCode == 200) {
              Fluttertoast.showToast(
                  msg: 'Upload berhasil',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black87,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
        final dataTps = Provider.of<DataTPS>(context, listen: false);

            dataTps.setImagePath(null);
            Navigator.of(context).pop();

            } else {
              Fluttertoast.showToast(
                  msg: 'gagal',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black87,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }
          }   
        )
        .catchError((error) => print(error));
    // print(jsonEncode(suara));
  }

  _transferToProvider(Map<int, CalonsSuara> aa){
    aa.forEach((key, value) { 
    final ptps = Provider.of<DataTPS>(context, listen: false);
      ptps.mapControllersCalonSuara.putIfAbsent(key, () => value);
     print(ptps.mapControllersCalonSuara.length);
     });
  }
  _showCupertinoDialog(BuildContext contextt) {
    showDialog(
        context: contextt,
        builder: (_) => new CupertinoAlertDialog(
              title: new Text('Pilih opsi Upload'),
              content: new Text(''),
              actions: [
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlatButton(
                        child: Text('Gallery'),
                        onPressed: () async {
                          Navigator.of(contextt).pop;
                          await getImage();

                          // .whenComplete(() {
                          //   if (_image != null) {
                          //     Navigator.of(context).pop;
                          //   }
                          // });
                        },
                      ),
                      Container(
                        width: 1,
                        height: 20,
                        color: Colors.black,
                      ),
                      FlatButton(
                        child: Text('Camera'),
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(CameraScreen.routeName);
                        },
                      )
                    ],
                  ),
                )
              ],
            ));
  }
  

  @override
  Widget build(BuildContext context) {
    var _deviceHeight = MediaQuery.of(context).size.height;
    var _2deviceHeight = MediaQuery.of(context).size.height * 0.2;
    var _4deviceHeight = MediaQuery.of(context).size.height * 0.4;
    var _deviceWidth = MediaQuery.of(context).size.width;
    final dataTps = Provider.of<DataTPS>(context);
      Map<String, Calon> _calon = dataTps.calon;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Input Hasil',
          style: TextStyle(
              fontWeight: FontWeight.w800, fontSize: _4deviceHeight * 0.09),
        ),
        centerTitle: true,
        // backgroundColor: Colors.white,
      ),
      body: Container(
        width: _deviceWidth,
        height: _deviceHeight,
        // padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.09),
        color: Theme.of(context).backgroundColor,
        child: ListView(
          // padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.08),
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: 15, bottom: 5, left: _deviceWidth * 0.05),
              width: _deviceWidth * 0.9,
              // color: Colors.green,
              child: Text(
                'TPS',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                // top: 15,
                bottom: 5,
                left: _deviceWidth * 0.05,
                right: _deviceWidth * 0.05,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              width: _deviceWidth * 0.8,
              height: _4deviceHeight * 0.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 10),
                    width: _deviceWidth * 0.7,
                    height: _4deviceHeight * 0.1,
                    child: TextField(
                      onChanged: (text){
                                final ptps = Provider.of<DataTPS>(context, listen: false);
                                ptps.changeNamaTPS(text);

                      },
                      controller: dataTps.namaTpsController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Masukkan Nama TPS'),
                    ),
                  ),
                ],
              ),
            ),
          
          Container(
            // width: _deviceWidth * 0.89,
            height: _2deviceHeight,
            child: 
            dataTps.calon.length == 0 
            ? 
            Column(
              children: [
                SizedBox(height: 20,),
                CircularProgressIndicator(),
              ],
            )
            // Positioned(
            //               child: Container(
            //     // height: _2deviceHeight * 0.2,
            //       padding: EdgeInsets.symmetric(
            //         horizontal: _deviceWidth * 0.45,
            //         vertical: _2deviceHeight * 0.4 ), 
            //       child: CircularProgressIndicator(),
            //     ),
            // ) 
            : ListView.builder(
              itemCount: dataTps.calon.length, 
              itemBuilder: (context, index){
              controllersCalon.add(new TextEditingController());
              // dataTps.controllersCalonSuara.add(new TextEditingController());
              // dataTps.kirimSuaraCalon.add(index);
              mapCalonSuara.putIfAbsent(index, () => CalonsSuara(id: index, idCalon: int.parse(_calon.values.toList()[index].id), suara: null));
            //  dataTps.mapControllersCalonSuara.putIfAbsent(index, () => CalonsSuara(id: index, idCalon:int.parse(_calon.values.toList()[index].id), suara: null));
              return Column(children: [
                Container(
              margin: EdgeInsets.only(
                  top: 15, bottom: 5, left: _deviceWidth * 0.05),
              width: _deviceWidth * 0.9,
              // color: Colors.green,
              child: Text(
                'Jumlah Suara ${dataTps.calon.values.toList()[index].name}',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                // top: 15,
                bottom: 5,
                // left: _deviceWidth * 0.05,
                // right: _deviceWidth * 0.05,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              width: _deviceWidth * 0.89,
              height: _4deviceHeight * 0.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 10),
                    width: _deviceWidth * 0.7,
                    height: _4deviceHeight * 0.1,
                    child: TextField(

                      onChanged: (text) {
                        // print(text);
                        // print(' controller ${dataTps.controllersCalonSuara[12].text}');
                        // print(dataTps.mapControllersCalonSuara.values.toList()[int.parse(dataTps.calon.values.toList()[index].id)]);
                        print(mapCalonSuara.values.toList()[index].idCalon);
                        _updateMapCalon(index, int.parse(_calon.values.toList()[index].id), int.parse(text));

                        // ptps.mapControllersCalonSuara.update(index, (value) => CalonsSuara(id: index, idCalon: int.parse( _calon.values.toList()[index].id), suara: int.parse(text)));

                        print(mapCalonSuara.values.toList()[index].suara);
                        
                        // dataTps.ubahKiriSuaraCalon(int.parse(dataTps.calon.values.toList()[index].id), int.parse(dataTps.controllersCalonSuara[int.parse(dataTps.calon.values.toList()[index].id)].text));
                        // print(dataTps.controllersCalonSuara[int.parse(dataTps.calon.values.toList()[index].id)].text);
                     
                        // print(dataTps.kirimSuaraCalon);
                      },
                      // onEditingComplete: (){
                      //   dataTps.mapControllersCalonSuara.update(index, (value) => CalonsSuara(id: index, idCalon: int.parse(dataTps.calon.values.toList()[index].id), suara: int.parse(dataTps.controllersCalonSuara[index].text)));
                      //   print(dataTps.mapControllersCalonSuara.values.toList()[index].suara);
                      //   Navigator.of(context).pop();
                      // },
                      onSubmitted: (text) {
                        print('submitted');
                        print(dataTps.mapControllersCalonSuara.values);
                        //  dataTps.mapControllersCalonSuara.update(index, (value) {
                        //    print(value.suara);
                        //    return CalonsSuara(id: index, idCalon: int.parse(dataTps.calon.values.toList()[index].id), suara: int.parse(text));
                        //  });
                          dataTps.mapControllersCalonSuara.putIfAbsent(index, () => CalonsSuara(id: index, idCalon: int.parse(dataTps.calon.values.toList()[index].id), suara: int.parse(dataTps.controllersCalonSuara[index].text)));
                        print('data');
                        Navigator.pop(context);
                      },
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      controller: controllersCalon[index],
                      // controller: dataTps.mapControllersCalonSuara.values.toList()[int.parse(dataTps.calon.values.toList()[index].id)].controller,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Masukkan Jumlah Suara'),
                    ),
                  ),
                ],
              ),
            ),
              ],);
            }),
          ),
            
            
            /// Input Suara A
            
            Container(
              margin: EdgeInsets.only(
                top: 10,
                left: _deviceWidth * 0.09,
                right: _deviceWidth * 0.09,
              ),
              padding: EdgeInsets.only(
                  // left: _deviceWidth * 0.2,
                  // right: _deviceWidth * 0.2,
                  // top: _deviceWidth * 0.28,
                  // bottom: _deviceWidth * 0.28,
                  ),
              width: _4deviceHeight * 0.9,
              height: _4deviceHeight * 0.9,
              decoration: BoxDecoration(
                image: dataTps.imagePath != null
                    ? DecorationImage(
                        image: FileImage(File(dataTps.imagePath.path)),
                        fit: BoxFit.fitHeight)
                    : null,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 4, color: Colors.white),
              ),
              child: Stack(
                children: [
                  dataTps.imagePath != null
                      ? Positioned(
                          top: 5,
                          right: 5,
                          child: Container(
                            child: IconButton(
                              icon: Icon(Icons.cancel),
                              onPressed: () {
                                dataTps.setImagePath(null);
                              },
                            ),
                          ))
                      : Center(
                          child: Container(
                            width: _deviceWidth * 0.4,
                            height: _4deviceHeight * 0.15,
                            child: RaisedButton(
                              onPressed: () async {
                                // getImage();
                                _transferToProvider(mapCalonSuara);
                                _showCupertinoDialog(context);
                              },
                              color: Theme.of(context).accentColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Upload Form C1',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: _4deviceHeight * 0.06,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
            Container(
              width: _deviceWidth * 0.1,
              margin: EdgeInsets.symmetric(
                horizontal: _deviceWidth * 0.05,
                vertical: _4deviceHeight * 0.1,
              ),
              height: _4deviceHeight * 0.15,
              child: RaisedButton(
                onPressed: () async {
                  setState(() {
                    _submitLoading = true;
                  });
                  await _uploadFile(dataTps.imagePath, mapCalonSuara, context );
        //           await Fluttertoast.showToast(
        //           msg: 'Upload berhasil',
        //           toastLength: Toast.LENGTH_SHORT,
        //           gravity: ToastGravity.CENTER,
        //           timeInSecForIosWeb: 1,
        //           backgroundColor: Colors.red,
        // textColor: Colors.white,
        //           fontSize: 16.0
        //       );
                  //     setState(() {
                  //   _submitLoading = false;
                  // });
                  // print(dataTps.controllersCalonSuara);
                },
                // color: Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child:
                _submitLoading
                  ? Container(
                      child: CircularProgressIndicator(),
                    )
                  : Text(
                  'Submit',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: _4deviceHeight * 0.06,
                    color: Colors.white, 
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
