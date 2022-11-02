import 'package:flutter/material.dart';
import 'package:waitech/config/theme.dart';
import 'package:waitech/config/app_router.dart';
import 'package:waitech/screens/basket/pay_screen.dart';

class BasketScreen extends StatelessWidget {
  static const String routeName = '/basket';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const BasketScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const BasketScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Sepet'),
          actions: <Widget>[
            IconButton(onPressed: (){}, icon: Icon(Icons.delete))
          ],
        ),
      body: Padding(padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ürünler',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Segoe_UI',
                color:Colors.black38,
              ),
            ),
            SizedBox(height: 20),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context,index){
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top:5),
                padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.circular(50.0)),
                child: Row(children: [
                    Text('1x',
                      style: TextStyle(
                        fontFamily: 'Monoton-Regular',
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  SizedBox(width: 20),

                  Expanded(
                    child:
                    Column(
                      children: [
                        Text('Margharita Pizza',
                          style: TextStyle(
                            fontFamily: 'Monoton-Regular',
                            fontSize: 18,
                          ),
                        ),
                        Text('4.99\$',
                          style: TextStyle(
                            fontFamily: 'Monoton-Regular',
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 15),
                  Row(
                    children: [
                      IconButton(onPressed: onPressed(), icon: Icon(Icons.remove, color:Theme.of(context).primaryColor),
                      ),
                      IconButton(onPressed: onPressed(), icon: Icon(Icons.add, color:Theme.of(context).primaryColor),
                      ),

                    ],
                  ),
                ],
                ),
              );
            }),
            Padding(
              padding: const EdgeInsets.only(top:30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size.fromHeight(60.0),
                      backgroundColor: Theme.of(context).primaryColor
                    ),
                    onPressed: ()=>Navigator.pushNamed(context, '/pay_screen'),
                    child: Text('Ödeme ekranına git',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      );
    
  }

  onPressed() {}
}
