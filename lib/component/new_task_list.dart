

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:task/api/api_client.dart';
import 'package:task/component/task_listview.dart';
import 'package:task/utils/utility/utility.dart';

import '../style/style.dart';

class NewTaskList extends StatefulWidget {
  const NewTaskList({Key? key}) : super(key: key);

  @override
  State<NewTaskList> createState() => _NewTaskListState();
}

class _NewTaskListState extends State<NewTaskList> {
//For read data testing perpose//

  List TaskItems=[];
  bool loading = true;

@override
  void initState() {
    // TODO: implement initState
    callData();
    super.initState();
  }

  callData()async{
  var data= await taskListRequest("new");
   setState(() {loading=false; });
   TaskItems=data;
  }





 



  @override
  Widget build(BuildContext context) {
    return loading?Center(child: CircularProgressIndicator()):
    RefreshIndicator( 
      onRefresh: ()async{
        await callData();
      },
      child: TaskList(TaskItems)
      );
  }
}


