import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:waitech/blocs/filter/filter_bloc.dart';
import 'package:waitech/models/categor_filter_model.dart';
import 'package:waitech/models/restaurant_model.dart';

import '../../models/Price_model.dart';

class FilterScreen extends StatelessWidget {
  static const String routeName = '/filter';

  const FilterScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => FilterScreen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Filter')),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<FiltersBloc, FiltersState>(builder: (context, state) {
                if (state is FiltersLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is FiltersLoaded) {
                  return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(),
                          backgroundColor: Theme.of(context).primaryColor),
                      onPressed: () {
                        var categories = state.filter.categoryFilters
                            .where((filter) => filter.value)
                            .map((filter) => filter.category.name)
                            .toList();
                        print(categories);
                        List<Restaurant> index = Restaurant.restaurants
                            .where((restaurant) => categories.any((category) =>
                                restaurant.tags.contains(category)))
                            .toList();
                        Navigator.pushNamed(context, '/restaurant-listing',
                            arguments: index);
                        print(index);
                      },
                      child: Text('Uygula'));
                } else {
                  return Text('bir şeyler oldu');
                }
              })
            ],
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text('Kategori',
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold))),
                const CustomCategoryFilter(),
              ],
            )));
  }
}

class CustomCategoryFilter extends StatelessWidget {
  const CustomCategoryFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltersBloc, FiltersState>(builder: (context, state) {
      if (state is FiltersLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is FiltersLoaded) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: state.filter.categoryFilters.length,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      state.filter.categoryFilters[index].category.name,
                      style: GoogleFonts.openSans(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 25,
                      child: Checkbox(
                          value: state.filter.categoryFilters[index].value,
                          onChanged: (bool? newValue) {
                            context.read<FiltersBloc>().add(
                                CategoryFilterUpdated(
                                    categoryFilter: state
                                        .filter.categoryFilters[index]
                                        .copyWith(
                                            value: !state
                                                .filter
                                                .categoryFilters[index]
                                                .value)));
                          }),
                    )
                  ],
                ),
              );
            });
      } else {
        return Text('bir şeyler yolunda gitmedi');
      }
    });
  }
}
