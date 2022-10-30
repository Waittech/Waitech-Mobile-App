import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


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
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children:[
              const SizedBox(height: 80),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  child: Image.asset("assets/images/Waitech_logo.png"),
                ),

              ),

              SizedBox(height: 80),

              Text(
                  'Create Account',
                style: GoogleFonts.bebasNeue(
                  fontWeight: FontWeight.bold,
                  fontSize: 52,
                ),
              ),

              SizedBox(height:40),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(

                    color: Colors.grey[200],
                    border:Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left:20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border : InputBorder.none,
                        hintText: 'Full Name',
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

                    color: Colors.grey[200],
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

                    color: Colors.grey[200],
                    border:Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left:20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border : InputBorder.none,
                        hintText: "Password",
                      ),
                    ),
                  ),
                ),

              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(

                    color: Colors.grey[200],
                    border:Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left:20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border : InputBorder.none,
                        hintText: "Password (Again)",
                      ),
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
                  decoration: BoxDecoration(color: Colors.indigo,
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

            ],
          ),


        ),
      ),
    );
  }
}