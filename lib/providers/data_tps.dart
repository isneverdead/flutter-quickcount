// import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Calon {
  final String id;
  final String name;
  final int nomor;
  Calon({
    @required this.id,
    @required this.name,
    @required this.nomor,
  });
}
class DataPerTps {
  final String id;
  final String tpsName;
  final Map<String, CalonDashboard> calon;
  DataPerTps({
    @required this.id, @required this.tpsName, @required this.calon,
  });
}
class CalonDashboard {
  final String id;
  final String name;
  final int nomor;
  final int suara;
  CalonDashboard({
    @required this.id,
    @required this.name,
    @required this.nomor,
    @required this.suara,
  });
}

class CalonDetail {
  final String id;
  final String poolingId;
  final int jumlahSuara;
  final String createdAt;
  CalonDetail({
    @required this.id,
    @required this.poolingId,
    @required this.jumlahSuara,
    @required this.createdAt,
  });
}

class Polings {
  final String id;
  final String namaTps;
  final String namaDaerah;
  final String urlFotoC1;
  final String createdAt;
  Polings({
    @required this.id,
    @required this.namaTps,
    @required this.namaDaerah,
    @required this.urlFotoC1,
    @required this.createdAt,
  });
}

class TPS {
  final String idTps;
  final String namaTps;
  // final String namaDaerah;
  // final String urlFotoC1;
  // final String createdAt;
  TPS({
    @required this.idTps,
    @required this.namaTps,
    // @required this.namaDaerah,
    // @required this.urlFotoC1,
    // @required this.createdAt,
  });
}
class CalonsSuara {
  final int id;
  final int idCalon;
  final int suara;
  // final TextEditingController controller;
  // final String urlFotoC1;
  // final String createdAt;
  CalonsSuara({
    @required this.id,
    @required this.idCalon,
    @required this.suara,
    // @required this.controller
    // @required this.namaDaerah,
    // @required this.urlFotoC1,
    // @required this.createdAt,
  });
}


class DataTPS with ChangeNotifier {
  static final String endPoint = 'http://goapp.iniakbar.xyz';

  String _token;
  String get token {
    return _token;
  }

  Map<String, Calon> _calon = {};
  Map<String, Calon> get calon {
    return {..._calon};
  }

  Map<String, CalonDashboard> _calonDashboard = {};
  Map<String, CalonDashboard> get calonDashboard {
    return {..._calonDashboard};
  }

  double _calonDashboardTotal;
  double get calonDashboardTotal {
    return _calonDashboardTotal;
  }

  Map<String, CalonDetail> _calonDetail = {};
  Map<String, CalonDetail> get calonDetail {
    return {..._calonDetail};
  }

  Map<String, TPS> _tps = {};
  Map<String, TPS> get tps {
    return {..._tps};
  }

  Map<String, Polings> _polings = {};
  Map<String, Polings> get polings {
    return {..._polings};
  }

  Map<String, double> _dataMap = {};
  Map<String, double> get dataMap {
    return {..._dataMap};
  }
  Map<String, String> _namaTps = {};
  Map<String, String> get namaTps {
    return {..._namaTps};
  }
  Map<String, CalonDashboard> _resultPerTps = {};
  Map<String, CalonDashboard> get resultPerTps {
    return {..._resultPerTps};
  }
  Map<String, double> _dataMapPerTps = {};
  Map<String, double> get dataMapPerTps {
    return _dataMapPerTps;
  }
  String _judulPerTps ='';
  String get judulPerTps {
    return _judulPerTps;
  }
  String _namaTPS;
  String get namaTPS {
    return _namaTPS;
  }
  int _totalSuaraPerTps = 0;
  int get totalSuaraPerTps {
    return _totalSuaraPerTps;
  }
  void changeNamaTPS(String nama) {
    _namaTPS = nama;
  }
  Map<String, CalonDashboard> calons = {'satu': CalonDashboard(id: 'null', name: 'aldo', nomor: 1, suara: 100)};

