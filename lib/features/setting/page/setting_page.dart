import 'package:elibapp/features/auth/bloc/auth_bloc.dart';
import 'package:elibapp/features/auth/bloc/auth_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../theme/bloc/theme_bloc.dart';
import '../../theme/bloc/theme_event.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  bool _darkTheme = false;
  bool _noCache = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置', style: TextStyle(fontWeight: FontWeight.w600)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        bottom: false,
        child: SettingsList(
          applicationType: ApplicationType.cupertino,
          platform: DevicePlatform.iOS,
          sections: [
            SettingsSection(
              title: const Text('外观'),
              tiles: [
                SettingsTile.switchTile(
                  onToggle: (value) {
                    setState(() {
                      _darkTheme = value;
                      context.read<ThemeBloc>().add(ThemeEvent.toggleThemeEvent);
                    });
                  },
                  initialValue: _darkTheme,
                  title: const Text('黑暗模式'),
                ),
              ],
            ),
            SettingsSection(
              title: const Text('空间'),
              tiles: [
                SettingsTile.switchTile(
                  onToggle: (value) {
                    setState(() {
                      _noCache = value;
                    });
                  },
                  initialValue: _noCache,
                  title: const Text(
                    '无缓存模式',
                  ),
                  description: const Text(
                    '无缓存模式下，图片等资源将不会被缓存，除开发者调试外，一般用户不需要开启此选项',
                  ),
                ),
              ],
            ),
            SettingsSection(
              title: const Text('身份'),
              tiles: [
                SettingsTile.navigation(
                  title: const Text('退出登录', style: TextStyle(color: CupertinoColors.destructiveRed)),
                  onPressed: (con) => _showAlertDialog(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext con) =>
      CupertinoAlertDialog(
        title: const Text('警告'),
        content: const Text('您确定要退出登录吗？'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(con);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: (){
              Navigator.pop(con);
              context.read<AuthBloc>().add(AuthEvent.logout);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
}