import 'package:fluttertoast/fluttertoast.dart';

import '../pages/dashboard_page.dart';
import '../pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../style/my_icons.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordHidden = true;
  bool _loginLoading = false;
  // bool _isUserLoggedIn = false;
  bool _isUserLoggedIn = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // await _checkUser();
  }

  @override
  Widget build(BuildContext context) {
    // _checkUser();
    final auth = Provider.of<Auth>(context);
    var _deviceHeight = MediaQuery.of(context).size.height;
    var _2deviceHeight = MediaQuery.of(context).size.height * 0.2;
    var _4deviceHeight = MediaQuery.of(context).size.height * 0.4;
    var _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(
              fontWeight: FontWeight.w800, fontSize: _4deviceHeight * 0.09),
        ),
        centerTitle: true,
        // backgroundColor: Colors.white,
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.08),
              physics: BouncingScrollPhysics(),
              children: [
                Tooltip(
                  message: 'ini gambar 😑',
                  child: Container(
                    margin: EdgeInsets.only(
                        top: _4deviceHeight * 0.15,
                        bottom: _4deviceHeight * 0.1),
                    height: _4deviceHeight * 0.8,
                    width: _deviceWidth * 0.2,
                    // color: Colors.green,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(iconsApp))),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, bottom: 5),
                  child: Text(
                    'Username',
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Color(0xffFFEFCD),
                      borderRadius: BorderRadius.circular(10)),
                  width: _deviceWidth * 0.9,
                  height: _4deviceHeight * 0.15,
                  child: Row(
                    children: [
                      Container(
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(50),
                        //     border: Border.all(width: 2)),
                        child: Icon(
                          Icons.person_outline,
                          color: Color(0x86000000),
                        ),
                      ),
                      // Container(
                      //   // margin: EdgeInsets.only(
                      //   //     top: _4deviceHeight * 0.15, bottom: _4deviceHeight * 0.1),
                      //   height: _4deviceHeight * 0.05,
                      //   width: _deviceWidth * 0.05,
                      //   // color: Colors.green,
                      //   child: SvgPicture.asset(
                      //     iconsProfile,
                      //     color: Colors.black,
                      //   ),
                      // ),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 10),
                        width: _deviceWidth * 0.7,
                        height: _4deviceHeight * 0.1,
                        child: TextField(
                          textInputAction: TextInputAction.next,
                          controller: _usernameController,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'Username'),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, bottom: 5),
                  child: Text(
                    'Password',
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Color(0xffFFEFCD),
                      borderRadius: BorderRadius.circular(10)),
                  width: _deviceWidth * 0.9,
                  height: _4deviceHeight * 0.15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.lock_outline,
                            color: Color(0x86000000),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 10),
                            width: _deviceWidth * 0.57,
                            height: _4deviceHeight * 0.1,
                            child: TextField(
                              textInputAction: TextInputAction.done,
                              obscureText: _isPasswordHidden,
                              controller: _passwordController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password'),
                            ),
                          ),
                        ],
                      ),
                      Tooltip(
                        message: 'Lihat Password',
                        child: Container(
                          alignment: Alignment.centerRight,
                          width: _deviceWidth * 0.1,
                          // color: Colors.green,
                          child: IconButton(
                              color: Color(0x86000000),
                              icon: Icon(_isPasswordHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _isPasswordHidden = !_isPasswordHidden;
                                });
                              }),
                        ),
                      )
                    ],
                  ),
                ),
                Tooltip(
                  message: 'Silahkan Hubungi admin',
                  child: Container(
                    // margin: EdgeInsets.only(top: 5, bottom: 5),
                    width: _deviceWidth * 0.9,
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                        onPressed: () {}, child: Text('Lupa Password')),
                  ),
                ),
                Tooltip(
                  message: 'Klik untuk Login',
                  child: Container(
                    width: _deviceWidth * 0.8,
                    height: _4deviceHeight * 0.15,
                    child: RaisedButton(
                      // color: Theme.of(context).accentColor,
                      onPressed: () async {
                        print('pressed');
                        setState(() {
                          _loginLoading = true;
                        });
                        await auth
                            .auth(_usernameController.text,
                                _passwordController.text, context)
                            .whenComplete(() {
                          auth.getUserData().whenComplete(() {
                            if (auth.token == null) {
                              Fluttertoast.showToast(
                                msg: 'Login Gagal',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.black45,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                              setState(() {
                                _loginLoading = false;
                              });
                            }
                          });
                        });
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: _loginLoading
                          ? Container(
                              child: CircularProgressIndicator(),
                            )
                          : Text(
                              'Login',
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
            )),
      ),
    );
  }
}