  Map<String, DataPerTps> _dataAllTps = {
    // 'satu': DataPerTps(id: 'satu', tpsName: 'nama tps', calon: {
    //   'satu': CalonDashboard(id: 'null', name: 'aldo', nomor: 1, suara: 100),
    //   'dua': CalonDashboard(id: 'dua', name: 'bambang', nomor: 2, suara: 150),
    //   'tiga': CalonDashboard(id: 'tiga', name: 'agus', nomor: 3, suara: 250),},),
    //   'dua': DataPerTps(id: 'satu', tpsName: 'nama tps', calon: {
    //   'satu': CalonDashboard(id: 'null', name: 'aldo', nomor: 1, suara: 100),
    //   'dua': CalonDashboard(id: 'dua', name: 'bambang', nomor: 2, suara: 150),
    //   'tiga': CalonDashboard(id: 'tiga', name: 'agus', nomor: 3, suara: 250),},),
  };
    List<TextEditingController> controllersCalonSuara = new List();
    Map<int, CalonsSuara> _mapControllersCalonSuara = {};
    Map<int, CalonsSuara> get  mapControllersCalonSuara {
      return {..._mapControllersCalonSuara};
    }
    void addMapControllersCalonSuara(CalonsSuara controllerCalon) {
      _mapControllersCalonSuara.putIfAbsent(controllerCalon.id, () => controllerCalon);
    }
  TextEditingController namaTpsController;
  Map<String, DataPerTps> get dataAllTps {
    return {..._dataAllTps};
  }
  List <int> kirimSuaraCalon = List();
  void ubahKiriSuaraCalon(int index, int suara) {
    kirimSuaraCalon[index] = suara;
    print(kirimSuaraCalon[index]);
    notifyListeners();
  }


