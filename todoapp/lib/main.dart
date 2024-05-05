import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todoapp/view/todo_list_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://fngpekjyvukjhnwyfcdf.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZuZ3Bla2p5dnVramhud3lmY2RmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTM4NDc3MjIsImV4cCI6MjAyOTQyMzcyMn0.2Y9SK7QKY4Z4oBG6WBQ7dm2w49V3VeVR-GVM4l0vj3Y',
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
