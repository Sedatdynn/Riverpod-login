import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_login_project/feature/auth/login/model/login_request_model.dart';
import 'package:riverpod_login_project/feature/auth/login/service/login_service.dart';
import 'package:riverpod_login_project/feature/home/view/home_view.dart';
import 'package:riverpod_login_project/product/global/model/user_model.dart';
import 'package:riverpod_login_project/product/global/network/network_manager.dart';
import 'package:riverpod_login_project/product/widget/toast/toast.dart';

class LoginNotifier extends StateNotifier<UserModel> {
  LoginNotifier(this.service) : super(UserModel.initial());
  final LoginService service;
  final formKey = GlobalKey<FormState>();
  Future<void> login(BuildContext context) async {
    final response =
        await service.login(LoginRequestModel(email: state.email!, password: state.password!));
    response.fold((l) => showToast(l.message), (r) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomeView()),
          (Route<dynamic> route) => false);
    });
  }

  void setEmail(String email) => state = state.copyWith(email: email);

  void setPassword(String password) => state = state.copyWith(password: password);
}

final userProvider = StateNotifierProvider<LoginNotifier, UserModel>(
    (ref) => LoginNotifier(LoginService(NetworkManager.instance.service)));
