import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:task/api/api_client.dart';
import 'package:task/utils/utility/utility.dart';

import '../../style/style.dart';
import '../../utils/widgets/buttons/submit_button.dart';

class SetPassword extends StatefulWidget {
  const SetPassword({Key? key}) : super(key: key);

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  Map<String,String>FormValues={"email":"","OTP":"","password":"","cpassword":"",};
  bool Loading = false;

  @override
  initState(){
    callStoreData();
    super.initState();
  }

  callStoreData()async{
   String?OTP=await readUserData("OTPVerification");
   String?Email=await readUserData("EmailVerification");
    InputOnchange("email", Email);
    InputOnchange("OTP", OTP);
  }

InputOnchange(MapKey,Textvalue){
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }
   FormOnSubmit()async{
    if (FormValues["password"]!.length==0) {
      ErrorToast("password required");
    }else if(FormValues["password"]!=FormValues["cpassword"]){
      ErrorToast("confirm password should be same");
    }
     else {
      setState(() {
        Loading=true;
      });
      bool res=await setNewPassword(FormValues);
      if (res==true) {
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: paddingX),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Text(
              "Set Password",
              style: Head1Text(colorDarkBlue),
              ),
              SizedBox(height: 1,),
               Text(
              "Minimum length 8 character password required ",
              style: Head6Text(colorLightGray),
              ),
              SizedBox(height: 20,),
            
              TextFormField(
                onChanged: (Textvalue) {
                  InputOnchange("password", Textvalue);
                },
                decoration: AppInputDecoration("Password"),
              ),
              SizedBox(height: 20,),
              TextFormField(
                onChanged: (Textvalue) {
                  InputOnchange("cpassword", Textvalue);
                },
                decoration: AppInputDecoration("Confirm Password"),
              ),
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

