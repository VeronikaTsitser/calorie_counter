import 'package:auto_route/auto_route.dart';
import 'package:calorie_counter/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    _isOnboardingShown().then((isOnboardingShown) {
      if (isOnboardingShown) {
        AutoRouter.of(context).replace(const DashBoardRoute());
      } else {
        AutoRouter.of(context).replace(const OnboardingRoute());
        setOnboardingShown();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  Future<bool> _isOnboardingShown() async {
    final pref = await SharedPreferences.getInstance();
    final isOnboardingShown = pref.getBool('isOnboardingShown');
    return isOnboardingShown ?? false;
  }

  Future<void> setOnboardingShown() async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool('isOnboardingShown', true);
  }
}
