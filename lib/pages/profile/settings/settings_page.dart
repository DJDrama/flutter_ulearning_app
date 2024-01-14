import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/application/bloc/app_blocs.dart';
import 'package:ulearning_app/pages/application/bloc/app_events.dart';
import 'package:ulearning_app/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:ulearning_app/pages/profile/settings/widgets/settings_widgets.dart';

import '../../../common/routes/names.dart';
import '../../../common/values/constant.dart';
import '../../../global.dart';
import 'bloc/settings_state.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void _removeUserData() {
    context.read<AppBloc>().add(const AppEventTapBottomBar(0)); // reset bottombar index
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsPageBloc, SettingState>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: [
                  settingsButton(context, _removeUserData),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
