import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todoList_notifier.g.dart';

@riverpod
class TodoNotifier extends _$TodoNotifier {
  @override
  SupabaseClient build() {
    return Supabase.instance.client;
  }

  // データを変更する関数
  // 以下に記述
  // データ追加メソッド
  // Future<void> addTodo(String _body) async {
  //   final todoRepositry =
  //   await todoRepositry.from('todos').insert;
  // }

  // データ更新メソッド

  // データ削除メソッド
}
