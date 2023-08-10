import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:task/component/bottom_nav.dart';
import 'package:task/component/cancel_task_list.dart';
import 'package:task/component/complete_task_list.dart';
import 'package:task/component/new_task_list.dart';
import 'package:task/component/progress_task_list.dart';
import 'package:task/component/task_app_bar.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: taskAppBar(context,getData),
      body: widgetOptions.elementAt(tabIndex),
      bottomNavigationBar: appBottomNav(tabIndex, onItemTapped),
    );
  }
}