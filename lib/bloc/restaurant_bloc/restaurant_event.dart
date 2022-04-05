part of 'restaurant_bloc.dart';

@immutable
abstract class RestaurantMenuEvent {}

class FetchLocalRestaurantEvent extends RestaurantMenuEvent {}

class FetchFirebaseRestaurantEvent extends RestaurantMenuEvent {}

class SaveRestaurantToLocalEvent extends  RestaurantMenuEvent {
  final Map<String, dynamic> config;
  final Map<String, dynamic> menu;

  SaveRestaurantToLocalEvent({required this.config, required this.menu});
}