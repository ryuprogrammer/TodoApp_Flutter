import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todoapp/domain/entity/todomodel.dart';

part 'todo_provider.g.dart';

final supabaseInstance = Supabase.instance.client;

@riverpod
Stream<List<TodoModel>> todoListStream(TodoListStreamRef ref) {
  return supabaseInstance.from('todos').stream(primaryKey: ['id']).map(
      (event) => event.map((e) => TodoModel.fromJson(e)).toList());
}
