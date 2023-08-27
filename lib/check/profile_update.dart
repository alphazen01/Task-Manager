// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:task/api/api_client.dart';
// import 'package:task/screen/task/home_screen.dart';
// import 'package:task/utils/widgets/text_field/custom_textfield.dart';

// import '../style/style.dart';
// import '../utils/utility/utility.dart';
// import '../utils/widgets/buttons/submit_button.dart';

// class ProfileUpdateScreen extends StatefulWidget {
//   final Map profileItem;
//    ProfileUpdateScreen(this.profileItem); 

//   @override
//   State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
// }

// class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  

//   Map<String,String>FormValues={"email":"","firstName":"","lastName":"","mobile":"","password":"","photo":"",};
//  bool isLoading = false;
//  @override
//   void initState() {
//     setState(() {
//       FormValues.update("firstName", (value) => widget.profileItem["firstName"]);
//     FormValues.update("lastName", (value) => widget.profileItem["lastName"]);
//     });
//     super.initState();
//   }
 
//  InputChang(Mapkey,Textvalue){
//   setState(() {
//     FormValues.update(Mapkey, (value) => Textvalue);
//   });
//  }
// FormOnSubmit()async{
//  if  (FormValues["firstName"]!.length==0){
//     ErrorToast("FirstName required");
//   }
//   else if  (FormValues["lastName"]!.length==0){
//     ErrorToast("LastName required");
//   }
//   else{
//   setState(() {
//     isLoading=true;
//   });
//    bool response=  await profileUpdate(FormValues,widget.profileItem);
//    if (response==true) {
//     Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeScreen()));
//      print("object");
//    } else {
//      setState(() {
//     isLoading=false;
//   });
//    }
   
//   }
// }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Profile Update"
//         ),
//       ),

//       body:Column(
//         children: [
//           //  TextFormField(
//           //       onChanged: (TextValue){
//           //         InputChang("email", TextValue);
//           //       },
//           //       decoration: AppInputDecoration("Email Address"),
//           //     ),
//               SizedBox(height: 20,),
//               TextFormField(
//                 initialValue: FormValues["firstName"],
//                 onChanged: (TextValue){
//                   InputChang("firstName", TextValue);
//                 },
//                 decoration: AppInputDecoration("FirstName"),
//               ),
//               SizedBox(height: 20,),
//               TextFormField(
//                 initialValue: FormValues["lastName"],
//                 onChanged: (TextValue){
//                   InputChang("lastName", TextValue);
//                 },
//                 decoration: AppInputDecoration("LastName"),
//               ),
//               SizedBox(height: 20,),
//               // TextFormField(
//               //   onChanged: (TextValue){
//               //     InputChang("mobile", TextValue);
//               //   },
//               //   decoration: AppInputDecoration("Mobile"),
//               // ),
              
//               // SizedBox(height: 20,),
//               // TextFormField(
//               //   onChanged: (TextValue){
//               //     InputChang("password", TextValue);
//               //   },
//               //   decoration: AppInputDecoration("Password"),
//               // ),
//               // SizedBox(height: 20,),
//               // TextFormField(
//               //   decoration: AppInputDecoration("Confirm Password"),
//               // ),
//               SizedBox(height: 20,),
//               SubmitButton(
//               title: "Update",
//               onTap: (){
//                 FormOnSubmit();
//               },
//               )
          
//         ],
//       ) ,
//     );
//   }
// }





