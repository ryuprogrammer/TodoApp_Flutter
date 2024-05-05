import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/provider/todo_notifier.dart';

class TodoListWidget extends ConsumerWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(todoNotifierProvider);

    final listWidget = todo.when(
      loading: () => const Text('読み込み中'),
      error: (error, stackTrace) {
        // エラーが発生した場合、コンソールにエラーメッセージを出力
        print('エラーが発生しました: ${error.toString()}');
        return Text('error: ${error.toString()}');
      },
      data: (data) => Text('$data'),
    );

    return listWidget;
  }
}
