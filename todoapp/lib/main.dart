import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todoapp/view/todo_list_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://wswgtzkxglnskyvgjtcd.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Indzd2d0emt4Z2xuc2t5dmdqdGNkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQ4OTA1OTEsImV4cCI6MjAzMDQ2NjU5MX0.BgHD_WPdrQ2-GKHv4hSSDHKKVTMZyz0np_aTcgaGEFk',
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
