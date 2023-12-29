// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:riverpod_login_project/feature/home/model/home_model.dart';

part 'data_model.g.dart';

@JsonSerializable()
class DataModel extends Equatable {
  final int? page;
  final int? per_page;
  final int? total;
  final int? total_page;
  final List<HomeModel>? data;

  const DataModel({
    this.page,
    this.per_page,
    this.total,
    this.total_page,
    this.data,
  });

  @override
  List<Object?> get props => [page, per_page, total, total_page];

  factory DataModel.fromJson(Map<String, dynamic> json) => _$DataModelFromJson(json);
  Map<String, dynamic> toJson() => _$DataModelToJson(this);

  factory DataModel.initial() {
    return DataModel(page: 1, per_page: 1, total: 1, total_page: 1, data: [HomeModel.initial()]);
  }

  DataModel copyWith({
    int? page,
    int? per_page,
    int? total,
    int? total_page,
    List<HomeModel>? datas,
  }) {
    return DataModel(
      page: page ?? this.page,
      per_page: per_page ?? this.per_page,
      total: total ?? this.total,
      total_page: total_page ?? this.total_page,
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;
}
