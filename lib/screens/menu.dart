import 'package:book_collection_mobile/widgets/right_drawer.dart';
import 'package:flutter/material.dart';
import 'package:book_collection_mobile/widgets/menu_card.dart';
import 'package:book_collection_mobile/widgets/background.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<MenuItem> items = [
    MenuItem("Lihat Item", Icons.book, color: Colors.blueGrey[300]),
    MenuItem("Tambah Item", Icons.add, color: Colors.cyan[900]),
    MenuItem("Logout", Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    child: Text(
                      "Welcome to Book Collection",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((MenuItem item) {
                      return MenuItemCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}