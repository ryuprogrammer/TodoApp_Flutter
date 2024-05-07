import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todoapp/view/todo_list_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://yajttwjwdpulzefjbhqb.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlhanR0d2p3ZHB1bHplZmpiaHFiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTUwNjU5NTksImV4cCI6MjAzMDY0MTk1OX0.f1KIjF3rxMn29kShp-ICF1IER39QDg1XLWmJOd04gGg',
  );

  const app = MyApp();
  const scope = ProviderScope(child: app);
  runApp(scope);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(child: TodoListWidget()),
      ),
    );
  }
}
