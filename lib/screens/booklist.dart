import 'package:book_collection_mobile/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:book_collection_mobile/models/book_models.dart';

class BookList extends StatelessWidget {
  BookList(Book book, {super.key}) {
    Book.listBook.add(book);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            "Book Collection",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0xff243748), Color(0xff4b749f)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
          ),
        ),
        body: Stack(
          children: [
            const MyBackground(),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: GridView.count(
                  primary: true,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  children: Book.listBook.map((Book book) {
                    return Placeholder();
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
