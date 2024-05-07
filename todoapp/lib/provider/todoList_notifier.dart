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
    final todoRepositry = build();
    await todoRepositry.from('todos').insert({'body': body});
  }

  // データ更新メソッド: Todoの内容
  Future<void> uodateTodo(int todoID, String body) async {
    final todoRepositry = build();
    await todoRepositry
        .from('todos')
        .update({'body': body}).match({'id': todoID});
  }

  // データ更新メソッド: 完了ボタン用
  Future<void> updateDone(int todoID, bool? isDone) async {
    print('dbでーた: ${build().from('todos')}');
    final changedIsDone = isDone ?? false;
    print('${isDone}');

    final todoRepositry = build();
    await todoRepositry
        .from('todos')
        .update({'is_done': !changedIsDone}).match({'id': todoID});
  }

  // データ削除メソッド
  Future<void> deleteTodo(int noteID) async {
    final todoRepositry = build();
    await todoRepositry.from('notes').delete().match({'id': noteID});
  }
}
