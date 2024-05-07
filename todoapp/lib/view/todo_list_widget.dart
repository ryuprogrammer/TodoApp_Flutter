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
          // エラーが発生した場合、コンソールにエラーメッセージを出力
          print('エラーが発生しました: ${error.toString()}');
          return Text('エラーが発生しました: ${error.toString()}');
        },
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              // Todoの内容
              final todoData = data[index].body;
              final todoID = data[index].id;

              return Card(
                child: Row(
                  children: <Widget>[
                    // 完了/未完了のボタン
                    TextButton(
                        onPressed: () {
                          todoNotifier.updateDone(todoID, true);
                        },
                        child: const Icon(Icons.check_box)),

                    // Todoの内容を表示
                    Text(
                      todoData ?? '',
                      style: TextStyle(fontSize: 20),
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
                    onFieldSubmitted: (value) {
                      todoNotifier.addTodo(value);
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
