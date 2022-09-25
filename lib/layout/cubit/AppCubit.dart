import 'dart:convert';

import 'package:azkar/layout/cubit/AppStates.dart';
import 'package:azkar/shared/network/local/Local.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AzkarCubit extends Cubit<AzkarStates> {

  AzkarCubit() : super(InitialAzkarState());

  static AzkarCubit get(context) => BlocProvider.of(context);
  int titleIndex = 0;
  late SharedPreferences sharedPreferences;
  var backgroundColors = [];
  late Database databaseObject;
  var items = [];
  var counters = [];
  int currentBottomNavBar = 0;
  double sliderHeight = 25;
  int counterOfTasbe7 = 0;
  void refresh() {
    counters = [];
    backgroundColors = [];
    items.forEach((element) {
      counters.add(element['itemCount']);
    });
    initColors();
    emit(RefreshState());
  }
  List<String> titles = [
    "أذكار الصباح",
    "أذكار المساء",
    "أذكار بعد الصلاة",
    "أذكار المسجد",
    "دُعَاءُ خَتْمِ القُرْآنِ الكَريمِ",
    "أذكار النوم",
    "الرقية الشرعية من القرآن والسنة",
  ];

  // void initDatabase () async {
  //   DataBase.init();
  //   List<Map> list = await DataBase.getData();
  //   sliderHeight = double.parse(list[0]['size']);
  //   counterOfTasbe7 = int.parse(list[0]['counter']); 
  // }
  Widget getNavName(String title) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 164, 137)
      ),
      child: Row(
        children: [
          Container(
            child: Text(""),
            height: 40,
            width: 10,
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              "$title",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
              ),
          ),
          Icon(
            Icons.star,
            size: 30,
            color: Colors.deepOrange
            ),

        ],
      ),
    );
  }
  void changeFontSize(double height ){
    sliderHeight = height;
    // insertSize(key: 'size', data: sliderHeight);
    // DataBase.update("${sliderHeight}", "${counterOfTasbe7}");
    emit(ChangeFontSizeState());
  }
  void changeTitle({
    required int index,
  }) {
    titleIndex = index;
    emit(ChangeTitleState());
  }
  void incrementCounterOfTasbe7() {
    if(counterOfTasbe7 == 100000) {
      counterOfTasbe7 = 0;
    }
    counterOfTasbe7 +=1;
    // insertCounter(key: 'counter', data: counterOfTasbe7);
    // DataBase.update("${sliderHeight}", "${counterOfTasbe7}");
    emit(IncrementCounterOfTasbe7());
  }
  void resetCounter() {
    counterOfTasbe7 = 0;
    emit(ResetTasabe7Counter());
  }

  Future<void> readJson({
    required String name
  }) async {
    final String response = await rootBundle.loadString('assets/${name}.json');
    final data = await json.decode(response);
    items = data['data'];
    counters = [];
    backgroundColors = [];
    items.forEach((element) {
      counters.add(element['itemCount']);     
    });
    initColors();
    emit(GetDataState());
  }

  void decrement ({
    required int index,
  }) {
    if(counters[index] == "1") {
      print(index);
      backgroundColors[index] =  Color.fromARGB(255, 255, 181, 159);
      emit(ChangeBackgroundColor());
    }
    if(counters[index] == "0") {
      return;
    }
    counters[index] = "${int.parse(counters[index]) -1}";
    emit(DecrementState());
  }

  
  void initColors() {
    for(int i=0; i< items.length; i++)
      backgroundColors.add(Colors.white);
  }
  // void initSharedPrefrences() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  // }

  // void getSize() {
  //   sliderHeight = sharedPreferences.getDouble('size')!;
  //   emit(GetSizeFromSharedPrefrences());
  // }
  // void insertSize({
  //   required String key,
  //   required double data
  // }) {
  //   sharedPreferences.setDouble(key, data);
  //   emit(InsertSizeToSharedPrefrences());
  // }

  // void getCounter() {
  //   counterOfTasbe7 = sharedPreferences.getInt('counter')!;
  //   emit(GetCounterFromSharedPrefrences());
  // }
  // void insertCounter({
  //   required String key,
  //   required int data
  // }) {
  //   sharedPreferences.setInt(key, data);
  //   emit(InsertCounterToSharedPrefrences());
  // }
  // void createDataBase() async {
  //   // Get a location using getDatabasesPath
  //   var databasesPath = await getDatabasesPath();
  //   String path = databasesPath +  'database.db';
  //   openDatabase(
  //       path,
  //       version: 1,
  //       onCreate: (Database database, int version) async{
  //         print("Create DataBase");
  //         await database.execute(
  //             'CREATE TABLE tasks (id INTEGER PRIMARY KEY, size TEXT, counter TEXT87)'
  //         );
  //       },
  //       onOpen: (database) {
  //         getDataBases(database);
  //       }
  //   ).then((value) {
  //     databaseObject = value;
  //     emit(AppCreateDatabaseState());
  //   });

  //   databaseObject.transaction((txn) async {
  //     txn.rawInsert(
  //         'INSERT INTO tasks(size, counter) VALUES("$size", "$counter")'
  //     ).then((value) {
  //       print("$value inserted ");
  //       emit(AppInsertDatabaseState());
  //       getDataBases(databaseObject);
  //     }).catchError((error) {
  //       print("Error occured while inserting");
  //     });
  //   });

  // }
  // void getDataBases(Database? db) async {
  //   emit(AppGetDatabaseLoadingState());
  //   db!.rawQuery("SELECT * FROM tasks").then((value) {
  //     print("length:     ${value.length}");
  //     value.forEach((element) {
  //       print("here");
  //       if(element['status'] == 'new') {
          
  //       } else if(element['status'] == 'done') {
          
  //       } else {
          
  //       }
  //     });
  //     emit(AppGetDatabaseState());
  //   });
  // }
  // void insertToDB({
  //   required String size,
  //   required String counter,
  // })  {
  //   databaseObject.transaction((txn) async {
  //     txn.rawInsert(
  //         'INSERT INTO tasks(size, counter) VALUES("$size", "$counter")'
  //     ).then((value) {
  //       print("$value inserted ");
  //       emit(AppInsertDatabaseState());
  //       getDataBases(databaseObject);
  //     }).catchError((error) {
  //       print("Error occured while inserting");
  //     });
  //   });
  // }
  // void updateDatabase({
  //   required String status,
  //   required int id
  //   }) {
  //   databaseObject.rawUpdate(
  //     'UPDATE tasks SET status = ? WHERE id = ?',
  //     ['$status', id],
  //   ).then((value)
  //   {
  //     getDataBases(databaseObject);
  //     emit(AppUpdateDatabaseState());
  //   });
  //     }

}