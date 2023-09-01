// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'restaurant_bloc.dart';


abstract class RestaurantState {}

class RestaurantInitial extends RestaurantState {}

class RestaurantLoading extends RestaurantState {}

class RestaurantSuccess extends RestaurantState {
  final Restaurant restaurante;
  RestaurantSuccess({
    required this.restaurante,
  });
  
}
