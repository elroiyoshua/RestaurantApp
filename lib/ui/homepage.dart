import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant/bloc/restaurant_bloc.dart';
import 'package:flutter_restaurant/ui/cardresto.dart';
import 'package:flutter_restaurant/ui/searchresto.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/home_page';

  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    getConnectivity();
    super.initState();
  }

  getConnectivity() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      isDeviceConnected = await InternetConnectionChecker().hasConnection;
      if (!isDeviceConnected && isAlertSet == false) {
        showDialogBox();
        setState(() {
          isAlertSet = true;
        });
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Resto App"),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: (() {
                Navigator.pushNamed(context, SearchPage.routeName);
              }),
              icon: const Icon(Icons.search))
        ],
      ),
      body: Container(
        child: BlocBuilder<RestaurantBloc, RestaurantState>(
          builder: (context, state) {
            if (state is RestaurantLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is RestaurantSuccess) {
              return ListView.builder(
                  itemCount: state.restaurante.restaurants.length,
                  itemBuilder: (context, index) {
                    return CardResto(
                        context, state.restaurante.restaurants[index]);
                  });
            }
            return const Center(
              child: Text("Terjadi Error ketika menampilkan data"),
            );
          },
        ),
      ),
    ));
  }

  showDialogBox() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tidak Ada Koneksi'),
          icon: const Icon(
            Icons.signal_wifi_connected_no_internet_4,
          ),
          content: const Text('Tolong Periksa Koneksi Internet Anda'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.pop(context, 'Cancel');
                setState(() => isAlertSet = false);
                isDeviceConnected =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnected && isAlertSet == false) {
                  showDialogBox();
                  setState(() => isAlertSet = true);
                }
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
