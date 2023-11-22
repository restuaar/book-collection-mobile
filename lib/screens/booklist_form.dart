// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:book_collection_mobile/screens/menu.dart';
import 'package:flutter/material.dart';
// import 'package:book_collection_mobile/models/book_model.dart';
// import 'package:book_collection_mobile/screens/booklist.dart';
import 'package:book_collection_mobile/widgets/background.dart';
import 'package:book_collection_mobile/widgets/right_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class BookFormPage extends StatefulWidget {
  const BookFormPage({super.key});

  @override
  State<BookFormPage> createState() => _BookFormPageState();
}

class _BookFormPageState extends State<BookFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  String _description = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
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
      body: Stack(
        children: [
          const MyBackground(),
          Container(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 80,
                      width: 80,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("images/book_icon.png")),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Tambah Buku",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const Text("Tambah detail buku dibawah ini"),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Judul Buku",
                          labelText: "Judul Buku",
                          prefixIcon: const Icon(
                            Icons.book_rounded,
                            color: Colors.black87,
                          ),
                          fillColor: const Color.fromRGBO(225, 245, 254, 0.4),
                          filled: true,
                          labelStyle: const TextStyle(color: Colors.black87),
                          focusColor: Colors.black87,
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _name = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Judul tidak boleh kosong!";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Banyak",
                          labelText: "Banyak",
                          prefixIcon: const Icon(
                            Icons.numbers_rounded,
                            color: Colors.black87,
                          ),
                          fillColor: const Color.fromRGBO(225, 245, 254, 0.4),
                          filled: true,
                          labelStyle: const TextStyle(color: Colors.black87),
                          focusColor: Colors.black87,
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _amount = int.parse(value!);
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Banyak tidak boleh kosong!";
                          }
                          if (int.tryParse(value) == null) {
                            return "Banyak harus berupa angka!";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Deskripsi",
                          labelText: "Deskripsi",
                          prefixIcon: const Icon(
                            Icons.edit,
                            color: Colors.black87,
                          ),
                          fillColor: const Color.fromRGBO(225, 245, 254, 0.4),
                          filled: true,
                          labelStyle: const TextStyle(color: Colors.black87),
                          focusColor: Colors.black87,
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black87),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _description = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Deskripsi tidak boleh kosong!";
                          }
                          return null;
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: const Color(0xff4b749f),
                                minimumSize: const Size(160, 50),
                                shape: const StadiumBorder(),
                                side: const BorderSide(
                                    width: 3, color: Color(0xff243748))),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                // Kirim ke Django dan tunggu respons
                                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                                final response = await request.postJson(
                                    "http://127.0.0.1:8000/create-flutter/",
                                    jsonEncode(<String, String>{
                                      'name': _name,
                                      'amount': _amount.toString(),
                                      'description': _description,
                                    }));
                                if (response['status'] == 'success') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content:
                                        Text("Produk baru berhasil disimpan!"),
                                  ));
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text(
                                        "Terdapat kesalahan, silakan coba lagi."),
                                  ));
                                }
                              }
                            },
                            child: const Text(
                              "SAVE",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
