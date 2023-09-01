import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_restaurant/model/restaurants.dart';
import 'package:http/http.dart' as http;

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  RestaurantBloc() : super(RestaurantInitial()) {
    on<GetRestaurantEvent>((event, emit) async {
      emit(RestaurantLoading());
      final Response =
          await http.get(Uri.parse('http://restaurant-api.dicoding.dev/list'));
      emit(RestaurantSuccess(restaurante: restaurantFromJson(Response.body)));
    });
  }
}
