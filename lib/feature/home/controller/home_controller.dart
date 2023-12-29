import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_login_project/feature/home/model/home_model.dart';
import 'package:riverpod_login_project/feature/home/service/home_service.dart';
import 'package:riverpod_login_project/product/global/network/network_manager.dart';
import 'package:riverpod_login_project/product/widget/toast/toast.dart';

class HomeNotifier extends StateNotifier<HomeModel> {
  HomeNotifier(this.service) : super(HomeModel.initial()) {
    fetchData();
  }
  final HomeService service;
  List<HomeModel> dataList = [];
  final formKey = GlobalKey<FormState>();
  Future<void> fetchData() async {
    final response = await service.fetchData();
    response.fold((l) => showToast(l.message), (response) {
      dataList = response;
    });
  }
}

final homeProvider = StateNotifierProvider<HomeNotifier, HomeModel>(
    (ref) => HomeNotifier(HomeService(NetworkManager.instance.service)));

final fetchProvider = FutureProvider.autoDispose((_) {
  return HomeService(NetworkManager.instance.service).fetchData();
});
