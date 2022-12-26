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

  @override
  Widget build(BuildContext context){
    bool notSubmitted=true;
    bool _password= true;
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
                  'Create Account',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 42,
                  fontFamily: 'Segoe_UI',
                  color: Theme.of(context).primaryColorLight,
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
                        suffixIcon: Icon(Icons.visibility)
                      ),
                      obscureText: true,
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
                        suffixIcon: Icon(Icons.visibility)
                      ),
                      obscureText: true,
                    ),
                  ),
                ),

              ),



              SizedBox(height: 10),


              //Login button and (register now)
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: EdgeInsets.all(25),
                  child:ElevatedButton(
                    onPressed:(){
                        ref.read(signUpRiverpod).fetch();

                      },
                    child: const Text(
                      "Kayıt Ol"
                    ),
                  ),
                ),
              ),
               SizedBox(height: 10),
              TextButton(onPressed: (){
                Navigator.pushNamed(context, '/forgot_password');},
                child: Text('Şifrenizi mi unuttunuz?',
              style: TextStyle(
                fontSize: 15,
                color:Theme.of(context).primaryColor,
              ),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}