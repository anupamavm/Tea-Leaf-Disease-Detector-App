import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart'; // Import GoRouter

class UserGuidesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Guides'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/scan');
          },
        ),
      ),
      body: Markdown(
        data: '''
## User Guides

This is a Markdown-based user guide. You can format text using Markdown syntax:

- **Bold text**: **This is bold**
- *Italic text*: *This is italic*
- `Code snippet`: `print('Hello, world!')`
- [Hyperlinks](https://example.com)

You can include headings, lists, code blocks, hyperlinks, and more using Markdown syntax.

Enjoy creating your user guides with Markdown!
''',
      ),
    );
  }
}
