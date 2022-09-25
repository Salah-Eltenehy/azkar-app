import 'package:azkar/layout/cubit/AppCubit.dart';
import 'package:azkar/layout/cubit/AppStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return BlocConsumer<AzkarCubit, AzkarStates> (
      listener: ((context, state) {}),
      builder: (context, state) {
        var cubit = AzkarCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "تغير حجم الخط",
                  style: TextStyle(
                    fontSize: cubit.sliderHeight,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Text(
                      "${cubit.sliderHeight.round()}",
                      style: TextStyle(
                      fontSize: cubit.sliderHeight,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  ),
                Slider(
                    value: cubit.sliderHeight, 
                    min:10,
                    max: 40,
                    onChanged: (value) { 
                      cubit.changeFontSize(value);
                    })
              ],
            ),
          ),
        );
      },
    );
  }
}