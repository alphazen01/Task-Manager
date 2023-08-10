

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/style/style.dart';

ListView TaskList(TaskItems){
  return ListView.builder(
    itemCount: TaskItems.length,
    itemBuilder: (context,index){
      return 
      Card(
        child: itemSizedBox(
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TaskItems[index]["title"],
                style: Head6Text(colorDarkBlue),
              ),
              Text(
                TaskItems[index]["description"],
                style: Head6Text(colorLightGray),
              ),
              
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        SizedBox(
                        width: 50,
                        height: 10,
                        child: ElevatedButton(
                          onPressed: (){}, 
                          child: Icon(Icons.update)
                          ),
                          
                        ),
                        SizedBox(width: 10,),
                        SizedBox(
                        width: 50,
                        height: 10,
                        child: ElevatedButton(
                          onPressed: (){}, 
                          child: Icon(Icons.delete)
                          ),
                          
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }
    );
}