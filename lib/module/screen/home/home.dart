import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:tilo/module/screen/cart/cart_screen.dart';
import 'package:tilo/module/screen/home/entrance_screen.dart';
import 'package:tilo/module/screen/profile/user_profile.dart';
import 'package:tilo/module/screen/wishlist/wishlist.dart';
import 'package:tilo/shared/network/auth/authService.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _auth = AuthService();
  int selectedIndex = 0;
  static List<Widget> screens = [
    EntranceScreen(),
    WishlistScreen(),
    CartScreen(),
    UserProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/logo1.jpg',
          height: 50,
          width: 100,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              size: 35,
              color: Colors.red[800],
            ),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      body: screens[selectedIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        unselectedItemColor: Colors.black26,
        selectedItemColor: Colors.purple,
        iconSize: 25,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'WishList'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket_sharp), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(EvaIcons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
