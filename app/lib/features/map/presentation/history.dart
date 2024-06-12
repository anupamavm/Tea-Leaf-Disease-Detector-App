import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).go('/map');
          },
        ),
      ),
      body: Center(
        child: Text(
          'History Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
