import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel extends Equatable {
  final String? email;
  final String? first_name;
  final String? last_name;
  final String? avatar;
  const HomeModel({
    this.email,
    this.first_name,
    this.last_name,
    this.avatar,
  });

  @override
  List<Object?> get props => [email, first_name, last_name, avatar];

  factory HomeModel.fromJson(Map<String, dynamic> json) => _$HomeModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomeModelToJson(this);

  factory HomeModel.initial() {
    return const HomeModel(email: '', first_name: '', last_name: '', avatar: '');
  }

  HomeModel copyWith({
    String? email,
    String? first_name,
    String? last_name,
    String? avatar,
  }) {
    return HomeModel(
      email: email ?? this.email,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      avatar: avatar ?? this.avatar,
    );
  }

  @override
  bool get stringify => true;
}
