import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';

class UserGuidesScreen extends StatelessWidget {
  const UserGuidesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Guide'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Markdown(
        data: '''
Welcome to the *Tea Leaf Disease Detection App*! Follow these steps to make the most of the app:

### Navigating the App

- *Homepage*: At the beginning, you will be directed to the homepage.

### Disease Details
- By clicking *Disease Details*, you can explore detailed descriptions of the most common tea leaf diseases.

### Identifying Tea Leaf Diseases
1. To identify tea leaf diseases, tap the *Scan* icon on the bottom app bar or press the *Scan Disease* button.
2. [Go to Scan Screen](go://scan)
3. Place the diseased leaf on a *white background* and capture entire leaf.

#### Tips for Best Results
- *Remove any water droplets* on the leaf.

### Viewing Detailed Description and Solutions
- After identifying the disease, a detailed description will display the disease information and recommended solutions.

### Disease Distribution
- If you're in *online mode*, the diseased distribution profile is plotted on Google Maps.
- [Go to Diseased Distribution Profile Page](go://map)
- In *offline mode*, the app shows the identified disease along with recommended solutions.

### For more details
If the diseased area is large or need further assistance, it is recommended to contact a government agricultural officer for further assistance.

''',
        selectable: true,
        imageBuilder: (uri, title, alt) {
          return Center(
            child: Image.asset(uri.path),
          );
        },
        onTapLink: (text, href, title) {
          if (href == 'go://scan') {
            context.go('/scan');
          } else if (href == 'go://map') {
            context.go('/map');
          }
        },
      ),
    );
  }
}
