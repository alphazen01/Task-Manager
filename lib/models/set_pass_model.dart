

class SetPassword{

String? password;



SetPassword({
   this.password,

});


Map<String, dynamic>toJson(){
  final Map<String,dynamic>data = Map<String,dynamic>();


  data["password"] = this.password;

  return data;
}






}
