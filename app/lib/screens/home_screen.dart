import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Home Screen'),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.go('/all-products');
            },
            child: Text('Go to All Products'),
          ),
        ],
      ),
    );
  }
}
