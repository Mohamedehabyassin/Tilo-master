import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/splash.jpg'), fit: BoxFit.fill)),
          child: Container(
            color: Colors.purple.withOpacity(0.5),
          ),
        ),
        Positioned(
          top: 150,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Text(
                'Tilo',
                style: TextStyle(
                    fontFamily: 'KiwiMaru',
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'BEST SHOPPING EXPERIENCE',
                style: TextStyle(
                    fontFamily: 'Nunito', fontSize: 19, fontWeight: FontWeight.w300, color: Colors.white),
              ),
              const SizedBox(height: 200),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/SignUpScreen');
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.purple,
                  minimumSize: Size(150, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.white,
                ),
                child: Text(
                  "Let's Start",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Nunito'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/HomeScreen');
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
