// ignore_for_file: use_build_context_synchronously

import 'package:book_collection_mobile/screens/book_list.dart';
import 'package:book_collection_mobile/screens/login.dart';
import 'package:flutter/material.dart';
// import 'package:book_collection_mobile/screens/booklist.dart';
import 'package:book_collection_mobile/models/menu_item.dart';
import 'package:book_collection_mobile/screens/booklist_form.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItem item;

  const MenuItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: item.color ?? Colors.blueGrey[700],
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () async {
          ScaffoldMessenger.of(context)
            ..hideCurrentMaterialBanner()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}")));

          if (item.name == "Tambah Buku") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const BookFormPage()));
          } else if (item.name == "Lihat Buku") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const BookPage()));
          } else if (item.name == "Logout") {
            final response = await request.logout(
                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                "http://127.0.0.1:8000/auth/logout/");
            String message = response["message"];
            if (response['status']) {
              String uname = response["username"];
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message Sampai jumpa, $uname."),
              ));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(message),
              ));
            }
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 3),
                  child: Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
