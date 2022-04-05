part of 'restaurant_menu_bloc.dart';

@immutable
abstract class RestaurantMenuState {}

class RestaurantMenuLoadingState extends RestaurantMenuState {}

class RestaurantMenuLoadedState extends RestaurantMenuState {
  final List<SectionModel> sections;

  RestaurantMenuLoadedState({required this.sections});
}