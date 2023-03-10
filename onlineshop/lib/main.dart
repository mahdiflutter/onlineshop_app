import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlineshop/bloc/auth/login_bloc.dart';
import 'package:onlineshop/bloc/category/category_bloc.dart';
import 'package:onlineshop/bloc/home/home_bloc.dart';
import 'package:onlineshop/constants/maincolor_constant.dart';
import 'package:onlineshop/di/di.dart';
import 'package:onlineshop/screens/category_screen.dart';
import 'package:onlineshop/screens/home_screen.dart';
import 'package:onlineshop/screens/login_screen.dart';
import 'package:onlineshop/screens/userbasket_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGetIt();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedScreen = 3;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'SB'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IndexedStack(
          index: selectedScreen,
          children: getScreen(),
        ),
        bottomNavigationBar: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              currentIndex: selectedScreen,
              onTap: (value) {
                setState(() {
                  selectedScreen = value;
                });
              },
              unselectedLabelStyle: const TextStyle(
                fontFamily: 'SB',
                color: MainColors.mainGray,
                fontSize: 15,
              ),
              selectedLabelStyle: const TextStyle(
                fontFamily: 'SB',
                color: MainColors.mainBlue,
                fontSize: 15,
              ),
              unselectedIconTheme: const IconThemeData(
                color: MainColors.mainGray,
                size: 30,
              ),
              selectedIconTheme: const IconThemeData(
                color: MainColors.mainBlue,
                size: 30,
              ),
              selectedItemColor: MainColors.mainBlue,
              unselectedItemColor: MainColors.mainGray,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                    label: '???????? ????????????',
                    icon: Icon(Icons.person_outline_rounded),
                    activeIcon: Icon(Icons.person)),
                BottomNavigationBarItem(
                    label: '?????? ????????',
                    icon: Icon(Icons.shopping_bag_outlined),
                    activeIcon: Icon(Icons.shopping_bag)),
                BottomNavigationBarItem(
                    label: '???????? ????????',
                    icon: Icon(Icons.category_outlined),
                    activeIcon: Icon(Icons.category_rounded)),
                BottomNavigationBarItem(
                    label: '????????',
                    icon: Icon(Icons.home_outlined),
                    activeIcon: Icon(Icons.home_rounded)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getScreen() {
    return <Widget>[
      BlocProvider(
        create: (context) => LoginBloc(),
        child: const LoginScreen(),
      ),
      const UserBasketScreen(),
      BlocProvider(
        create: (context) => CategoryBloc(),
        child: const CategoryScreen(),
      ),
      BlocProvider(
        create: (context) => HomeBloc(),
        child: const Directionality(
          textDirection: TextDirection.rtl,
          child: HomeScreen(),
        ),
      )
    ];
  }
}
