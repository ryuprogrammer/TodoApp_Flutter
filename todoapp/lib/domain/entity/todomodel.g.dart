// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todomodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoModelImpl _$$TodoModelImplFromJson(Map<String, dynamic> json) =>
    _$TodoModelImpl(
      id: (json['id'] as num).toInt(),
      createAt: json['createAt'] as String?,
      body: json['body'] as String?,
      isDone: json['isDone'] as bool?,
    );

Map<String, dynamic> _$$TodoModelImplToJson(_$TodoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createAt': instance.createAt,
      'body': instance.body,
      'isDone': instance.isDone,
    };
