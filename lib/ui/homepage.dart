// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_restaurant/bloc/restaurant_bloc.dart';
// import 'package:flutter_restaurant/ui/cardresto.dart';

// class MyHomePage extends StatelessWidget {
//   static const routeName = '/home_page';

//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       appBar: AppBar(
//         title: const Text("Resto App"),
//         elevation: 0,
//       ),
//       body: Container(
//         child: BlocBuilder<RestaurantBloc, RestaurantState>(
//           builder: (context, state) {
//             if (state is RestaurantLoading) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             if (state is RestaurantSuccess) {
//               return ListView.builder(
//                   itemCount: state.restaurante.restaurants.length,
//                   itemBuilder: (context, index) {
//                     return CardResto(
//                         context, state.restaurante.restaurants[index]);
//                   });
//             }
//             return const Center(
//               child: Text("Terjadi Error ketika menampilkan data"),
//             );
//           },
//         ),
//       ),
//     ) //
//         );
//   }
// }
