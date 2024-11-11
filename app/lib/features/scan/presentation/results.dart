import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResultsPage extends StatelessWidget {
  final String result;
  final double confidence;

  const ResultsPage({Key? key, required this.result, required this.confidence})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prediction Results"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Prediction: $result',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Confidence: ${confidence.toStringAsFixed(2)}%',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Navigate back
                },
                child: Text("Back"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.go('/all_diseases'); // Navigate to All Diseases page
                },
                child: Text("View All Diseases"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
