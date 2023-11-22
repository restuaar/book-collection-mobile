import 'package:book_collection_mobile/screens/single_book.dart';
import 'package:book_collection_mobile/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:book_collection_mobile/models/book.dart';
import 'package:book_collection_mobile/widgets/right_drawer.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  Future<List<Book>> fetchBook() async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    var url = Uri.parse('http://127.0.0.1:8000/json/');
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var books = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi books json menjadi object Product
    List<Book> listBook = [];
    for (var book in books) {
      if (book != null) {
        listBook.add(Book.fromJson(book));
      }
    }
    return listBook;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        drawer: const RightDrawer(),
        body: Stack(children: [
          const MyBackground(),
          FutureBuilder(
              future: fetchBook(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (!snapshot.hasData) {
                    return const Column(
                      children: [
                        Text(
                          "Tidak ada data produk.",
                          style:
                              TextStyle(color: Color(0xff243748), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                      ],
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Material(
                                elevation: 5,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
                                child: InkWell(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  onTap: () {
                                    snapshot.data![index].pk.toString();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SingleBookPage(
                                                  book: snapshot.data![index],
                                                )));
                                  },
                                  child: ListTile(
                                    leading: const Icon(
                                      Icons.book_rounded,
                                      color: Color(0xff4b749f),
                                    ),
                                    title: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Chip(
                                          label: Text(
                                              "${snapshot.data![index].fields.amount}"),
                                          backgroundColor:
                                              const Color(0xff4b749f),
                                          labelStyle: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          "${snapshot.data![index].fields.name}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    subtitle: Text(
                                        "${snapshot.data![index].fields.description}"),
                                  ),
                                ),
                              ),
                            ));
                  }
                }
              })
        ]));
  }
}
