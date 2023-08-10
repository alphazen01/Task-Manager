import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:task/screen/onboarding/login_screen.dart';

import '../../style/style.dart';


class SplshScreen extends StatefulWidget {
  const SplshScreen({Key? key}) : super(key: key);

  @override
  State<SplshScreen> createState() => _SplshScreenState();
}

class _SplshScreenState extends State<SplshScreen> {
    @override
  void initState() {
    Timer(
      Duration(seconds: 5),
      ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen())));
      
 
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Text("Splash Screen"),
            CircularProgressIndicator(
                  color: colorGreen
                )
            
          ],
        ),
      ),
    );
  }
}