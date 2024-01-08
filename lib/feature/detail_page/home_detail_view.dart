import 'package:flutter/material.dart';
import 'package:riverpod_login_project/feature/home/model/home_model.dart';

class HomeDetailView extends StatelessWidget {
  final HomeModel user;
  const HomeDetailView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              CircleAvatar(
                maxRadius: 70,
                backgroundImage: NetworkImage(user.avatar!),
              ),
              const SizedBox(height: 20),
              Text("${user.first_name!} ${user.last_name}"),
              const SizedBox(height: 20),
              Text(user.email!),
            ],
          ),
        ),
      ),
    );
  }
}
