// disease_data.dart
class Disease {
  final String title;
  final String tagline;
  final String imageUrl;
  final String description;

  Disease({
    required this.title,
    required this.tagline,
    required this.imageUrl,
    required this.description,
  });
}

final List<Disease> diseases = [
  Disease(
    title: 'Card 1',
    tagline: 'Description for card 1',
    imageUrl:
        'https://th.bing.com/th/id/R.599a6a129321e6666e3c99272c52fc7f?rik=7Fmv1JPYNWEEvQ&riu=http%3a%2f%2fwww.myjapanesegreentea.com%2fwp-content%2fuploads%2f2015%2f09%2fblister-blight.jpg&ehk=QTrUt9dgQGeCjbq19PM4mDaXDRksWRlcQta1Cz%2fLIy4%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1',
    description: '''
# Markdown Sample Document

## Introduction
Markdown is a lightweight markup language with plain-text formatting syntax. It's designed to be easy to read and write, while also converting easily to HTML or other formats.

## Features

### Headings
Markdown supports several levels of headings, indicated by the number of hash symbols (#) preceding the heading text.

### Emphasis
You can _italicize_ text using underscores (_) or asterisks (*), and make text **bold** using double underscores (__) or double asterisks (**).

### Lists
Markdown supports both ordered and unordered lists:
- Unordered lists start with a hyphen (-), plus (+), or asterisk (*).
1. Ordered lists start with numbers followed by periods.

### Links
You can create links using the following syntax: [link text](URL). For example, [OpenAI](https://www.openai.com) is an artificial intelligence research organization.

### Images
Images can be included using similar syntax as links, but with an exclamation mark (!) in front: ![alt text](image URL).

### Code Blocks
Code blocks can be created by indenting lines with four spaces or by using triple backticks (\`\`\`) before and after the code block.

```python
def greet(name):
    print("Hello, " + name + "!")

''',
  ),
  // Add other diseases with descriptions
  Disease(
    title: 'Card 2',
    tagline: 'Description for card 2',
    imageUrl:
        'https://s3.amazonaws.com/plantvillage-production-new/images/pics/000/004/929/large/6920774335_7bc02db2b7_z.jpg?1429282418',
    description: '''
### Header 2
Markdown content for Card 2 with an image.

![Image](https://example.com/image2.jpg)
''',
  ),

  Disease(
    title: 'Card 3',
    tagline: 'Description for card 3',
    imageUrl:
        'https://www.researchgate.net/publication/284785803/figure/fig4/AS:666699623850004@1535964985821/Tea-leaf-image-affected-by-disease.png',
    description: '''
### Header 3
Markdown content for Card 3 with a list.

- List item 1
- List item 2
''',
  ),

  Disease(
    title: 'Card 4',
    tagline: 'Description for card 4',
    imageUrl:
        'https://www.mdpi.com/forests/forests-14-00619/article_deploy/html/images/forests-14-00619-g001.png',
    description: '''
### Header 4
Markdown content for Card 4.
''',
  ),
];
