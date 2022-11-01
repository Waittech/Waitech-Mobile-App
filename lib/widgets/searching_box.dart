import 'package:flutter/material.dart';

class SearchingBox extends StatelessWidget {
  const SearchingBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: 'Restaurant Ara',
              suffixIcon: Icon(Icons.search),
              contentPadding: EdgeInsets.only(left: 20, bottom: 5, right: 5),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
