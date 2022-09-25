import 'package:azkar/layout/cubit/AppCubit.dart';
import 'package:azkar/layout/cubit/AppStates.dart';
import 'package:azkar/modules/elmasba7a/Elmasba7a_Screen.dart';
import 'package:azkar/modules/nav_bar/NavBar_Screen.dart';
import 'package:azkar/modules/settings/Settings.dart';
import 'package:azkar/shared/components/Compomemts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartarabic/dartarabic.dart';
import 'dart:convert';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AzkarCubit, AzkarStates>( 
      listener: (context, state) {},
      builder:(context, state) {
        var cubit  = AzkarCubit.get(context);
        return Scaffold(
        drawer: NavBarScreen(),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                cubit.refresh();
              },
              icon: Icon(Icons.refresh)
            ),
          ],
          title: Text(
            "${cubit.titles[cubit.titleIndex]}",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
          ),
          backgroundColor: Colors.deepOrange,
        ),
        body: ListView.separated(
          itemBuilder: (context, index) => buildAzkarItem(
            counter: cubit.counters[index], 
            item: cubit.items[index],
            index: index,
            context: context,
            ), 
          separatorBuilder: (context, index) => Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey[300],
          ), 
          itemCount: cubit.items.length
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentBottomNavBar,
            onTap: (index) {
              if(index == 0) {
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsScreen();
                  })
                );
              } else {
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ElmasbahaScreen();
                  })
                );
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "الإعدادات",                 
                ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.receipt
                ),
                label: "المسبحة",             
                ),
            ],
            ),
      );
      }
    );
  }
}