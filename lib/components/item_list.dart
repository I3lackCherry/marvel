import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Каталог комиксов',
      home: ComicsCatalog(),
    );
  }
}

class ComicsCatalog extends StatelessWidget {
  final List<Map<String, String>> comics = [
    {
      'title': 'Комикс 1',
      'description': 'Description for Comic 1',
      'imagePath': 'assets/comic1.jpg',
    },
    {
      'title': 'Комикс 2',
      'description': 'Description for Comic 2',
      'imagePath': 'assets/comic2.jpg',
    },
    {
      'title': 'Комикс 3',
      'description': 'Description for Comic 3',
      'imagePath': 'assets/comic3.jpg',
    },
  ];

  int _selectedComicIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Каталог комиксов'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Список комиксов',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: comics.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _selectedComicIndex = index;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ComicDetailPage(
                          title: comics[index]['title']!,
                          description: comics[index]['description']!,
                          imagePath: comics[index]['imagePath']!,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(comics[index]['imagePath']!),
                      ),
                      title: Text(comics[index]['title']!),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ComicDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  ComicDetailPage({required this.title, required this.description, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(description),
          ),
          Expanded(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}