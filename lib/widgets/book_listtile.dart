import 'package:flutter/material.dart';
import 'package:book_collection_mobile/models/book_models.dart';

class BookListTile extends StatelessWidget {
  final Book book;
  const BookListTile(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      color: Colors.white,
      child: ListTile(
        leading: const Icon(
          Icons.book_rounded,
          color: Color(0xff4b749f),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Chip(
              label: Text("${book.amount}"),
              backgroundColor: const Color(0xff4b749f),
              labelStyle: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              book.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(book.description),
          ],
        ),
      ),
    );
  }
}
