import 'package:flutter/material.dart';
import 'package:flutter_restaurant/bloc/search/resto_search_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant/ui/cardresto.dart';

class Searchpage extends StatelessWidget {
  static const routeName = '/search_page';
  const Searchpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Page"),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: MySearchDelegate());
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: Container(
        child: BlocBuilder<RestoSearchBloc, RestoSearchState>(
          builder: (context, state) {
            if (state is RestoSearchLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is RestoSearchSucces) {
              return ListView.builder(
                  itemCount: state.restSearch.restaurants.length,
                  itemBuilder: (context, index) {
                    return CardResto(
                        context, state.restSearch.restaurants[index]);
                  });
            }
            return const Center(
              child: Text("Terjadi Error ketika menampilkan data"),
            );
          },
        ),
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) => Container();
  @override
  Widget buildSuggestions(BuildContext context) => Container();
}
