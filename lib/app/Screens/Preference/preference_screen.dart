import 'package:einayaaminah/app/Screens/Preference/Wedgits/preference_app_bar.dart';
import 'package:einayaaminah/app/Screens/Preference/Wedgits/preference_body.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

/// [PreferenceScreen] displays the user's preferences.
class PreferenceScreen extends StatefulWidget {
  const PreferenceScreen({Key? key}) : super(key: key);

  @override
  PreferenceScreenState createState() => PreferenceScreenState();
}

class PreferenceScreenState extends State<PreferenceScreen> {
  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      animSpeedFactor: 10,
      color: Theme.of(context).primaryColor,
      showChildOpacityTransition: false,
      springAnimationDurationInMilliseconds: 500,
      onRefresh: () {
        return Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {});
        });
      },
      child: const Scaffold(
        appBar: PreferenceAppBar(),
        body: PreferenceBody(),
      ),
    );
  }
}
