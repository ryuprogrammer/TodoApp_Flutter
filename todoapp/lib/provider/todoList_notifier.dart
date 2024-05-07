import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todoList_notifier.g.dart';

@riverpod
class TodoListNotifier extends _$TodoListNotifier {
  @override
  SupabaseClient build() {
    return Supabase.instance.client;
  }

  // データ追加メソッド
  Future<void> addTodo(String body) async {
    final todoRepository = build();
    await todoRepository.from('todos').insert({'body': body});
  }

  // データ更新メソッド: Todoの内容
  Future<void> updateTodo(int todoID, String body) async {
    final todoRepository = build();
    await todoRepository
        .from('todos')
        .update({'body': body}).match({'id': todoID});
  }

  // データ更新メソッド: 完了ボタン用
  Future<void> updateDone(int todoID, bool isDone) async {
    final todoRepository = build();
    await todoRepository
        .from('todos') // テーブル名が'todos'であることを確認
        .update({'is_done': !isDone}).match({'id': todoID});
  }

  // データ削除メソッド
  Future<void> deleteTodo(int todoID) async {
    final todoRepository = build();
    await todoRepository
        .from('todos')
        .delete()
        .match({'id': todoID}); // テーブル名を'todos'に修正
  }
}
