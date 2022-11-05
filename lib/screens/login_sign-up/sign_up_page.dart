

import 'package:flutter/material.dart';
class SignUpPage extends StatefulWidget{
  static const String routeName = '/sign-up';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => SignUpPage(),
        settings: const RouteSettings(name: routeName));
  }


  @override
  State<SignUpPage> createState() => _SignUpPageState();
}


class _SignUpPageState extends State<SignUpPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children:[
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  child: Image.asset("assets/images/Waitech_logo.png"),
                ),

              ),

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
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(

                    color: Colors.white,
                    border:Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left:20.0),
                    child: TextField(
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
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(

                    color: Colors.white,
                    border:Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left:20.0),
                    child: TextField(
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
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(

                    color: Colors.white,
                    border:Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left:20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border : InputBorder.none,
                        hintText: "Şifre",
                      ),
                      obscureText: true,
                    ),
                  ),
                ),

              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(

                    color: Colors.white,
                    border:Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left:20.0),
                    child: TextField(
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

              //Login button and (register now)
              Padding(padding:
              const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child:Text(
                      "Create Account",
                      style: TextStyle(color: Colors.white,
                      fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
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