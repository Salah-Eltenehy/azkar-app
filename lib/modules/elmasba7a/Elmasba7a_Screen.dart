import 'package:azkar/layout/cubit/AppCubit.dart';
import 'package:azkar/layout/cubit/AppStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ElmasbahaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AzkarCubit, AzkarStates>( 
      listener: ((context, state) {}),
      builder: (context, state) { 
        var cubit = AzkarCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                  child: Text(""),
                  ),
                  IconButton(
                    onPressed: () {
                      cubit.resetCounter();
                    }, 
                    icon: Icon(Icons.refresh)),
                    SizedBox(
                      width: 40,
                    ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: 150,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 36, 131, 134),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Directionality(
                                  textDirection: TextDirection.rtl, 
                                  child: Text(
                                    "${cubit.counterOfTasbe7}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 30
                                    ),
                                    ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            InkWell(
                              onTap: () {
                                cubit.incrementCounterOfTasbe7();
                              },
                              child: CircleAvatar(
                                backgroundColor: Color.fromARGB(255, 206, 255, 255),
                                radius: 40,
                              )
                              ),
                          ],
                        ),
                      ),
                      width: 200,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      
                    ),
                  ],
                ),
        ),
            ],
          ),
      );}
    );
  }
  

}