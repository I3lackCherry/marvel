import 'package:flutter/material.dart';
import 'package:comics/pages/Comic.dart';


class ComicPage extends StatelessWidget {
  final Comic comic;

  ComicPage(this.comic);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(comic.title, style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              comic.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(comic.description),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: comic.images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      comic.images[index],
                      width: 200,
                      height: 600,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
