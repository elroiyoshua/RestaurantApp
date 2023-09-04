import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  static const routeName = '/search_page';
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Search Page")),
        body: Container(
          child: ListView.builder(
            itemBuilder: (context, index) {},
          ),
        ),
      ),
    );
  }
}
