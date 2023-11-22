import 'package:book_collection_mobile/models/book.dart';
import 'package:book_collection_mobile/widgets/background.dart';
import 'package:book_collection_mobile/widgets/right_drawer.dart';
import 'package:flutter/material.dart';

class SingleBookPage extends StatelessWidget {
  final Book book;

  const SingleBookPage({
    Key? key,
    required this.book,
  }) : super(key: key);

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
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Card(
              elevation: 10,
              child: Stack(children: [
                Opacity(
                    opacity: 0.1,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: const DecorationImage(
                              image: AssetImage("images/pattern.png"),
                              repeat: ImageRepeat.repeat)),
                    )),
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4)),
                      image: DecorationImage(
                          image: AssetImage("images/book_icon.png"),
                          fit: BoxFit.cover)),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20,
                      30 + MediaQuery.of(context).size.height * 0.35, 20, 20),
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            book.fields.name,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Color(0xff4b749f),
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                              margin: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                              child: Text(
                                book.fields.description,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Color(0xff4b749f), fontSize: 14),
                              )),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Chip(
                                label: Text(book.fields.dateAdded
                                    .toString()
                                    .substring(0, 10)),
                                backgroundColor: const Color(0xff4b749f),
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                              ),
                              Chip(
                                label: Text(
                                    "ID User : ${book.fields.user.toString()}"),
                                backgroundColor: const Color(0xff4b749f),
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                              ),
                              Chip(
                                label: Text(
                                    "Amount : ${book.fields.amount.toString()}"),
                                backgroundColor: const Color(0xff4b749f),
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ]),
                  ),
                )
              ]),
            ),
          ),
        )
      ]),
    );
  }
}
