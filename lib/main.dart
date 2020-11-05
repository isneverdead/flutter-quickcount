import './pages/all_tps_page.dart';
import './pages/camera_screen.dart';
import './pages/dashboard_page.dart';
import './pages/home_page.dart';
import './pages/input_page.dart';  
import './pages/login_page.dart';
import './pages/result_page.dart';
import './pages/splash_screen.dart';
import './providers/auth.dart';
import './widgets/select_tps.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/data_tps.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: DataTPS(),
        ),
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
      ],
      child: MaterialApp(
        title: 'Quick Count',
        theme: ThemeData(
          primaryColor: Color(0xffF9D668),
          accentColor: Color(0xffFF9F43),
          appBarTheme: AppBarTheme(color: Color(0xffFFC200)),
          backgroundColor: Color(0xffEEEEEE),
          buttonColor: Color(0xff333333),
          fontFamily: 'Roboto',
          // inputDecorationTheme: ,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
        routes: {
          LoginPage.routeName: (context) => LoginPage(),
          AllTPS.routeName: (context) => AllTPS(),
          HomePage.routeName: (context) => HomePage(),
          CameraScreen.routeName: (context) => CameraScreen(),
          ResultPage.routeName: (context) => ResultPage(),
          InputPage.routeName: (context) => InputPage(),
          DashboardPage.routeName: (context) => DashboardPage(),
        },
      ),
    );
  }
}
