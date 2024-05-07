import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/provider/todoList_notifier.dart';
import 'package:todoapp/provider/todo_notifier.dart';

class TodoListWidget extends ConsumerWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // データを監視するストリームプロバイダー
    final todoStream = ref.watch(todoNotifierProvider);
    // データの変更をするノティファイア
    final todoNotifier = ref.read(todoListNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo リスト'),
      ),
      body: todoStream.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) {
          return Text('エラーが発生しました: ${error.toString()}');
        },
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              // Todoの内容
              final todoData = data[index].body;
              // id
              final todoID = data[index].id;
              // 完了か
              final todoIsDone = data[index].isDone;

              return Card(
                child: Row(
                  children: <Widget>[
                    // 完了/未完了のボタン
                    TextButton(
                        onPressed: () {
                          todoNotifier.updateDone(todoID, todoIsDone);
                        },
                        child: const Icon(Icons.check_box)),

                    // Todoの内容を表示
                    Text(
                      todoData ?? '',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: ((context) {
              return SimpleDialog(
                title: const Text('新しいタスク'),
                contentPadding: const EdgeInsets.all(10),
                children: [
                  TextFormField(
                    onFieldSubmitted: (value) async {
                      await todoNotifier.addTodo(
                          value); // todoNotifier を使用して addTodo メソッドを呼び出す
                    },
                  ),
                ],
              );
            }),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
