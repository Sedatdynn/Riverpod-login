import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_login_project/feature/auth/login/controller/login_controller.dart';
import 'package:riverpod_login_project/product/const/padding/app_paddings.dart';
import 'package:riverpod_login_project/product/widget/button/custom_button.dart';
import 'package:riverpod_login_project/product/widget/custom_textform_field.dart';
import 'package:riverpod_login_project/product/extension/regex/regex.dart';

part './login_widget.dart';

class LoginView extends ConsumerWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Padding(
      padding: const AppPadding.lowHorizontal(),
      child: Form(
        key: ref.read(userProvider.notifier).formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const _EmailTextFieldWidget(),
              const SizedBox(height: 30),
              const _PasswordField(),
              const SizedBox(height: 30),
              CommonButton(
                  text: 'login',
                  onPressed: () async {
                    if (ref.read(userProvider.notifier).formKey.currentState!.validate()) {
                      ref.read(userProvider.notifier).login(context);
                    }
                  })
            ],
          ),
        ),
      ),
    ));
  }
}