  Future<void> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('userToken');
    print('token is > $_token');
    notifyListeners();
  }

  // static final String uploadEndPoint =
  //     'http://localhost/flutter_test/upload_image.php';
  Future<void> imageUpload() async {
    final url = '$endPoint/api/polings/add';

    // File image = File(imagePath);
    try {
      // final bytes = await File(imagePath).readAsBytes();

      // String base64Image = base64Encode(bytes);
      http.post(url, body: {
        // "image": base64Image,
        "name": "nama",
      });
    } catch (e) {
      throw e;
    }
  }

  File _imagePath;
  File get imagePath {
    return _imagePath;
  }

  Future <void> uploadFile(File file,  List<int> suara) async {
    final url = '$endPoint/api/insert/add';
    // final url = 'http://3d75b149c386.ngrok.io';
    await getUserData();
    String fileName = file.path.split('/').last;
    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    FormData data = FormData.fromMap({
      'tps_name': namaTPS,
      'photo': await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
      // 'count': jsonEncode({
      //   "1": 500,
      //   "2": 699

      // }),
      // 'count[0]': 500,
    });
    
    print(calon.length);
    for(var i = 0; i < calon.length; i++) {
      data.fields.add(MapEntry('count[${calon.values.toList()[i].id}]', controllersCalonSuara[int.parse(calon.values.toList()[i].id)].text));
      print(MapEntry('count[${calon.values.toList()[i].id}]', controllersCalonSuara[int.parse(calon.values.toList()[i].id)].text));
    }
    print(data.fields);
    
    Dio dio = new Dio();
    dio
        .post(url, data: data, options: Options(headers: requestHeaders))
        .then((response) => print(response))
        .catchError((error) => print(error));
    // print(jsonEncode(suara));
  }

  void setImagePath(File path) {
    _imagePath = path;
    notifyListeners();
  }

  Future<void> fetchCalon() async {
    final url = '$endPoint/api/calons/all';
    await getUserData();
    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      final response = await http.get(url, headers: requestHeaders);

      final responseData = json.decode(response.body);
      print(responseData);
      for (var item in responseData['data']) {
        _calon.putIfAbsent(
            '${item['id']}',
            () => Calon(
                  id: item['id'].toString(),
                  name: item['name'],
                  nomor: int.parse(item['number'].toString()),
                ));
      }
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> fetchCalonDetail() async {
    final url = '$endPoint/api/details/all';
    await getUserData();
    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      final response = await http.get(url, headers: requestHeaders);

      // print(response.body);
      final responseData = json.decode(response.body);
      print(responseData['data']);
      for (var item in responseData['data']) {
        _calonDetail.putIfAbsent(
            '${item['id']}',
            // '${item['id']}${item['user_id']}',
            () => CalonDetail(
                id: item['id'].toString(),
                poolingId: item['pooling_id'].toString(),
                jumlahSuara: item['count'],
                createdAt: item['created_at'].toString()));
      }
      print('============');
      // print(_calonDetail);
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> fetchPolings() async {
    final url = '$endPoint/api/polings/all';
    await getUserData();
    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      final response = await http.get(url, headers: requestHeaders);

      // print(response.body);
      final responseData = json.decode(response.body);
      print(responseData['data']);
      for (var item in responseData['data']) {
        _polings.putIfAbsent(
            '${item['id']}',
            // '${item['id']}${item['user_id']}',
            () => Polings(
                  id: item['id'].toString(),
                  namaTps: item['tps_name'],
                  namaDaerah: item['region_name'],
                  urlFotoC1: item['photo'],
                  createdAt: item['created_at'].toString(),
                ));
      }
      print('============');
      // print(_tps);
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }
  Future<void> fetchPerTps(int i) async {
    
    _judulPerTps = _dataAllTps.values.toList()[i].tpsName;
      _resultPerTps.clear();
    _dataAllTps.values.toList()[i].calon.forEach((key, value) { 
      _resultPerTps.putIfAbsent(key, () => value);
      _dataMapPerTps.putIfAbsent(value.name, () => value.suara.toDouble());
      _totalSuaraPerTps = _totalSuaraPerTps + value.suara;
    });
    print(resultPerTps);
    notifyListeners();
  }
  Future<void> fetchDashboard() async {
    final url = '$endPoint/api/detail';
    await getUserData();
    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      final response = await http.get(url, headers: requestHeaders);

      // print(response.body);
      final responseData = json.decode(response.body);
      print(responseData['data']);
      _calonDashboardTotal =
          double.parse(responseData['data']['total_suara_keseluruhan']);
      for (var item in responseData['data']['calon']) {
        _calonDashboard.putIfAbsent(
            '${item['name']}',
            // '${item['id']}${item['user_id']}',
            () => CalonDashboard(
                  id: item['name'],
                  name: item['name'],
                  nomor: int.parse(item['number'].toString()),
                  suara: int.parse(
                    item['count'].toString(),
                  ),
                ));
      }
      _calonDashboard.forEach((key, value) {
        _dataMap.putIfAbsent(value.name, () => value.suara.toDouble());
      });
      notifyListeners();
    } catch (e) {
      print(e);
      throw e;
    }
  }
  Future<void> fetchTPSCalon() async {
    final url = '$endPoint/api/count';
    await getUserData();
    await fetchDashboard();
    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      final response = await http.get(url, headers: requestHeaders);

      // print(response.body);
      final responseData = json.decode(response.body);
      // print(responseData['data']);
      final dataTps =responseData['data']['tps'];
      for (var item in dataTps) {
      Map<String, CalonDashboard> _calon = {};
        // print(item['details']);
        for (var calon in item['details']) {
          _calon.putIfAbsent(calon['number'].toString(), () => CalonDashboard(id: calon['number'].toString(), name: calon['name'], nomor: int.parse(calon['number'].toString()), suara: int.parse(calon['count'].toString())));
        }
        // print('calon');
        // print(_calon);
        _dataAllTps.putIfAbsent(
            '${item['id']}',
            // '${item['id']}${item['user_id']}',
            
            () => DataPerTps(id: item['id'].toString(), tpsName: item['tps_name'], calon: _calon ));
      }
      // _calonDashboard.forEach((key, value) {
      //   _dataMap.putIfAbsent(value.name, () => value.suara.toDouble());
      // });
      // print(_dataAllTps);
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }
  Future<void> fetchTpsName() async {
    final url = '$endPoint/api/tpsName';
    await getUserData();
    await fetchTPSCalon();
    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      final response = await http.get(url, headers: requestHeaders);

      // print(response.body);
      final responseData = json.decode(response.body);
      // print(responseData['data']);
      final dataTps =responseData['data']['tps'];
      for (var item in dataTps) {
      
        _namaTps.putIfAbsent(
            '${item['id_tps']}',
            () => '${item['tps_name']}');
      }
      
      print(_namaTps);
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }
  
  
}
