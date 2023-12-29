import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_login_project/feature/home/controller/home_controller.dart';
import 'package:riverpod_login_project/feature/home/model/home_model.dart';
import 'package:riverpod_login_project/product/const/padding/app_paddings.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          body: const Padding(
            padding: AppPadding.lowHorizontal(),
            child: _CustomWidget(),
          )),
    );
  }
}

class _CustomWidget extends ConsumerWidget {
  const _CustomWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _provider = ref.watch(fetchProvider);
    return _provider.when(
        data: (data) {
          ref.refresh(fetchProvider);
          final dataList = ref.watch(homeProvider.notifier).dataList;
          return _ListBodyWidget(dataList: dataList);
        },
        error: (_, __) => const _ErrorWidget(),
        loading: () => const _LoadingWidget());
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
          final list = dataList;
          return Card(
            child: ListTile(
              leading: Image.network(list[index].avatar!),
              title: Text(list[index].email!),
              subtitle: Text('${list[index].first_name!} ${list[index].last_name!}'),
            ),
          );
        });
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('HATA MEYDANA GELDI'),
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
