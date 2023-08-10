import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:task/component/task_listview.dart';

import '../api/api_client.dart';

class CompleteTaskList extends StatefulWidget {
  const CompleteTaskList({Key? key}) : super(key: key);

  @override
  State<CompleteTaskList> createState() => _CompleteTaskListState();
}

class _CompleteTaskListState extends State<CompleteTaskList> {
   List TaskItems=[];
  bool loading = true;

@override
  void initState() {
    // TODO: implement initState
    callData();
    super.initState();
  }

  callData()async{
  var data= await taskListRequest("Completed");
   setState(() {loading=false; });
   TaskItems=data;
  }

  @override
  Widget build(BuildContext context) {
    return loading?Center(child: CircularProgressIndicator()):RefreshIndicator( 
      onRefresh: ()async{
        await callData();
      },
      child: TaskList(TaskItems)
      );
  }
}