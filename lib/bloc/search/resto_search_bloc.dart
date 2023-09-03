import 'package:bloc/bloc.dart';
import 'package:flutter_restaurant/model/restaurantsearch.dart';
import 'package:http/http.dart' as http;


part 'resto_search_event.dart';
part 'resto_search_state.dart';

class RestoSearchBloc extends Bloc<RestoSearchEvent, RestoSearchState> {
  RestoSearchBloc() : super(RestoSearchInitial()) {
    on<RestoSearchEvent>((event, emit) async {
      emit(RestoSearchLoading());
      final ResponseSearch = await http
          .get(Uri.parse("https://restaurant-api.dicoding.dev//search?q="));
      emit(RestoSearchSucces(
          restSearch: restaurantSearchFromJson(ResponseSearch.body)));
    });
  }
}

// class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
//   RestaurantBloc() : super(RestaurantInitial()) {
//     on<GetRestaurantEvent>((event, emit) async {
//       emit(RestaurantLoading());
//       final Response = await http
//           .get(Uri.parse('https://restaurant-api.dicoding.dev///list'));
//       emit(RestaurantSuccess(restaurante: restaurantFromJson(Response.body)));
//     });
//   }
// }
