import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todoapp/domain/entity/todomodel.dart';

part 'todo_notifier.g.dart';

@riverpod
class TodoNotifier extends _$TodoNotifier {
  @override
  Stream<List<TodoModel>> build() {
    final supabaseInstance = Supabase.instance.client;
    return supabaseInstance.from('todos').stream(primaryKey: ['id']).map(
        (event) => event.map((e) => TodoModel.fromJson(e)).toList());
  }
}
