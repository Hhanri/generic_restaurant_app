part of 'restaurant_menu_bloc.dart';

@immutable
abstract class RestaurantMenuEvent {}

class FetchLocalRestaurantMenuEvent extends RestaurantMenuEvent {}

class FetchFirebaseRestaurantMenuEvent extends RestaurantMenuEvent {}

class SaveRestaurantMenuToLocalEvent extends  RestaurantMenuEvent {
  final Map<String, dynamic> data;

  SaveRestaurantMenuToLocalEvent({required this.data});
}