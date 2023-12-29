// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      page: json['page'] as int?,
      per_page: json['per_page'] as int?,
      total: json['total'] as int?,
      total_page: json['total_page'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => HomeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'page': instance.page,
      'per_page': instance.per_page,
      'total': instance.total,
      'total_page': instance.total_page,
      'data': instance.data,
    };
