import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waitech/models/get_company.dart';
import 'package:waitech/models/restaurant_model.dart';
import 'package:waitech/services/company_service.dart';
import '../../widgets/restaurant_card.dart';

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

  final service = CompanyService();
  final model = GetCompany();
  List<Data?> company =[];

  List<Restaurant> searchRestaurant = [];
  bool isSearch = false;


  @override
  void initState(){
    super.initState();
    service.fetchRestaurant().then((value){
      if(value != null && value.data != null) {
        setState(() {
          company = value.data!;
        });
      }
      else{
        throw Exception('company data null came');
      }
    });
  }



  TextEditingController searchWord = TextEditingController();

  void searchFunc(String value) {
    Restaurant.restaurants.forEach((company) {
      if (company!.name!.toLowerCase().trim().contains(
          value.toLowerCase().trim())) {
        searchRestaurant.add(company);
        setState(() {
          log(searchRestaurant[0].name);
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
                prefix: Icon(Icons.search, color: Theme
                    .of(context)
                    .primaryColor,),
                suffix: IconButton(onPressed: () {
                  searchWord.clear();
                  setState(() {
                    for (int i = 0; i < searchRestaurant.length; i++) {
                      log(searchWord.text);
                      searchRestaurant.removeRange(0, searchRestaurant.length);
                    }
                  });
                }, icon: searchIconClear()),
                keyboardType: TextInputType.name,
                placeholder: 'Restaurant Ara',
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                onSubmitted: (searchWord) {
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
                  IconButton(
                      onPressed: () => Navigator.pushNamed(context, '/filter'),
                      icon: Icon(Icons.filter_list))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: company.length,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {

                  return InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, '/home_restaurant-detail', arguments: company[index] );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 3,
                        shape:
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        child: InkWell(
                          onTap: (){Navigator.pushNamed(context, '/home_restaurant-detail', arguments: company[index]);},
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Ink.image(
                                    //image: const NetworkImage("assets/slider/2.jpg"),
                                    image:  NetworkImage(company[index]!.image!,),
                                    height: 150,
                                    fit: BoxFit.cover,
                                    child: InkWell(
                                      onTap: () {Navigator.pushNamed(context, '/home_restaurant-detail', arguments: company[index]);},
                                    ),
                                  ),


                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    padding: const EdgeInsets.all(12),
                                    child: Text(
                                      ' ',
                                      style: TextStyle(fontSize: 25, color: Colors.white),
                                    ),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.black.withOpacity(0),
                                              Colors.black.withOpacity(0.1)
                                            ])),
                                  ),

                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15, left: 15, right: 15 , bottom: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(company[index]!.name!, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                    SizedBox(height: 3,),
                                    Text(company[index]!.description! , style: TextStyle(fontSize: 11, ),),

                                  ],
                                ),
                              ),
                            ],
                          ),

                        ),
                      ),
                    ),
                  );
                },

              ),)

          ],
        ),
      ),
    );
  }

  Widget searchIconClear() {
    if (searchWord.text.isNotEmpty) {
      return Icon(Icons.clear, color: Theme
          .of(context)
          .primaryColor);
    }
    else {
      return const Icon(null);
    }
  }
}