import 'package:flutter/material.dart';
import 'package:task/style/style.dart';
import 'package:task/utils/utility/utility.dart';

AppBar taskAppBar(context,getData){
  return AppBar(
    backgroundColor: colorGreen,
    flexibleSpace: Container(
      margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 24,
            child: ClipOval(
              // child: Image.memory(showBase64Image("Base64String")),
            ),
          ),
          SizedBox(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${getData["firstName"]} ${getData["lastName"]} ",style: Head7Text(colorWhite),),
              Text("${getData["email"]}",style: Head7Text(colorWhite),),
            ],
          ),
        ],
      ),
    ),
    actions: [
      IconButton(
      onPressed: (){
        Navigator.pushNamed(context, "/taskCreate");
      }, 
      icon: Icon(Icons.add_circle_outline)
      ),
      IconButton(
      onPressed: ()async{
        await RemoveToken();
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
      }, 
      icon: Icon(Icons.logout)
      ),
    ],
  );
}