import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task/api/api_client.dart';
import 'package:task/check/check_set.dart';
import 'package:task/utils/utility/utility.dart';

import '../../style/style.dart';
import '../../utils/widgets/buttons/submit_button.dart';


class PinVarificationScreen extends StatefulWidget {
  const PinVarificationScreen({Key? key}) : super(key: key);

  @override
  State<PinVarificationScreen> createState() => _PinVarificationScreenState();
}

class _PinVarificationScreenState extends State<PinVarificationScreen> {

 Map<String,String> FormValues={"otp":""};
  bool Loading = false;
  InputOnchange(MapKey,Textvalue){
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }
   FormOnSubmit()async{
    if (FormValues["otp"]!.length==0) {
      ErrorToast("PIN required");
    } else {
      setState(() {
        Loading=true;
      });
      String?emailAddress=await readUserData("EmailVerification");
      bool res=await verifyOtp(emailAddress, FormValues["otp"]);
      if (res==true) {
        Navigator.pushNamed(context, "/setPassword");
        // Navigator.push(context, MaterialPageRoute(builder: (_)=>CheckSet()));
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
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
            "Pin Verification",
            style: Head1Text(colorDarkBlue),
          ),
          SizedBox(height: 10,),
          Text(
            "A 6 digit verification pin will send to your email address",
            style: Head6Text(colorDarkBlue),
          ),
          SizedBox(height: 20,),
          PinCodeTextField(
          appContext: context, 
          length: 6,
          pinTheme: AppOtpStyle(),
          animationType: AnimationType.fade,
          animationDuration: Duration(milliseconds: 100),
          enableActiveFill: true,
          onCompleted: (v){

          }, 
          onChanged: (Textvalue){
            InputOnchange("otp", Textvalue);
          }
          ),
          SubmitButton(
          title: "Verify", 
          onTap: (){
            FormOnSubmit();
          }
          )
          ],
        ),
      ),
    );
  }
}