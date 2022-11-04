import 'package:flutter/material.dart';

class BasketScreen extends StatefulWidget {
  static const String routeName = '/basket';

  const BasketScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => BasketScreen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  State<BasketScreen> createState() => _BasketState();
}

class _BasketState extends State<BasketScreen>{
  late var itemNumbers=1;
  late var itemRow=3;
   addItems() => itemNumbers++;
  removeItems() {
    itemNumbers--;
    if(itemNumbers==0){
      setState(() {
        itemRow--;

      });

    }
    else if(itemNumbers<=0){
      itemRow=0;
    }
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sepet'),
        actions: <Widget>[
          IconButton(onPressed: (){
            itemRow=0;
          }, icon: Icon(Icons.delete))
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
                itemCount: itemRow,
                itemBuilder: (context,index){
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top:5),
                    padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                    decoration: BoxDecoration(color:Colors.white,borderRadius: BorderRadius.circular(50.0)),
                    child: Row(children: [
                      Text('$itemNumbers x',
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
                          children: const [
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
                          IconButton(onPressed: removeItems,
                            icon: Icon(Icons.remove, color:Theme.of(context).primaryColor),
                          ),
                          IconButton(onPressed: addItems,
                            icon: Icon(Icons.add, color:Theme.of(context).primaryColor),
                          ),

                        ],
                      ),
                    ],
                    ),
                  );
                }),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white, borderRadius:BorderRadius.circular(15),

              ),
              child: Text('Toplam sepet tutarınız: 14.97\$',style: TextStyle(
                fontSize: 22,
              ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(340, 70),
                        shape: StadiumBorder(),
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
}
