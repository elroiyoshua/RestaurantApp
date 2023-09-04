import 'package:flutter/material.dart';
import 'package:flutter_restaurant/api/apidetail.dart';
import 'package:flutter_restaurant/model/restaurantsearch.dart';
import 'package:flutter_restaurant/ui/cardsearchresto.dart';

class SearchPage extends StatefulWidget {
  static const routeName = '/search_page';
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late Future<RestaurantSearch> _search;
  var q = "kwaodiakodawiokawkfoawfoaf";
  @override
  void initState() {
    super.initState();
    _search = ApiDetailService().getSearchData(q);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Search Page"),
          actions: [
            IconButton(
              icon: const Icon(Icons.search_outlined),
              onPressed: () async {
                final result = await showSearch<String>(
                  context: context,
                  delegate: CustomSearch(q),
                );

                if (result != null) {
                  setState(() {
                    q = result;
                  });
                  _search = ApiDetailService().getSearchData(q);
                }
              },
            ),
          ],
        ),
        body: Container(
          child: FutureBuilder(
            future: _search,
            builder: (context, AsyncSnapshot<RestaurantSearch> snapshot) {
              var state = snapshot.connectionState;
              if (state != ConnectionState.done) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasData) {
                  if (snapshot.data?.founded == 0 ||
                      snapshot.data?.restaurants == 0) {
                    return const Center(
                      child: Text("Data yang dicari tidak ada"),
                    );
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data?.restaurants.length,
                      itemBuilder: (context, index) {
                        var searchpge = snapshot.data!.restaurants[index];
                        return CardSearchResto(context, searchpge);
                      },
                    );
                  }
                } else if (snapshot.hasError) {
                  return Center(
                    child: Material(
                        child: Center(
                      child: Text(snapshot.error.toString()),
                    )),
                  );
                } else {
                  return const Material(
                    child: Center(child: Text("")),
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }
}

class CustomSearch extends SearchDelegate<String> {
  final String q;

  CustomSearch(this.q);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query == "") {
      return const Center(
        child: Text("Data tidak boleh kosong"),
      );
    } else {
      Navigator.pop(context, query);
      return Container();
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) => Container();
}
