import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waitech/models/restaurant_model.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => HomeScreen(), settings: const RouteSettings(name: routeName));
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Restaurant> searchRestaurant = [];
  bool isSearch=false;
  late FocusNode _focusNode;

  TextEditingController searchWord = TextEditingController();

  void searchFunc(String value) {
    Restaurant.restaurants.forEach((company) {
      if(company!.name!.toLowerCase().trim().contains(value.toLowerCase().trim())){
        searchRestaurant.add(company);
        setState(() {
          log(company.name);
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Waitech"),
        actions: <Widget>[
          const Icon(Icons.location_on_outlined),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, 'location');
            },
            child: const Text("Konum",
              style: TextStyle(color: Colors.white,
                  fontSize: 14.0),),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 40, 8, 0),
              child: CupertinoTextField(
                controller: searchWord,
                prefix: Icon(Icons.search,color: Theme.of(context).primaryColor,),
                suffix: IconButton(onPressed:(){
                  searchWord.clear();
                  setState(() {
                    for(int i=0; i<searchRestaurant.length;i++){
                      log(searchWord.text);
                      searchRestaurant.removeRange(0,searchRestaurant.length);
                    }
                  });
                }, icon: searchIconClear()),
                keyboardType: TextInputType.name,
                placeholder: 'Restaurant Ara',
                padding:  const EdgeInsets.symmetric(horizontal: 10.0),
                onSubmitted: (searchWord){
                    searchFunc(searchWord);
                },
              ),
            ),

             Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Restaurantlar',
                    style: TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  IconButton(onPressed: ()=> Navigator.pushNamed(context, '/filter'), icon: Icon(Icons.filter_list))
                ],
              ),
            ),
            Padding(
              padding:const EdgeInsets.all(10),
              child:ListView.builder(
                physics:  NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var item = searchRestaurant.length>0 ? searchRestaurant[index]! : Restaurant.restaurants[index]!;
                  return InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, '/restaurant-detail', arguments: item);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: NetworkImage(item.imageUrl), fit: BoxFit.cover),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                                ),
                                Text(item.tags.join(', '),style: GoogleFonts.openSans(),),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: searchRestaurant.length>0 ? searchRestaurant.length : Restaurant.restaurants.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchIconClear(){
  if(searchWord.text.isNotEmpty){
    return Icon(Icons.clear,color: Theme.of(context).primaryColor);
  }
  else{
    return const Icon(null);
  }
}
}

