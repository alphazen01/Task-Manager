import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:task/screen/onboarding/login_screen.dart';

import '../controller/auth_controller.dart';
import '../models/set_pass_model.dart';
import '../style/style.dart';
import '../utils/utility/utility.dart';
import '../utils/widgets/text_field/custom_textfield.dart';

class CheckSet extends StatefulWidget {
  const CheckSet({Key? key}) : super(key: key);

  @override
  State<CheckSet> createState() => _CheckSetState();
}

class _CheckSetState extends State<CheckSet> {

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
 Map<String,String>FormValues={"email":"","OTP":"","password":"","cpassword":"",};
InputOnchange(MapKey,Textvalue){
    setState(() {
      FormValues.update(MapKey, (value) => Textvalue);
    });
  }
  Widget build(BuildContext context) {
 TextEditingController cpasswordController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

  



    return Scaffold(
      appBar: AppBar(
        title: Text("Check set password Screen"),
      ),
      body: Consumer<AuthController>(
        builder: (context, pro, child) {
          return pro.isLoading?Center(
            child: CircularProgressIndicator(
              color: Colors.redAccent,
             ),
          ): Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingX),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                  "Get Started With",
                  style: Head1Text(colorDarkBlue),
                  ),
                  SizedBox(height: 1,),
                   Text(
                  "Learn With Rabbil Hasan",
                  style: Head6Text(colorLightGray),
                  ),
                  SizedBox(height: 20,),
                   CustomTextField(
                    controller: passwordController,
                    name: "Password",
                      ),
                      SizedBox(height: 20,),
                   CustomTextField(
                    controller: cpasswordController,
                    name: "confirm Password",
                      ),

                    SizedBox(height: 20,),
                   
                    ElevatedButton(
                    style: AppButtonStyle(
                      
                    ),
                  onPressed: ()async{
                    if (passwordController.text.isEmpty) {
                   Fluttertoast.showToast(msg: "Enter your password");
                      } else if (cpasswordController.text.isEmpty) {
                      Fluttertoast.showToast(msg: "Enter your cpassword");
                      }
                      else {
                       
                    SetPassword setPassword= SetPassword( 
                    
                    password: passwordController.text
                    );
                    pro.setPassword(setPassword).then((status) {
                      if (status.isSuccess) {
                       Fluttertoast.showToast(msg: "All went well",);
                      print("Success Login");
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
                      
                    } else {
                      Fluttertoast.showToast(msg: "Something Wrong",);
                      print("object");
                    }
                    });
                      }
                      },
                  child: SuccessButtonChild("Submit",)
                  ),
                 
                   
                  ],
                ),
              ),
             ),
          );
        },
       
      ),
    );
  }
}