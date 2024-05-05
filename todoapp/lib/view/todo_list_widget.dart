import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/provider/todo_notifier.dart';

class TodoListWidget extends ConsumerWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(todoNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: todo.when(
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

              return Card(
                child: Row(
                  children: <Widget>[
                    // 完了/未完了のボタン
                    TextButton(onPressed: () {}, child: Icon(Icons.check_box)),

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
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
