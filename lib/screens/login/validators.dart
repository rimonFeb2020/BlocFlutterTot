import 'dart:async';

mixin Validators{
 var emailValidator = StreamTransformer<String,String>.fromHandlers(
   handleData: (email,sink){
     if(email.contains("@")){
       sink.add(email);
     }else{
       sink.addError("email is not validate");
     }
   }
 );

 var passwordValidator = StreamTransformer<String,String>.fromHandlers(
     handleData: (password,sink){
       if(password.length>4){
         sink.add(password);
       }else{
         sink.addError("password lengnth should be greater than 4 char.");
       }
     }
 );

}