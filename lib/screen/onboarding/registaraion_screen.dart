// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:task/screen/onboarding/login_screen.dart';


// import '../../api/api_client.dart';
// import '../../style/style.dart';
// import '../../utils/widgets/buttons/submit_button.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   @override
//   Widget build(BuildContext context) {

//  Map<String,String>FormValues={"email":"","firstName":"","lastName":"","mobile":"","password":"","photo":"",};
//  bool isLoading = false;

// InputChang(MapKey,TextValue){
//   setState(() {
//     FormValues.update(MapKey, (value) => TextValue);
//   });
// }
// FormOnSubmit()async{
//   if (FormValues["email"]!.length==0) {
//     ErrorToast("Email required");
//   } else if  (FormValues["password"]!.length==0){
//     ErrorToast("Password required");
//   }
//   else if  (FormValues["firstName"]!.length==0){
//     ErrorToast("FirstName required");
//   }
//   else if  (FormValues["lastName"]!.length==0){
//     ErrorToast("LastName required");
//   }
//   else{
//   setState(() {
//     isLoading=true;
//   });
//    bool response=  await loginRequest(FormValues);
//    if (response==true) {
//     Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
//      print("object");
//    } else {
//      setState(() {
//     isLoading=false;
//   });
//    }
   
//   }
// }






    
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: paddingX),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                Text(
//               "Join With Us",
//               style: Head1Text(colorDarkBlue),
//               ),
//               SizedBox(height: 1,),
//                Text(
//               "Learn With Rabbil Hasan",
//               style: Head6Text(colorLightGray),
//               ),
//               SizedBox(height: 20,),
//               TextFormField(
//                 onChanged: (TextValue){
//                   InputChang("email", TextValue);
//                 },
//                 decoration: AppInputDecoration("Email Address"),
//               ),
//               SizedBox(height: 20,),
//               TextFormField(
//                 onChanged: (TextValue){
//                   InputChang("firstName", TextValue);
//                 },
//                 decoration: AppInputDecoration("FirstName"),
//               ),
//               SizedBox(height: 20,),
//               TextFormField(
//                 onChanged: (TextValue){
//                   InputChang("lastName", TextValue);
//                 },
//                 decoration: AppInputDecoration("LastName"),
//               ),
//               SizedBox(height: 20,),
//               TextFormField(
//                 onChanged: (TextValue){
//                   InputChang("mobile", TextValue);
//                 },
//                 decoration: AppInputDecoration("Mobile"),
//               ),
              
//               SizedBox(height: 20,),
//               TextFormField(
//                 onChanged: (TextValue){
//                   InputChang("password", TextValue);
//                 },
//                 decoration: AppInputDecoration("Password"),
//               ),
//               SizedBox(height: 20,),
//               // TextFormField(
//               //   decoration: AppInputDecoration("Confirm Password"),
//               // ),
//               SizedBox(height: 20,),
//               SubmitButton(
//               title: "Registration",
//               onTap: (){
//                 FormOnSubmit();
//               },
//               )
          
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

