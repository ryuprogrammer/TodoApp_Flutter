import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todoapp/domain/entity/todomodel.dart';
part 'todoNotifier.g.dart';

@riverpod
class TodoNotifier extends _$TodoNotifier {
  final supabaseInstance = Supabase.instance.client;

  @override
  Stream<List<TodoModel>> build() {
    return supabaseInstance.from('todos').stream(primaryKey: ['id']).map(
        (event) => event.map((e) => TodoModel.fromJson(e)).toList());
  }

  // データを変更する関数
  // 以下に記述
}
