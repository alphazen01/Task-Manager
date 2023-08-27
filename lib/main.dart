import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/check/profile_update.dart';
import 'package:task/controller/auth_controller.dart';
import 'package:task/screen/onboarding/email_verification.dart';
import 'package:task/screen/onboarding/pin_varification.dart';
import 'package:task/screen/onboarding/registaraion_screen.dart';
import 'package:task/screen/onboarding/set_password.dart';
import 'package:task/screen/onboarding/sign_up.dart';
import 'package:task/screen/onboarding/splash_screen.dart';
import 'package:task/screen/task/home_screen.dart';
import 'package:task/screen/task/task_create_screen.dart';

import 'package:task/utils/utility/utility.dart';

import 'component/new_task_list.dart';
import 'screen/onboarding/login_screen.dart';



void main()async {
WidgetsFlutterBinding.ensureInitialized();
 String? token= await readUserData('token');

if (token==null) {
  runApp( MyApp('/login'));
}else{
runApp( MyApp("/"));
}



  
}

class MyApp extends StatelessWidget {
  final String firstRoute;
   MyApp(this.firstRoute);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
         ChangeNotifierProvider<AuthController>(
      create: (BuildContext context){
        return AuthController(
          
        );
      }
         ),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task manager',
        theme: ThemeData(
          scaffoldBackgroundColor:Color(0xffC4C4C4),
          
          primarySwatch: Colors.blue,
        ),
        // home:LoginScreen(),
        initialRoute:firstRoute,
        routes: {
          "/":((context) => HomeScreen()),
          "/login":((context) => LoginScreen()),
          "/signUp":((context) => SignUpScreen()),
          "/pinVerification":((context) => PinVarificationScreen()),
          "/emailVerification":((context) => EmailVerification()),
          "/newTaskList":((context) => NewTaskList()),
          "/setPassword":((context) => SetPassword()),
          "/taskCreate":((context) => TaskCreateScreen()),
          // "/updateProfile":((context) =>ProfileUpdateScreen()),
          
        },
      ),
    );
  }
}

