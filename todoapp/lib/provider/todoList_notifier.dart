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

  // データ追加メソッド
  Future<void> addTodo(String _body) async {
    final todoRepositry = ref.read(todoNotifierProvider);
    await todoRepositry.from('todos').insert({'body': _body});
  }

  // データ更新メソッド

  // データ削除メソッド
}
