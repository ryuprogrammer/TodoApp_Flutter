import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'todomodel.freezed.dart';
part 'todomodel.g.dart';

@freezed
class TodoModel with _$TodoModel {
  const factory TodoModel(
      {required int id,
      required String? created_at,
      required String? body,
      required bool is_done}) = _TodoModel;

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);
}
