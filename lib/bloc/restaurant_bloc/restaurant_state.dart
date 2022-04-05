part of 'restaurant_bloc.dart';

@immutable
abstract class RestaurantState {}

class RestaurantLoadingState extends RestaurantState {}

class RestaurantLoadedState extends RestaurantState {
  final List<SectionModel> sections;
  final AppSettings config;

  RestaurantLoadedState({required this.sections, required this.config});
}