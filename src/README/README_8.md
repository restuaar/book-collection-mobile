# BOOK COLLECTION

**Nama** : **Restu Ahmad Ar Ridho** <br/>
**NPM** : **2206028951** <br/>
**Kelas** : **PBP - E**

## List README Tugas Sebelumnnya

- [README TUGAS 7](./src/README/README_7.md)

## Perbedaan Antara `Navigator.push()` dan `Navigator.pushReplacement()`
`Navigator.push()` dan `Navigator.pushReplacement()` adalah dua metode yang digunakan dalam Flutter untuk berpindah antar halaman (routes) dalam aplikasi. Perbedaan utama antara keduanya adalah bagaimana mereka memanipulasi "list" navigasi.
  1. **`Navigator.push()`** <br/>
  Metode `Navigator.push()` digunakan untuk menambahkan halaman baru ke "list" navigasi. Dengan kata lain, halaman yang baru akan ditambahkan ke atas halaman yang sudah ada di "list". Ini membuat pengguna dapat kembali ke halaman sebelumnya dengan tombol "Back" pada device ataupun menggunakan metode `Navigator.pop()`.<br/>
  **Contoh Penggunaan:**  
      - Navigasi biasa antar halaman: Jika ingin menambahkan halaman baru ke tumpukan dan memungkinkan pengguna untuk kembali ke halaman sebelumnya dengan tombol "Back", `Navigator.push()` cocok digunakan.  
      -  Formulir atau apliaksi dengan langkah-langkah sekuensial: Misalnya, jika memiliki formulir dengan beberapa langkah, mungkin ingin menambahkan setiap langkah ke tumpukan menggunakan `Navigator.push()`.
  2. **`Navigator.pushReplacement()`**  
  Metode `Navigator.pushReplacement()` juga digunakan untuk berpindah ke halaman baru, tetapi dengan menggantikan halaman yang saat ini berada di atas tumpukan navigasi. Dengan kata lain, halaman yang saat ini ditampilkan akan dihapus dari tumpukan dan diganti oleh halaman yang baru.
  **Contoh Penggunaan:**  
      - Halaman login: Setelah pengguna berhasil login, mungkin ingin menggantikan halaman login dengan halaman beranda agar pengguna tidak dapat kembali ke halaman login dengan tombol "Back".
      - Halaman splash screen: Setelah tampilan pembukaan atau splash screen selesai, dapat menggantikannya dengan halaman utama.
      - Penggantian konten: Jika ingin menggantikan konten satu halaman dengan konten halaman lain


## Penjelasan _layout_ Widget pada Flutter
|    **Widget**    |    **Deskripsi**   |    **Kegunaan**    |
|   :-----------:  |    :-----------:   |     :-----------:  |
| Container | Widget dasar yang digunakan untuk mengatur tata letak dan dekorasi dari widget di dalamnya | Digunakan untuk mengelompokkan widget, memberikan padding, margin, dan memetakan ukuran widget di dalamnya |
| Row | Widget yang mengatur widget-widget didalamnya secara horizontal | Digunakan untuk menyusun widget anak secara berderet horizontal misalnya, untuk membuat baris tombol |
| Column | Widget yang mengatur widget-widget didalamnya secara vertikal | Digunakan untuk menyusun widget anak secara berderet vertikal misalnya, untuk membuat kolom teks|
| Stack | Widget yang menumpuk widget-widget didalamnya satu di atas yang lain| Digunakan ketika ingin meletakkan beberapa widget di atas satu sama lain, seperti gambar di atas teks atau membuat antarmuka pengguna yang kompleks |
| Expanded | Widget yang mengisi sebanyak mungkin ruang yang tersedia dalam widget induknya | Digunakan untuk memberikan ukuran yang dinamis pada widget didalamnya, terutama dalam `Row` atau `Column` |
| GridView | Widget untuk menampilkan widget-widget didalamnya dalam bentuk grid | Digunakan ketika ingin menampilkan data dalam bentuk grid, seperti galeri gambar atau tata letak aplikasi dengan item yang dapat diatur dalam baris dan kolom |
| Card | Widget yang memberikan bingkai visual dan bayangan pada widget di dalamnya seperti card | Cocok untuk menampilkan konten atau informasi dalam format yang terstruktur dan menarik, seperti kartu artikel atau kartu pengguna |
| ListView | Widget yang dapat menampung sejumlah besar widget didalamnya dan memungkinkan pengguna untuk dapat melakukan _scrolling_ | Digunakan ketika memiliki daftar item atau konten yang dapat digulir, seperti daftar pesan atau daftar produk |

