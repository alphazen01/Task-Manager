
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/check/check_view.dart';

import 'package:task/controller/auth_controller.dart';
import 'package:task/models/login_model.dart';
import '../../style/style.dart';
import '../../utils/widgets/text_field/custom_textfield.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

  



    return Scaffold(
      appBar: AppBar(
        title: Text("Log in Screen"),
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
                    controller: emailController,
                    name: "Email",
                      ),
                      SizedBox(height: 20,),
                   CustomTextField(
                    controller: passwordController,
                    name: "Password",
                      ),

                    SizedBox(height: 20,),
                   
                    ElevatedButton(
                    style: AppButtonStyle(
                      
                    ),
                  onPressed: ()async{
                    if (emailController.text.isEmpty) {
                   Fluttertoast.showToast(msg: "Enter your email");
                      } else if (passwordController.text.isEmpty) {
                      Fluttertoast.showToast(msg: "Enter your password");
                      }
                      else {
                    LoginModel loginModel= LoginModel( 
                    email: emailController.text, 
                    password: passwordController.text
                    );
                    pro.cLog(loginModel).then((status) {
                      if (status.isSuccess) {
                       Fluttertoast.showToast(msg: "All went well",);
                      print("Success Login");
                      Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
                      
                    } else {
                      Fluttertoast.showToast(msg: "Something Wrong",);
                      print("object");
                    }
                    });
                      }
                      },
                  child: SuccessButtonChild("Submit",)
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, "/emailVerification");
                          },
                        child: Text(
                          "Forgot password?",
                          style: Head7Text(colorLightGray),
                          ),
                        ),
                        SizedBox(height: 15,),
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, "/signUp");
                          },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: Head7Text(colorDarkBlue),
                              ),
                              Text(
                              "SignUp",
                              style: Head7Text(colorGreen),
                              ),
                          ],
                        ),
                        ),
                      ],
                    ),
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