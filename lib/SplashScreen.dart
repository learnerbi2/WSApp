import 'package:flutter/material.dart';
import 'package:womensafetyapp/Loginpage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/logo.png', // replace with your logo
              width: 100,
              height: 100,
            ),
            SizedBox(height: 20),
            Text("SheSecure", style: TextStyle(color: Colors.blue)),
            SizedBox(height: 40),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.pink),
              strokeWidth: 5,
            ),
          ],
        ),
      ),
    ));
  }
}
