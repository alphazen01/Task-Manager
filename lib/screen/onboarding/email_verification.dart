import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:task/api/api_client.dart';

import '../../style/style.dart';
import '../../utils/widgets/buttons/submit_button.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {

  Map<String,String> FormValues={"email":""};
  bool Loading = false;
  InputOnchange(MapKey,Textvalue){
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }
   FormOnSubmit()async{
    if (FormValues["email"]!.length==0) {
      ErrorToast("Email required");
    } else {
      setState(() {
        Loading=true;
      });
      bool res=await email_verification(FormValues["email"]);
      if (res==true) {
        Navigator.pushNamed(context, "/pinVerification");
      } else {
        setState(() {
        Loading=false;
      });
      }
    }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Loading?Center(child: CircularProgressIndicator()): Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: paddingX),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Text(
              "Your Email Address",
              style: Head1Text(colorDarkBlue),
              ),
              SizedBox(height: 1,),
               Text(
              "A 6 digit varification pin will send to your email address",
              style: Head6Text(colorLightGray),
              ),
              SizedBox(height: 20,),
              TextFormField(
                onChanged: (Textvalue) {
                  InputOnchange("email", Textvalue);
                },
                decoration: AppInputDecoration("Email Address"),
              ),
              SizedBox(height: 20,),
             
              SizedBox(height: 20,),
              SubmitButton(
              title: "Next",
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

