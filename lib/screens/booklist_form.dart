import 'package:book_collection_mobile/models/book_models.dart';
import 'package:book_collection_mobile/screens/booklist.dart';
import 'package:flutter/material.dart';
import 'package:book_collection_mobile/widgets/background.dart';
import 'package:book_collection_mobile/widgets/right_drawer.dart';

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
    return Scaffold(
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
                        child: MySubmitButton(
                            formKey: _formKey,
                            name: _name,
                            amount: _amount,
                            description: _description),
                      ),
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

class MySubmitButton extends StatelessWidget {
  const MySubmitButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required String name,
    required int amount,
    required String description,
  })  : _formKey = formKey,
        _name = name,
        _amount = amount,
        _description = description;

  final GlobalKey<FormState> _formKey;
  final String _name;
  final int _amount;
  final String _description;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xff4b749f),
          minimumSize: const Size(160, 50),
          shape: const StadiumBorder(),
          side: const BorderSide(width: 3, color: Color(0xff243748))),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text(
                  'Buku berhasil tersimpan',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Judul: $_name'),
                      Text('Banyak: $_amount'),
                      Text('Deskripsi: $_description'),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    child: const Text(
                      'OK',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Book book = Book(_name, _amount, _description);
                      
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return BookList(book);
                      })));
                    },
                  ),
                ],
              );
            },
          );
          _formKey.currentState!.reset();
        }
      },
      child: const Text(
        "SAVE",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
