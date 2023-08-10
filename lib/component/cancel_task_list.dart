import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:task/component/task_listview.dart';

import '../api/api_client.dart';

class CancelTaskList extends StatefulWidget {
  const CancelTaskList({Key? key}) : super(key: key);

  @override
  State<CancelTaskList> createState() => _CancelTaskListState();
}

class _CancelTaskListState extends State<CancelTaskList> {
   List TaskItems=[];
  bool loading = true;

@override
  void initState() {
    // TODO: implement initState
    callData();
    super.initState();
  }

  callData()async{
  var data= await taskListRequest("Canceled");
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