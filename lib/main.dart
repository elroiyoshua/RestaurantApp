import 'package:flutter/material.dart';
import 'package:flutter_restaurant/detailresto.dart';
import 'package:flutter_restaurant/resources.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: MyHomePage.routeName,
      routes: {
        MyHomePage.routeName: (context) => const MyHomePage(),
        detailResto.routeName: (context) => detailResto(
            restaurant:
                ModalRoute.of(context)?.settings.arguments as Restaurant),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  static const routeName = '/home_page';

  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Resto App"),
            elevation: 0,
          ),
          body: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/local_restaurant.json'),
            builder: (context, snapshot) {
              final List<Restaurant> restaurant = parseResto(snapshot.data);
              return ListView.builder(
                  itemCount: restaurant.length,
                  itemBuilder: (context, index) {
                    return CardResto(context, restaurant[index]);
                  });
            },
          )),
    );
  }
}

Widget CardResto(BuildContext context, Restaurant restaurant) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, detailResto.routeName,
          arguments: restaurant);
    },
    child: Card(
      margin: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                child: Image.network(
                  restaurant.pictureId,
                  height: 150,
                  width: 150,
                )),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.restaurant,
                      size: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        restaurant.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(Icons.location_city),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(restaurant.city),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(restaurant.rating.toString()),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
