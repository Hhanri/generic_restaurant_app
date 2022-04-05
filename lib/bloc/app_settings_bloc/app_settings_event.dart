part of 'app_settings_bloc.dart';

@immutable
abstract class AppSettingsEvent {}

class FetchLocalConfigEvent extends AppSettingsEvent {}

class FetchFirebaseConfigEvent extends AppSettingsEvent {}

class SaveConfigToLocalEvent extends AppSettingsEvent {
  final Map<String, dynamic> data;

  SaveConfigToLocalEvent({required this.data});
}