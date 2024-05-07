import 'dart:async';
import 'package:flutter/material.dart';
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
  Future<void> updateTodo(BuildContext context, int todoID, String body) async {
    // コンテキストを使用する処理
    try {
      // ダイアログを閉じる
      Navigator.of(context).pop();

      final todoRepository = build();
      await todoRepository
          .from('todos')
          .update({'body': body}).match({'id': todoID});
    } catch (e) {
      print('エラーが発生しました: $e');
    }
  }

  // データ更新メソッド: 完了ボタン用
  Future<void> updateDone(int todoID, bool isDone) async {
    final todoRepository = build();
    await todoRepository
        .from('todos')
        .update({'is_done': !isDone}).match({'id': todoID});
  }

  // データ削除メソッド
  Future<void> deleteTodo(int todoID) async {
    final todoRepository = build();
    await todoRepository.from('todos').delete().match({'id': todoID});
  }
}
