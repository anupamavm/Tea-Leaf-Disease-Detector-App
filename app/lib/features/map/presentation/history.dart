import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).go('/map');
          },
        ),
      ),
      body: const Center(
        child: Text(
          'History Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
