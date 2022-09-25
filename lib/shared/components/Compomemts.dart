import 'package:azkar/layout/cubit/AppCubit.dart';
import 'package:flutter/material.dart';

Widget buildAzkarItem({
  required  counter,
  required item,
  required index,
  required context,
}) => InkWell(
  onTap: () {
    AzkarCubit.get(context).decrement(index: index);
  },
  child:   Container(
                width: double.infinity,
                color: AzkarCubit.get(context).backgroundColors[index],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [  
                    Row(
                      children: [
                        Expanded(
                          child: Text("")
                          ),
                        Text(
                          "${counter}",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                      ],
                    ),
                    Text(
                      "${item['data']}",
                      style: TextStyle(
                        fontSize: AzkarCubit.get(context).sliderHeight,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    Text(
                      "${item['additional']}",
                      style: TextStyle(
                        fontSize: AzkarCubit.get(context).sliderHeight-5,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 158, 157, 157)
                      ),
                      ),
                  ],
                ),
              ),
);
