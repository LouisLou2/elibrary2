import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:dio/dio.dart';
import 'package:elibapp/entity/authed_user.dart';
import 'package:elibapp/features/theme/bloc/theme_bloc.dart';
import 'package:elibapp/features/theme/bloc/theme_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/app_strings.dart';
import '../../../config/app_properties.dart';
import '../../../entity/resp.dart';
class OnBoardPage extends StatefulWidget {

  const OnBoardPage({super.key});

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> features = [
      // Feature's type must be `WhatsNewFeature`
      WhatsNewFeature(
        icon: Icon(
          CupertinoIcons.book,
          color: CupertinoColors.systemBlue.resolveFrom(context),
        ),
        title: Text(AppProperties.features[0].title),
        description: Text(
          AppProperties.features[0].desc,
        ),
      ),
      WhatsNewFeature(
        icon: Icon(
          Icons.task_alt_outlined,
          color: CupertinoColors.systemBlue.resolveFrom(context),
        ),
        title: Text(AppProperties.features[1].title),
        description: Text(
          AppProperties.features[1].desc,
        ),
      ),
      WhatsNewFeature(
        icon: Icon(
          CupertinoIcons.wand_stars,
          color: CupertinoColors.systemBlue.resolveFrom(context),
        ),
        title: Text(AppProperties.features[2].title),
        description: Text(
          AppProperties.features[2].desc,
        ),
      ),
    ];
    return CupertinoOnboarding(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //bottomButtonColor: AppColors.discoBallBlue,
      bottomButtonBorderRadius: BorderRadius.circular(8),
      onPressed: ()=>{},
      onPressedOnLastPage: () async {
        Response r = await Dio().post(
          'http://localhost:9021/auth/login/email_pwd',
          data: {
            'email': 'lskleo@163.com',
            'password': 'abc123456',
            'device_type':1,
          }
        );
        Resp resp = Resp.fromJson(r.data);
        AuthedUser authedUser = AuthedUser.fromJson(resp.data);
        print(authedUser);
        context.read<ThemeBloc>().add(ThemeEvent.toggleThemeEvent);
      },
      bottomButtonColor: CupertinoColors.activeBlue.resolveFrom(context),
      bottomButtonChild: Text(
        AppStrs.signIn,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Colors.white,
        ),
      ),
      pages: [
        CupertinoOnboardingPage(
          title: Column(
            children: [
              const Text(
                AppStrs.logInToEnjoy,
              ),
              Text(
                AppStrs.bookResources,
                style: TextStyle(
                  color: CupertinoColors.activeBlue.resolveFrom(context),
                ),
              ),
            ],
          ),
          body: ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (_, __) => const SizedBox(height: 25),
            itemCount: features.length,
            itemBuilder: (context, index) {
              return features[index];
            },
          ),
        ),
      ],
    );
  }
}