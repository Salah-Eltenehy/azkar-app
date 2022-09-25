import 'package:azkar/layout/Home_Screen.dart';
import 'package:azkar/layout/cubit/AppStates.dart';
import 'package:azkar/shared/network/local/Local.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout/cubit/AppCubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AzkarApp();
  }
}
//AzkarCubit()..readJson(name: "0")
class AzkarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider( 
       create: ((context) => AzkarCubit()..readJson(name: "0")),
      child: BlocConsumer<AzkarCubit, AzkarStates>(
        listener: (context, state) {},
        builder:(context, state) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                        selectedItemColor: Colors.deepOrange,
                        unselectedItemColor: Colors.grey,
                        elevation: 25,
                        backgroundColor: Colors.white
                    ),
                    backgroundColor: Colors.white,
                    scaffoldBackgroundColor: Colors.white,
                    primarySwatch: Colors.deepOrange,
                    appBarTheme: AppBarTheme(
                      titleSpacing: 20.0,
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white,
                        statusBarIconBrightness: Brightness.dark,
                      ),
                      backgroundColor: Colors.white,
                      elevation: 0.0,
                      titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      iconTheme: IconThemeData(
                        color: Colors.black,
                      ),
                    ),
                  ),
          home: Directionality(
            textDirection: TextDirection.rtl,
            child: HomeScreen(),
            ),
          debugShowCheckedModeBanner: false,
          
        ),
      ),
    );
  }
  
}