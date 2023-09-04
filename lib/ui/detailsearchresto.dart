import 'package:flutter/material.dart';
import 'package:flutter_restaurant/api/apidetail.dart';
import 'package:flutter_restaurant/model/restaurantdetail.dart';

import 'package:flutter_restaurant/model/restaurantsearch.dart';

class detailSearchResto extends StatefulWidget {
  static const routeName = '/detailsearchresto';
  final Restaurantsearch restaurant;

  const detailSearchResto({Key? key, required this.restaurant})
      : super(key: key);

  @override
  State<detailSearchResto> createState() => _detailSearchRestoState();
}

class _detailSearchRestoState extends State<detailSearchResto> {
  late Future<DetailRestaurant> _detail;

  @override
  void initState() {
    super.initState();
    _detail = ApiDetailService().getData(widget.restaurant.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 300,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    "https://restaurant-api.dicoding.dev/images/large/${widget.restaurant.pictureId}",
                    fit: BoxFit.fitHeight,
                  ),
                  title: Text(
                    widget.restaurant.name,
                    style: const TextStyle(color: Colors.white),
                  ),
                  centerTitle: true,
                ),
              )
            ];
          },
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.restaurant.name,
                      style: const TextStyle(fontSize: 40),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Located at ${widget.restaurant.city} with rate ${widget.restaurant.rating}",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.restaurant.description,
                      style:
                          const TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                    const SizedBox(height: 10),
                    FutureBuilder(
                      future: _detail,
                      builder:
                          (context, AsyncSnapshot<DetailRestaurant> snapshot) {
                        var state = snapshot.connectionState;
                        if (state != ConnectionState.done) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          if (snapshot.hasData) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Tampilkan judul makanan
                                const Text(
                                  'Foods:',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                // Menampilkan daftar makanan
                                for (final food
                                    in snapshot.data!.restaurant.menus.foods)
                                  ListTile(
                                    leading: Hero(
                                      tag: Image.asset("assets/food.png"),
                                      child: Image.asset('assets/food.png'),
                                    ),
                                    title: Text(food.name),
                                    // Tambahkan properti lain yang diperlukan
                                  ),

                                // Tampilkan judul minuman
                                const Text(
                                  'Drinks:',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                // Menampilkan daftar minuman
                                for (final drink
                                    in snapshot.data!.restaurant.menus.drinks)
                                  ListTile(
                                    leading: Hero(
                                      tag: Image.asset("assets/soda.png"),
                                      child: Image.asset('assets/soda.png'),
                                    ),
                                    title: Text(drink.name),
                                    // Tambahkan properti lain yang diperlukan
                                  ),
                              ],
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Material(
                                child: Text(snapshot.hasError.toString()),
                              ),
                            );
                          } else {
                            return const Material(child: Text(''));
                          }
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
