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

    // 編集中のテキスト
    String text = '';

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
              final todoIsDone = data[index].is_done;

              return GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: ((context) {
                      return SimpleDialog(
                        title: Text('編集するタスク: ${todoData}'),
                        contentPadding: const EdgeInsets.all(10),
                        children: [
                          TextFormField(
                            onFieldSubmitted: (value) {
                              todoNotifier.updateTodo(context, todoID, value);
                            },
                          ),
                        ],
                      );
                    }),
                  );
                },
                child: Card(
                  child: Row(
                    children: <Widget>[
                      // 完了/未完了のボタン
                      TextButton(
                        onPressed: () {
                          todoNotifier.updateDone(todoID, todoIsDone);
                        },
                        child: (todoIsDone)
                            ? const Icon(Icons.radio_button_checked)
                            : const Icon(Icons.radio_button_unchecked),
                      ),
                      // Todoの内容を表示
                      Text(
                        todoData ?? '',
                        style: const TextStyle(fontSize: 20),
                      ),
                      // 削除ボタン
                      TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: ((context) {
                              return SimpleDialog(
                                title: const Text('タスクを削除'),
                                contentPadding: const EdgeInsets.all(20),
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('戻る'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          todoNotifier.deleteTodo(todoID);
                                          Navigator.pop(context);
                                        },
                                        child: const Text('削除'),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }),
                          );
                        },
                        child: const Icon(Icons.more_horiz),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: ((context) {
              return SimpleDialog(
                title: const Text('新しいタスク'),
                contentPadding: const EdgeInsets.all(10),
                children: [
                  TextFormField(
                    onChanged: (value) {
                      text = value;
                    },
                  ),
                  TextButton(
                    onPressed: () async {
                      // データ追加
                      await todoNotifier.addTodo(text);
                      // 閉じる
                      Navigator.pop(context);
                    },
                    child: const Text('追加'),
                  ),
                ],
              );
            }),
          );
        },
        icon: new Icon(Icons.add),
        label: const Text('新規'),
      ),
    );
  }
}
