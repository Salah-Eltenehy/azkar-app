import 'package:azkar/layout/cubit/AppCubit.dart';
import 'package:azkar/layout/cubit/AppStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBarScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AzkarCubit, AzkarStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AzkarCubit.get(context);
        return Drawer(
          backgroundColor: Color.fromARGB(255, 255, 209, 195),
          // color: Colors.deepOrange,
        child: ListView.separated(
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              cubit.changeTitle(index: index);
              cubit.readJson(name: "$index");
            },
            child: cubit.getNavName(cubit.titles[index]),
            ), 
          separatorBuilder: (context, index) => Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey[300],
          ), 
          itemCount: cubit.titles.length),
      );
      });
  }
}