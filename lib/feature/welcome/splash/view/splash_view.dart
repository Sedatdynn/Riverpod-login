import 'package:flutter/material.dart';
import 'package:riverpod_login_project/core/cache/shared_manager.dart';
import 'package:riverpod_login_project/feature/auth/login/view/login_view.dart';
import 'package:riverpod_login_project/feature/home/view/home_view.dart';
import 'package:riverpod_login_project/product/const/padding/app_paddings.dart';
import 'package:riverpod_login_project/product/enum/lottie_enum.dart';
import 'package:riverpod_login_project/product/enum/shared_enum.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  Future<void> initialization() async {
    await Future.delayed(const Duration(seconds: 3));
    final String? myToken = SharedManager.instance.getStringValue(SharedKeys.token.name);
    bool? isSuccess = ((myToken != null) && myToken.isNotEmpty) ? true : false;
    if (isSuccess) {
      navigateToHome();
    } else {
      navigateToLogin();
    }
  }

  navigateToLogin() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginView()),
        (Route<dynamic> route) => false);
  }

  navigateToHome() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const HomeView()), (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const AppPadding.normalHorizontal(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 600, width: 590, child: LottiePath.splash.toLottie()),
              Text(
                'Hoş Geldiniz...',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
