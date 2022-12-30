import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waitech/riverpod/signup_riverpod.dart';

import '../../riverpod/riverpod_management.dart';

class SignUpPage extends ConsumerStatefulWidget{
  static const String routeName = '/sign-up';


  static Route route() {
    return MaterialPageRoute(
        builder: (_) => SignUpPage(),
        settings: const RouteSettings(name: routeName));
  }
  const SignUpPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpPageState();

}
class _SignUpPageState extends ConsumerState<SignUpPage>{

  bool isChecked=false;
  bool successRegister=false;
  bool onSubmit = false;

  bool _obscureText=false;



  @override
  Widget build(BuildContext context){
    final _againPassword=TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children:[
               SizedBox(height: 20),


              SizedBox(height: 30),

              Text(
                  'Üye Ol',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 42,
                  color: Colors.black54,
                ),
              ),

              SizedBox(height:30),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(

                    color: Colors.white,
                    border:Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left:20.0),
                    child: TextField(
                      controller:ref.read(signUpRiverpod).name ,
                      decoration: InputDecoration(
                        border : InputBorder.none,
                        hintText: 'Ad ve Soyad',
                      ),
                    ),
                  ),
                ),

              ),

              SizedBox(height: 10),

              //Password
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(

                    color: Colors.white,
                    border:Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left:20.0),
                    child: TextField(
                      controller:ref.read(signUpRiverpod).email ,
                      decoration: InputDecoration(
                        border : InputBorder.none,
                        hintText: "Email",
                      ),
                    ),
                  ),
                ),

              ),

              SizedBox(height: 10),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(

                    color: Colors.white,
                    border:Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left:20.0),
                    child: TextField(
                      controller:ref.read(signUpRiverpod).password ,
                      decoration: InputDecoration(
                        border : InputBorder.none,
                        hintText: "Şifre",
                        suffix:IconButton(
                          iconSize: 25,
                          onPressed:(){ setState(() {
                            _obscureText=!_obscureText;
                          });},
                          icon:_obscureText ? const Icon(Icons.visibility): const Icon(Icons.visibility_off),
                        ),
                      ),
                      obscureText: _obscureText,
                    ),
                  ),
                ),

              ),


               SizedBox(height: 10),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(

                    color: Colors.white,
                    border:Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child:  Padding(
                    padding: EdgeInsets.only(left:20.0),
                    child: TextField(
                      controller: _againPassword,
                      /*onChanged: (value){
                        value=ref.watch(signUpRiverpod).password!.text;
                        _password=false;
                        notSubmitted=true;
                      },*/
                      decoration: InputDecoration(
                        border : InputBorder.none,
                        hintText: "Tekrar Şifre",
                      ),
                      obscureText: true,
                    ),
                  ),
                ),

              ),
              SizedBox(height: 10),

              Padding(padding: EdgeInsets.symmetric(horizontal: 19,vertical: 15),
                child: Row(
                  children: [

                    Checkbox(
                        value: isChecked,
                        onChanged:(bool? value){
                          setState(() {
                            isChecked = value!;
                          });
                        }),
                    Text('Üyelik Formu Aydınlatma Metnini Okudum.'),
                  ],
                )),

              (successRegister && onSubmit) ? Text('Bilgilerinizi doğru girmediniz tekrar deneyiniz',style: TextStyle(
                fontSize: 16,fontWeight: FontWeight.bold
              ),) : Text(''),




              SizedBox(height: 10),


              //Login button and (register now)
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: EdgeInsets.all(25),
                  child:TextButton(
                    style: TextButton.styleFrom(
                      fixedSize: Size(300, 50),
                      backgroundColor: Theme.of(context).primaryColor,
                      side: BorderSide(
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                      )
                    ),
                    onPressed:(){
                      if(isChecked==true &&_againPassword!=null){
                        onSubmit =true;
                        successRegister=true;
                        ref.read(signUpRiverpod).fetch();
                      }
                      else{
                        onSubmit =true;
                        successRegister = false;
                      }
                      },
                    child: Text(
                      "Kayıt Ol",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
               SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}