import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:waitech/models/login_model.dart';

// Create storage
final storage = FlutterSecureStorage();

class ProfileScreen extends ConsumerStatefulWidget {
  static const String routeName = '/profile';
  late final LoginModel loginModel;

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => ProfileScreen(),
        settings: const RouteSettings(name: routeName));
  }
  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profil')),
      body: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                children:[
                  const Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Expanded(child: Icon(Icons.person, size: 60)),
                  ),
                  FutureBuilder<Widget>(
                    future:getNameAndEmail() ,
                      builder: (BuildContext context, AsyncSnapshot<Widget> snapshot){
                      if(snapshot.hasData){
                        return snapshot.data!;
                      }
                      else{
                        return const Text('isminizi yükleyemedik tekrar giriş yapmayı deneyeniz');
                      }
                      }
                      )],
              ),
              SizedBox(height: 30),
              Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 1, color: Colors.grey),
                      bottom: BorderSide(width: 1, color: Colors.grey),
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
                                  fontSize: 15,
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
                    bottom: BorderSide(width: 1, color: Colors.grey),
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
                              fontSize: 15,
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
                    bottom: BorderSide(width: 1, color: Colors.grey),
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {

                      },
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.settings,color:Theme.of(context).primaryColor),
                          Text(
                            'Hesap Ayarları',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Monoton-Regular',
                              color: Colors.black,
                            ),
                          ),
                          Icon(Icons.arrow_forward,color: Theme.of(context).primaryColor)
                        ],
                      )
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: Colors.grey),
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child:Row(
                        children: [
                          Icon(Icons.logout,color: Theme.of(context).primaryColor),
                          TextButton( onPressed: () async {
                            await storage.deleteAll();
                            Navigator.pop(context);
                          },
                         child:Text('Çıkış Yap',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Monoton-Regular',
                              color: Colors.black,
                            ),
                          )),
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
    );
  }

  Future<Widget> ProfileWidget() async {
    String? name = await storage.read(key:'name');
    String? email = await storage.read(key:'email');

    return Text('$name');
  }

  Future<Widget> getNameAndEmail() async {
    String? name = await storage.read(key:'username');
    String? email = await storage.read(key:'email');

    return Column(
      children: [
        Text('$name',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
        ),),
        Text('$email',
          style: TextStyle(fontSize: 13),)
        ]
    );

  }
}
