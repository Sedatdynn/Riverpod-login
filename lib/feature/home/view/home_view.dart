import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_login_project/core/base/exception/app_exception.dart';
import 'package:riverpod_login_project/feature/home/controller/home_provider.dart';
import 'package:riverpod_login_project/feature/home/model/home_model.dart';
import 'package:riverpod_login_project/product/const/padding/app_paddings.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(userDataProvider);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('RIVERPOD '),
            centerTitle: true,
          ),
          body: Padding(
            padding: const AppPadding.lowHorizontal(),
            child: _data.when(
                data: (_data) {
                  List<HomeModel> dataList = _data.fold(
                    (error) => throw const ServerException(
                        message: "Server Exception:", statusCode: '505'),
                    (list) => list,
                  );
                  return _ListBodyWidget(dataList: dataList);
                },
                error: (error, __) => _ErrorWidget(errorMessage: error.toString()),
                loading: () => const _LoadingWidget()),
          )),
    );
  }
}

class _ListBodyWidget extends StatelessWidget {
  const _ListBodyWidget({required this.dataList});

  final List<HomeModel> dataList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          HomeModel data = dataList[index];
          return Card(
            child: ListTile(
              leading: Image.network(data.avatar!),
              title: Text(data.email!),
              subtitle: Text('${data.first_name!} ${data.last_name!}'),
            ),
          );
        });
  }
}

class _ErrorWidget extends StatelessWidget {
  final String errorMessage;
  const _ErrorWidget({required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorMessage),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      color: Colors.red,
    ));
  }
}
