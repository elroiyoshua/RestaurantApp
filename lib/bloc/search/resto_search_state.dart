part of 'resto_search_bloc.dart';

abstract class RestoSearchState {}

class RestoSearchInitial extends RestoSearchState {}

class RestoSearchLoading extends RestoSearchState {}

class RestoSearchSucces extends RestoSearchState {
  final RestaurantSearch restSearch;
  RestoSearchSucces({
    required this.restSearch,
  });
}

// class RestaurantInitial extends RestaurantState {}

// class RestaurantLoading extends RestaurantState {}

// class RestaurantSuccess extends RestaurantState {
//   final Restaurant restaurante;
//   RestaurantSuccess({
//     required this.restaurante,
//   });
  
