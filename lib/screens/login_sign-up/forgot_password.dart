import 'package:flutter/material.dart';



class forgotPassword extends StatefulWidget{
  static const String routeName = '/forgot_password';


  static Route route() {
    return MaterialPageRoute(
        builder: (_) => forgotPassword(),
        settings: const RouteSettings(name: routeName));
  }



  @override
  State<forgotPassword> createState() => _forgotPassword();
}


class _forgotPassword extends State<forgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Text('Şifrenizi unutmuşsunuz',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Segeo_UI',
                    fontWeight: FontWeight.bold,
                    color:Colors.red,
                  ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextField(
                    decoration: InputDecoration(
                      filled:true,
                      fillColor: Colors.white,
                      border : InputBorder.none,
                      hintText: 'Girdiğiniz e-mailinizi giriniz.',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}