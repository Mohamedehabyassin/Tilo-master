import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tilo/model/user_model.dart';
import 'package:tilo/module/screen/authenticate/log_in.dart';
import 'package:tilo/module/screen/authenticate/sign_up.dart';
import 'package:tilo/module/screen/cart/cart_screen.dart';
import 'package:tilo/module/screen/categories/baby_screen.dart';
import 'package:tilo/module/screen/categories/men_screen.dart';
import 'package:tilo/module/screen/categories/women_screen.dart';
import 'package:tilo/module/screen/complete/Complete.dart';
import 'package:tilo/module/screen/gift/gift.dart';
import 'package:tilo/module/screen/home/home.dart';
import 'package:tilo/module/screen/profile/edit_user_profile.dart';
import 'package:tilo/shared/network/auth/authService.dart';
import 'package:tilo/shared/provider/cart_provider.dart';
import 'package:tilo/shared/provider/data_provider.dart';
import 'package:tilo/shared/provider/wishlist_provider.dart';

import 'module/screen/splash_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: CartProvider()),
    ChangeNotifierProvider.value(value: DataProvider()),
    ChangeNotifierProvider.value(value: WishlistProvider())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/SignUpScreen': ((context) => SignUpScreen()),
          '/LoginScreen': ((context) => LoginScreen()),
          '/HomeScreen': ((context) => HomeScreen()),
          '/menScreen': ((context) => MenScreen()),
          '/womenScreen': ((context) => WomenScreen()),
          '/babyScreen': ((context) => BabyScreen()),
          '/CartScreen': ((context) => CartScreen()),
          '/GiftScreen': ((context) => GiftScreen()),
          '/CompleteScreen': ((context) => CompleteScreen()),
          '/EditProfileScreen': ((context) => EditProfileScreen()),
        },
        home: SplashScreen(),
      ),
    );
  }
}
