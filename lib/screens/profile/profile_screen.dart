
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget{
  static const String routeName = '/profile';


  static Route route() {
    return MaterialPageRoute(
        builder: (_) => ProfileScreen(),
        settings: const RouteSettings(name: routeName));
  }



  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String FullName='Metehan Gürgentepe';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body: SafeArea(
          child:Container(
            child: Column(
              children: [
                Row(
                 children: <Widget>[
                   Padding(
                     padding: const EdgeInsets.only(right: 15.0),
                     child: Expanded(child: Icon(Icons.person,size: 60)
                     ),
                   ),
                   Expanded(child: Text('$FullName',
                     style:TextStyle(
                         fontSize: 25,fontWeight: FontWeight.bold,fontFamily: 'Segoe_UI')
                   ),
                   ),
                     ],
                   ),
                SizedBox(height: 30),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: onPressed(),
                      child:  Text('Geçmiş Siparişlerim',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Monoton-Regular',
                          fontWeight: FontWeight.bold,
                        color: Colors.black,

                      ),
                    ),
                    )
                  ],
                ),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: onPressed(),
                      child:  Text('Ödeme Yöntemlerim',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Monoton-Regular',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,

                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: onPressed(),
                      child:  Text('Fatura Bilgilerim',
                        style: TextStyle(
                          fontSize:20,
                          fontFamily: 'Monoton-Regular',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,

                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: onPressed(),
                      child:  Text('İletişim Terchilerim',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Monoton-Regular',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,

                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: onPressed(),
                      child:  Text('Hesap Ayarları',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Monoton-Regular',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,

                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: onPressed(),
                      child:  Text('Çıkış Yap',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Monoton-Regular',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,

                        ),
                      ),
                    )
                  ],
                ),
                 ],
                ),
            ),
          ),
    );


  }

  onPressed() {}

}