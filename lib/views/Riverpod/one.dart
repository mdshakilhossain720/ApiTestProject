import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

final SimpleProvider = Provider<String>((ref) {
  return "Hello";
});
final count = Provider<int>((ref) {
  return 10;
});

class SimpleProviderScreen extends ConsumerWidget {
  const SimpleProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(appBar: AppBar(title: const Text("Simple Provider")),


    body: Column(
      children: [
        Text(ref.watch(SimpleProvider)),
        Text(ref.watch(count).toString()),
      ],
    ),
    
    
    
    
    );
  }
}
