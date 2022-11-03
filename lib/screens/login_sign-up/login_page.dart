import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waitech/main.dart';
import 'package:waitech/config/app_router.dart';
import 'package:waitech/screens/login_sign-up/sign_up_page.dart';



class LoginPage extends StatefulWidget{
  static const String routeName = '/login';


  static Route route() {
    return MaterialPageRoute(
        builder: (_) => LoginPage(),
        settings: const RouteSettings(name: routeName));
  }



  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children:[
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  child: Image.asset("assets/images/Waitech_logo.png"),
                ),

              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Center(
                  child: Text(
                    'Welcome back you have been missed!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff697a8d),
                      fontSize: 24,
                      fontFamily: "Segoe_UI",
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),



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
                        filled:true,
                        fillColor: Colors.white,
                        border : InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),


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
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        filled:true,
                        fillColor: Colors.white,
                        border : InputBorder.none,
                        hintText: "Password",
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),

              //Login button and (register now)
              Padding(padding:
              const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child:Text(

                      "Sign in",
                      style: TextStyle(
                          color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(left: 55.0),
                child: Row(
                  children: [
                    Text('Üye değil misiniz?',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Segoe_UI',
                      color: Theme.of(context).primaryColorLight,

                    ),
                    ),
                    TextButton(onPressed:() => Navigator.pushNamed(context,'/sign-up' ),
                      child: Text(
                        'Olmak için tıklayın',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Segoe_UI',
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),


                  ],
                ),
              ),
              TextButton(onPressed:() => Navigator.pushNamed(context,'/profile' ),
                child: Text(
                  'Profile Ekranı',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Segoe_UI',
                    color: Theme.of(context).primaryColor,
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