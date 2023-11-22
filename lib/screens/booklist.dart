import 'package:flutter/material.dart';
import 'package:book_collection_mobile/widgets/right_drawer.dart';
import 'package:book_collection_mobile/widgets/background.dart';
import 'package:book_collection_mobile/widgets/book_listtile.dart';
import 'package:book_collection_mobile/models/book_model.dart';

class BookList extends StatelessWidget {
  const BookList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            ),
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
        endDrawer: const RightDrawer(),
        body: Stack(
          children: [
            const MyBackground(),
            Container(
              padding: const EdgeInsets.all(4),
              child: ListView(
                children: Book.listBook.map((Book book) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: BookListTile(book),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
