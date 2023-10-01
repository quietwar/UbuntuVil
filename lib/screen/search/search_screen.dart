import 'package:flutter/material.dart';
import 'package:ubuntu_villages/screen/search/search_item.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[200],
        title: const Text("Search"),
      ),
      body:  SingleChildScrollView(
        child: Column(
            children: [
              const ListTile(
                title: Text("Items"),
              ),
              Container(
                height: 52,
                margin:const  EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Search for items in the store",
                    suffixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
                    const SizedBox(height: 10,),
                     const SearchItem(),
                     const SearchItem(),
                     const SearchItem(),
            ],
          ),
      ),
    );
  }
}
