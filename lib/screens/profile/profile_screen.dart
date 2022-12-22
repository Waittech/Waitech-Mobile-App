import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:waitech/models/login_model.dart';

// Create storage
final storage = FlutterSecureStorage();

class ProfileScreen extends StatefulWidget {
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
  late LoginModel loginModel;

  String FullName = 'Metehan Gürgentepe';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          height: 400,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Expanded(child: Icon(Icons.person, size: 60)),
                  ),
                  Expanded(
                    flex: 6,
                    child: Text('$FullName',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Segoe_UI')),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 3, color: Colors.grey),
                      bottom: BorderSide(width: 3, color: Colors.grey),
                    ),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.shopping_bag,
                                  color: Theme.of(context).primaryColor),
                              Text(
                                'Geçmiş Siparişlerim',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Monoton-Regular',
                                  color: Colors.black,
                                ),
                              ),
                              Icon(Icons.arrow_forward,color: Theme.of(context).primaryColor,)
                            ],
                          ))
                    ],
                  )),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 3, color: Colors.grey),
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'payment_screen');
                      },
                      child:Row(
                        children: [
                          Icon(Icons.credit_card,color: Theme.of(context).primaryColor),
                          Text(
                            'Ödeme Yöntemlerim',
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Monoton-Regular',
                              color: Colors.black,
                            ),
                          ),
                          Icon(Icons.arrow_forward,color: Theme.of(context).primaryColor,)
                        ],
                      )
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 3, color: Colors.grey),
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.settings,color:Theme.of(context).primaryColor),
                          Text(
                            'Hesap Ayarları',
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Monoton-Regular',
                              color: Colors.black,
                            ),
                          ),
                          Icon(Icons.arrow_forward,color: Theme.of(context).primaryColor,)

                        ],
                      )
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 3, color: Colors.grey),
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(),
                      onPressed: () {},
                      child:Row(
                        children: [
                          Icon(Icons.logout,color: Theme.of(context).primaryColor),
                          Text(
                            'Çıkış Yap',
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Monoton-Regular',

                              color: Colors.black,
                            ),
                          ),
                          Icon(Icons.arrow_forward,color: Theme.of(context).primaryColor,)
                        ],
                      )
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
