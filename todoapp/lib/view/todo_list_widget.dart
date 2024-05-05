import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/provider/todo_notifier.dart';

class TodoListWidget extends ConsumerWidget {
  const TodoListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(todoNotifierProvider);

    final listWidget = todo.when(
      loading: () => const Text('読み込み中'),
      error: (error, stackTrace) => const Text('エラー'),
      data: (data) => Text('$data'),
    );

    return listWidget;
  }
}