## Elemen Input pada Form
1. **TextFormField untuk Judul Buku**:  
  Tipe Input: String  
  Kegunaan: Digunakan untuk mengambil judul buku dari pengguna.  
  Decoration: Digunakan untuk memberikan petunjuk visual tentang jenis informasi yang diharapkan dan memberikan estetika dengan ikon buku.  

2. **TextFormField untuk Banyak**:  
  Tipe Input: String (diubah menjadi int)  
  Kegunaan: Digunakan untuk mengambil jumlah (banyak) buku dari pengguna.  
  Decoration: Mirip dengan yang lain, memberikan petunjuk visual dan estetika dengan ikon angka.

3. **TextFormField untuk Deskripsi**:  
  Tipe Input: String  
  Kegunaan: Digunakan untuk mengambil deskripsi buku dari pengguna.  
  Decoration: Memberikan petunjuk visual dan estetika dengan ikon pena.

**Mengapa menggunakan elemen input ini**:  
  TextFormField ini adalah elemen input teks yang serbaguna dan dapat dikustomisasi dengan baik. Kita dapat menetapkan validator untuk memastikan data yang dimasukkan sesuai dengan kebutuhan aplikasi Kita.


## Penerapan _clean architecture_ pada Aplikasi Flutter
_Clean Architecture_ adalah suatu pendekatan arsitektur perangkat lunak yang bertujuan untuk memisahkan konsep-konsep tertentu dalam aplikasi sehingga perubahan pada satu bagian tidak akan berdampak pada bagian lainnya. Arsitektur ini dapat memudahkan pengujian unit serta pemeliharaan kode.

Implementasi Clean Architecture pada aplikasi Flutter melibatkan pembagian komponen-komponen utama ke dalam tiga lapisan utama: Presentasi (UI), Domain (Bisnis/Core), dan Data (Repository dan Sumber Eksternal). Selain itu, Dependency Injection digunakan untuk mengelola dependensi antar-lapisan. Pada tugas kali ini dilakukan _separation of concern_ (SoC) dengan melakukan pemisahan antara widget (komponen yang digunakan), screens (hal yang ditampilkan dalam kesatuan), models (sebagai model untuk komponen).

Penerapan Clean Architecture pada aplikasi Flutter memerlukan perencanaan struktur proyek yang baik, pemisahan tugas antar-lapisan, dan pengelolaan dependensi yang efektif. Dengan menggunakan Clean Architecture, kode akan lebih bersih, modular, dan mudah diujikan. Hal ini memungkinkan fleksibilitas dalam mengganti atau memodifikasi satu lapisan tanpa mempengaruhi lapisan lainnya.

## Implementasi Tugas
### Membuat Halaman Formulir Tambah Item.
  1. Membuat berkas baru yang bernama `booklist_form.dart` yang akan digunakan sebagai halaman formulir untuk menambah item.
  2. Membuat rangka page dan menambahkan appBar yang sudah digunakan pada page lainnya.
  3. Membuat elemen input sesuai dengan model yang akan kita buat dengan kode dibawah ini didalam suatu widget Column untuk menyusun kebawah
      ```dart
      ...
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
        ),
      ),
      ...
      ```
      > Ulang kode tersebut untuk menampilkan input text yang lain seperti Banyak dan Deskripsi
  4. Membuat validator agar sesuai dengan ketentuan yang diinginkan dengan menambahkan kode didalam class State-nya sebagai tempat menyimpan value.
      ```dart
      ...
      final _formKey = GlobalKey<FormState>();
      String _name = "";
      int _amount = 0;
      String _description = "";
      ...
      ```
  5. Dan menambahkan argumen `validator` pada widget `TextFormField` sebagai validasi input pengguna ketika dilakukan submit dengan menambahkan kode
      ```dart
      ...
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Deskripsi tidak boleh kosong!";
        }
        return null;
      },
      ...
      ```
      > Ulang kode tersebut pada setiap input text yang lain seperti Banyak dan Deskripsi sesuai dengan validasinya masing-masing
  6. Menambahkan tombol untuk menyimpan buku yang sudah dibuat dengan
      ```dart
      ...
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
                  ...
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
      ```

  7. Dan dengan menambahkan widget MySubmitButton pada Column yang menampung TextInputField juga dan melakukan _passing_ datanya.
  
