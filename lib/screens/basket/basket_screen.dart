import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waitech/blocs/basket/basket_bloc.dart';

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
  int number=0;
  int itemNumbers=1;
  int itemRow=1;
  int totalPrice=5;
   addItems() {
     setState(() {
       itemNumbers++;
     });
     totalPrice=itemNumbers*5;
     print(totalPrice);
   }
  removeItems() {
     setState(() {
       itemNumbers--;
       if(itemNumbers==0){
           itemRow--;
       }
       else if(itemNumbers<=0){
         itemRow=0;
       }

     });
     totalPrice=itemNumbers*5;
  }
  removeAllItems(){
     setState((){

       itemRow=0;
       totalPrice=0;

     });
  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sepet'),
        actions: <Widget>[
          IconButton(onPressed: (){
            removeAllItems();
          }, icon: Icon(Icons.delete))
        ],
      ),
      body: Padding(padding:  EdgeInsets.all(20.0),
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
            BlocBuilder<BasketBloc, BasketState>(
                builder: (context, state) {
                  if(state is BasketLoading){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  else if(state is BasketLoaded) {
                    return state.basket.items.length ==0 ? Container(width: double.infinity,
                    margin: const EdgeInsets.only(top:5),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child:Row(
                        children: [
                          Text('no items in the basket',
                            textAlign: TextAlign.left,

                          )
                        ],
                      ) ,
                    )
                    :ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.basket.itemQuantity(state.basket.items).keys.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50.0)),
                            child: Row(
                              children: [
                                Text('${state.basket.itemQuantity(state.basket.items).entries.elementAt(index).value} x',
                                  style: TextStyle(
                                    fontFamily: 'Monoton-Regular',
                                    fontSize: 20,
                                    color: Theme
                                        .of(context)
                                        .primaryColor,
                                  ),
                                ),
                                const SizedBox(width: 20),

                                Expanded(
                                  child:
                                  Column(
                                    children:  [
                                      Text('${state.basket.itemQuantity(state.basket.items).keys.elementAt(index).name}',
                                        style: TextStyle(
                                          fontFamily: 'Monoton-Regular',
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text('${state.basket.itemQuantity(state.basket.items).keys.elementAt(index).price}',
                                        style: TextStyle(
                                          fontFamily: 'Monoton-Regular',
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 15),
                                Row(
                                  children: [
                                    IconButton(onPressed: (){
                                      context.read<BasketBloc>()..add(RemoveItem(state.basket.itemQuantity(state.basket.items).keys.elementAt(index)));
                                    },
                                      icon: Icon(Icons.remove, color: Theme
                                          .of(context)
                                          .primaryColor),
                                    ),
                                    IconButton(onPressed: (){ context.read<BasketBloc>()..add(AddItem(state.basket.itemQuantity(state.basket.items).keys.elementAt(index)));
                                      },
                                      icon: Icon(Icons.add, color: Theme
                                          .of(context)
                                          .primaryColor),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          );
                        });
                  }
                  else{return Text('something wrong');}

            }),

            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white, borderRadius:BorderRadius.circular(15),

              ),

              child:BlocBuilder<BasketBloc, BasketState>(
                builder: (context, state){
                  if(state is BasketLoading){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is BasketLoaded){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Column(
                        children: [
                          Center(
                            child: Text('Toplam Fiyat: ${state.basket.totalString}\$',
                              style: const TextStyle(
                                fontSize: 22,
                                fontFamily: 'Monoton-Regular',
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  else{
                    return Text('something went wrong');
                  }

                },
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top:30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(340, 70),
                        shape: const StadiumBorder(),
                        backgroundColor: Theme.of(context).primaryColor
                    ),
                    onPressed: ()=>Navigator.pushNamed(context, '/pay_screen'),
                    child: const Text('Ödeme ekranına git',
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
