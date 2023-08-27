import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/check/profile_update.dart';
import 'package:task/component/bottom_nav.dart';
import 'package:task/component/cancel_task_list.dart';
import 'package:task/component/complete_task_list.dart';
import 'package:task/component/new_task_list.dart';
import 'package:task/component/progress_task_list.dart';
import 'package:task/component/task_app_bar.dart';

import '../../style/style.dart';
import '../../utils/utility/utility.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int tabIndex=0;
  onItemTapped(int index){
    setState(() {
     tabIndex=index;
    });
  }
  final widgetOptions=[
    NewTaskList(),
    ProgressTaskList(),
    CompleteTaskList(),
    CancelTaskList()
  ];
   void initState() {
    // TODO: implement initState
    readProfileData();
    super.initState();
  }
   Map<String,String>getData={"email":"","firstName":"","lastName":"","mobile":"","password":""};
   readProfileData()async{
  String? email = await readUserData("email");
  String? firstName = await readUserData("firstName");
  String? lastName = await readUserData("lastName");
  String? mobile = await readUserData("mobile");
  String? password = await readUserData("password");
  setState(() {
    getData={"email":"$email","firstName":"$firstName","lastName":"$lastName","mobile":"$mobile","password":"$password"};
  });
}


  // goToUpDate(context, profileItem){
  //  Navigator.push(context, 
  //  MaterialPageRoute(builder: (_)=>
  //  ProfileUpdateScreen(profileItem)
  //  )
  //  );
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: taskAppBar(context,getData),
      appBar: AppBar(
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
          GestureDetector(
            onTap: (){
              // goToUpDate(context,getData);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${getData["firstName"]} ${getData["lastName"]} ",style: Head7Text(colorWhite),),
                Text("${getData["email"]}",style: Head7Text(colorWhite),),
              ],
            ),
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
  ),
      body: widgetOptions.elementAt(tabIndex),
      bottomNavigationBar: appBottomNav(tabIndex, onItemTapped),
    );
  }
}