
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:task/utils/utility/utility.dart';

import '../style/style.dart';


var baseUrl = "https://task.teamrabbil.com/api/v1/";
var requestHeader ={
  "Content-Type":"aplication/json",
  
  };

// Map<String,String>FormValues={"email":"","firstName":"","lastName":"","mobile":"","password":"","photo":"",};
Future<bool>loginRequest(FormValues)async{
  var Url = Uri.parse("${baseUrl}/login");
  // var Url = Uri.parse("http://mvs.bslmeiyu.com/api/v1/auth/login");
  var PostBody = json.encode(FormValues);

  var response = await http.post(Url,headers: requestHeader,body: PostBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if (resultCode==200 && resultBody['status']=='success') {
    
    SuccessToast("Request Success");
    print("status code is $resultCode");
    await writeUserData(resultBody);
    return true;
  } 
  else {
    ErrorToast("Request fail try again");
      return false;
  }

}


Future<bool>registration(FormValues)async{
  var Url = Uri.parse("${baseUrl}/registration");
  var PostBody = json.encode(FormValues);

  var response = await http.post(Url,headers: requestHeader,body: PostBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if (resultCode==200 && resultBody["status"]=="success") {

    SuccessToast("Request Success");
    await writeUserData(resultBody);
    return true;
  } else {
    ErrorToast("Request fail try again");
  }
  return false;
}






Future<bool>email_verification(Email)async{
  var Url = Uri.parse("${baseUrl}/RecoverVerifyEmail/${Email}");

  var response = await http.get(Url,headers: requestHeader);


  var resultCode =response.statusCode;

  var resultBody = json.decode(response.body);

  if (resultCode==200 && resultBody["status"]=="success") {
    await writeEmailVerification(Email);
    SuccessToast("Request Success");
    return true;
  } else {
    ErrorToast("Request fail try again");
   return false;
  }
  
}



Future<bool>verifyOtp(Email,OTP)async{
  var Url = Uri.parse("${baseUrl}/RecoverVerifyOTP/${Email}/${OTP}");

  var response = await http.get(Url,headers: requestHeader);


  var resultCode =response.statusCode;

  var resultBody = json.decode(response.body);

  if (resultCode==200 && resultBody["status"]=="success") {
    await writeOTPVerification(OTP);
    SuccessToast("Request Success");
    return true;
  } else {
    ErrorToast("Request fail try again");
     return false;
  }
  
}

Future<bool>setNewPassword(FormValues)async{
  var Url = Uri.parse("${baseUrl}/RecoverResetPass");
  
  var PostBody = json.encode(FormValues);
  // var PostBody = jsonEncode(FormValues);

  var response = await http.post(Url,headers: requestHeader,body: PostBody);
  
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if (resultCode==200 && resultBody["status"]=="success") {

    SuccessToast("Request Success");
    return true;
  } else {
    ErrorToast("Request fail try again");
    return false;
  }
}

Future<List>taskListRequest(Status)async{
   var Url = Uri.parse("${baseUrl}/ListTaskByStatus/${Status}");
   String? token = await readUserData("token");
   var requestHeaderWithToken ={
  "Content-Type":"aplication/json","token":'$token'};
  var response = await http.get(Url,headers: requestHeaderWithToken,);
   var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
   if (resultCode==200 && resultBody["status"]=="success") {
    SuccessToast("Request Success");
    print(resultBody);
    return resultBody["data"];
  } else {
    print(resultBody);
    ErrorToast("Request fail try again");
    return [];
  }
}

Future<bool>taskCreateRequest(FormValues)async{
   var Url = Uri.parse("${baseUrl}/createTask");
   String? token = await readUserData("token");
   var requestHeaderWithToken ={
  "Content-Type":"aplication/json","token":'$token'};
  var PostBody = jsonEncode(FormValues);
  var response = await http.post(Url,headers: requestHeaderWithToken,body: PostBody);
   var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);
   if (resultCode==200 && resultBody["status"]=="success") {
    SuccessToast("Request Success");
    print(resultBody);
    return true;
  } else {
    print(resultBody);
    ErrorToast("Request fail try again");
    return false;
  }
}

Future<bool>profileUpdate(FormValues,id )async{
  var Url = Uri.parse("${baseUrl}/update/${id}");
  String? token = await readUserData("token");
   var requestHeaderWithToken ={
  "Content-Type":"aplication/json","token":'$token'};
  var PostBody = json.encode(FormValues);

  var response = await http.post(Url,headers:requestHeaderWithToken ,body: PostBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if (resultCode==200 && resultBody["status"]=="success") {

    SuccessToast("Request Success");
    await writeUserData(resultBody);
    return true;
  } else {
    ErrorToast("Request fail try again");
  }
  return false;
}
