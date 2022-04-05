part of 'app_settings_bloc.dart';

@immutable
abstract class AppSettingsState {}

class AppSettingsLoadingState extends AppSettingsState {}

class AppSettingsLoadedState extends AppSettingsState {
  final AppSettings config;

  AppSettingsLoadedState({required this.config});
}