### Mengarahkan Pengguna ke Halaman Formulir pada Halaman Utama
  1. Membuka berkas `menu_card.dart` yang sudah dilakukan SoC
  2. Kemudian ditambahkan kode dibawah untuk melakukan navigasi untuk melakukan pemindahan _page_ dengan `Navigator` pada Widget InkWel dan pada argumen onTap:
      ```dart
      ...
      if (item.name == "Tambah Item") {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const BookFormPage()));
      }
      ...
      ```

### Memunculkan Data Sesuai Isi dari Formulir
  1. Membuka berkas `booklist_form.dart` pada class `MyButtonSubmit` dilakukan penambahan kode yaitu pada argumen onPressed pada widget OutlinedButton.
      ```dart
      ...
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
                      ...
                    },
                  ),
                ],
              );
            },
          );
          _formKey.currentState!.reset();
        }
      },
      ...
      ```
  2. Pada kode tersebut akan dilakukan validasi yang jika berhasil akan menampilkan Pop Up buku yang sudah diisi pada TextInputField

### Membuat Drawer pada Aplikasi
  1. Membuat berkas baru bernama `right_drawer.dart` yang akan berisi widget drawer yang akan berada disebelah kanan
  2. Didalam berkas tersebut ditambahkan kode sebagai berikut untuk menampilkan Drawer sesuai dengan keinginan
      ```dart
      class RightDrawer extends StatelessWidget {
        const RightDrawer({super.key});

        @override
        Widget build(BuildContext context) {
          return Drawer(
            child: ListView(
              children: [
                ...
              ],
            ),
          );
        }
      }
      ```
  3. Menambahkan DrawerHeader untuk agar lebih indah dengan kode pada children ListView
      ```dart
      const DrawerHeader(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xff243748), Color(0xff4b749f)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.book_rounded,
              size: 40,
              color: Colors.white,
            ),
            Text(
              'Book Collection',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Text(
              "Tempat menyimpan buku untukmu!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      ```
  4. Menambahkan ListTile yang akan mengarahkan pengguna sesuai dengan textnya pada children ListView
      ```dart
      ListTile(
        leading: const Icon(Icons.home_outlined),
        title: const Text('Halaman Utama'),
        // Bagian redirection ke MyHomePage
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
        },
      ),
      ```
      > Ulang kode tersebut pada setiap screens yang dibuat agar dapat melakukan navigasi antar screen

## Bonus
1. Membuat halaman baru untuk menampilkan daftar item yang sudah dibuat dengan nama berkas `booklist.dart`
2. Membuat model untuk buku dan sebagai tempat menyimpan list buku yang sudah dibuat sebelumnnya pada berkas `book_model.dart`
3. Membuat widget custom yang digunakan untuk menampilkan setiap item yang dibuat pada berkas `book_listtile.dart` yang akan digunakan pada `booklist.dart` sebagai list pada children ListView
4. Menambahkan navigasi yang akan mengarahkan pengguna kehalaman tersebut pada berkas `menu_card.dart` yang akan mengarahkan dari menu, berkas `right_drawer.dart` yang akan mengarahkan dari drawer dan juga pada `booklist_form.dart` dimana setiap kali melakukan save maka akan diarahkan ke halaman tersebut
5. Ketika pengguna melakukan save akan dibuat Object Book baru sesuai input pengguna pada TextInputField dan dimasukkan kedalam list static pada Object Book. Sehingga pada berkas `booklist.dart` akan dilakukan iterasi dari list static tersebut.