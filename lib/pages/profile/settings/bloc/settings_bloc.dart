import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/profile/settings/bloc/settings_event.dart';
import 'package:ulearning_app/pages/profile/settings/bloc/settings_state.dart';

class SettingsPageBloc extends Bloc<SettingsEvent, SettingState> {
  SettingsPageBloc(): super(const SettingState()){
    on<SettingsTriggerSettingsPage>(_onSettingsTriggerSettingsPage);
  }

  void _onSettingsTriggerSettingsPage(
      SettingsTriggerSettingsPage event, Emitter<SettingState> emit){
    emit(const SettingState());
  }


}
