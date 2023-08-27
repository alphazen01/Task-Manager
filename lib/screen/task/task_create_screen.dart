

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:task/api/api_client.dart';
import 'package:task/style/style.dart';

import '../../utils/widgets/buttons/submit_button.dart';

class TaskCreateScreen extends StatefulWidget {
  const TaskCreateScreen({Key? key}) : super(key: key);

  @override
  State<TaskCreateScreen> createState() => _TaskCreateScreenState();
}

class _TaskCreateScreenState extends State<TaskCreateScreen> {


  Map<String,String>FormValues={"title":"","description":"","status":"New",};

  bool loading=false;
  InputOnChange(Mapkey,Textvalue){
    setState(() {
      FormValues.update(Mapkey, (value) => Textvalue);

    });
  }

   FormOnSubmit()async{
    if (FormValues["title"]!.length==0) {
      ErrorToast("Title required");
    }else if(FormValues["description"]!.length==0) {
      ErrorToast("Description Required");
    }
     else {
      setState(() {
        loading=true;
      });
      bool res=await taskCreateRequest(FormValues);
      if (res==true) {
        Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
      } else {
        setState(() {
        loading=false;
      });
      }
    }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorGreen,
        title: Text("Create Task New"),
      ),
       body:loading?Center(child: CircularProgressIndicator()): Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: paddingX),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Text(
              "Add New Task",
              style: Head1Text(colorDarkBlue),
              ),
              
              SizedBox(height: 20,),
              TextFormField(
                onChanged: (Textvalue) {
                  InputOnChange("title", Textvalue);
                },
                decoration: AppInputDecoration("TaskName"),
              ),
              SizedBox(height: 20,),
              TextFormField(
                onChanged: (Textvalue) {
                  InputOnChange("description", Textvalue);
                },
                decoration: AppInputDecoration("Info"),
                maxLines: 10,
              ),
              SizedBox(height: 20,),
              SubmitButton(
              title: "Create",
              onTap: (){
                FormOnSubmit();
              },
              )
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}