import '../pages/dashboard_page.dart';
import '../pages/login_page.dart';
import '../providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isUserLoggedIn = false;
  Future<void> _checkUser() async {
    final auth = Provider.of<Auth>(context, listen: false);
    await auth.getUserData().whenComplete(() {
      if (auth.token == null) {
        // print('_isUserLoggedIn');
        setState(() {
          // _loginLoading = false;
          _isUserLoggedIn = false;
        });
      } else {
        Navigator.of(context).pushReplacementNamed(DashboardPage.routeName);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final auth = Provider.of<Auth>(context, listen: false);
    auth.tryAutoLogin(context);
    // _checkUser();
    // Future.delayed(Duration(milliseconds: 500), () {
    //   if (_isUserLoggedIn == true) {
    //     Navigator.of(context).pushReplacementNamed(DashboardPage.routeName);
    //   } else {
    //     Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
    //     // Future.delayed(Duration(milliseconds: 500), () {
    //     // });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
