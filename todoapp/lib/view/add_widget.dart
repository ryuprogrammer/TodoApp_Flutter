import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddWidget extends ConsumerWidget {
  const AddWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(todoNotifierProvider);

    return const Placeholder();
  }
}
