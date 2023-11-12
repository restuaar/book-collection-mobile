# BOOK COLLECTION

**Nama** : **Restu Ahmad Ar Ridho** <br/>
**NPM** : **2206028951** <br/>
**Kelas** : **PBP - E**

## Perbedaan _Stateless Widget_ dan _Stateful Widget_ Dalam Flutter
|       **_Stateless_**    |    **_Stateful_**    |
|    :-----------:   |    :-----------:     |
| _Widget_ yang tidak memiliki keadaan yang dapat berubah setelah dibuat. Ini berarti setiap kali ingin mengubah tampilan _widget_, kita harus membuat _widget_ yang baru. Misalnya, menggunakan _StatelessWidget_ untuk menampilkan teks statis atau ikon yang tidak akan berubah. | _Widget_ yang memiliki keadaan yang dapat berubah. Ini memungkinkan untuk memperbarui tampilan _widget_ ketika ada perubahan keadaan. Misalnya, menggunakan _StatefulWidget_ untuk membuat _widget_ yang dapat menanggapi input pengguna. |
| Didefinisikan dalam metode `build()` yang disediakan oleh _widget_, dan tampilan tersebut tidak dapat berubah selama _widget_ ada. | Terdiri dari dua kelas, yaitu _StatefulWidget_ dan _State_ yang berisi keadaan _widget_. Perubahan keadaan disimpan dalam objek _State_, dan ketika perubahan terjadi, `build()` dijalankan ulang untuk memperbarui tampilan _widget_. |
Lebih efisien karena tidak memerlukan pembaruan berkelanjutan dan dapat dirender ulang tanpa mempertimbangkan perubahan keadaan. | - |

## Widget dan Fungsinya
|       **_Widget_**    |    **Fungsi**    |
|    :-----------:   |    :-----------:     |
| Scaffold | Digunakan untuk membuat kerangka kerja dasar dalam aplikasi |
| AppBar | Digunakan untuk membuat bilah aplikasi di atas layar dalam aplikasi |
| Text | Digunakan untuk menampilkan teks dalam antarmuka pengguna |
| Container | Digunakan untuk mengelilingi dan mengatur tampilan dan dekorasi dari satu atau beberapa _widget_ lain |
| SingleChildScrollView | Digunakan untuk membuat area gulir yang hanya mengizinkan satu elemen anak secara vertikal |
| Padding | Digunakan untuk menambahkan jarak atau ruang putih di sekitar _widget_ |
| Column | Digunakan untuk menyusun widget anak secara vertikal dalam satu kolom |
| GridView | Digunakan untuk membuat tata letak yang mengatur widget anak dalam bentuk _grid_ (kisi) berdasarkan baris dan kolom. |
| Material | Widget dasar yang menyediakan material design, yang merupakan pedoman desain antarmuka pengguna yang dikembangkan oleh Google |
| InkWell | Digunakan untuk menambahkan respons saat disentuh (interaktivitas) ke dalam elemen |
| Icon | Digunakan untuk menampilkan ikon grafis |

## Implementasi Tugas
### Membuat Program Flutter
  1. Membuka vscode dan menekan tombol `F1` pada _keyboard_ kemudian cari `"Flutter: New Project"` dan tekan Enter.
  2. Memilih template yang diberikan yaitu Application dan menentukan berkas sebagai tempat dari proyek Flutter.
  3. Memberikan nama proyek `book_collection_mobile`.
  4. Menghapus kode pada `main.dart`.

### Membuat 3 Tombol Sederhana dengan Icon dan Teks
  1. Menambahkan kode pada berkas `main.dart` dengan _Stateless Widget_ yang akan mereturn class HomePage yang dibuat pada berkas `menu.dart`.
  2. Pada berkas `menu.dart` membuat tampilan untuk kerangka dengan Scaffold yaitu pada appBar dan body sebagai tempat untuk button.
  3. Menambahkan AppBar dengan kode:
      ```dart
        class HomePage extends StatelessWidget {
        const HomePage({super.key});

        @override
        Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
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
          );
        }
      }
      ```
  4. Membuat kelas untuk ItemMenu untuk menyimpan properti yang digunakan dan juga membuat list/array untuk menyimpan ItemMenu yang akan digunakan dengan kode
      ```dart
      class MenuItem {
        final String name;
        final IconData icon;
        final Color? color;

        MenuItem(this.name, this.icon, {this.color});
      }

      final List<MenuItem> items = [
        MenuItem("Lihat Item", Icons.book, color: Colors.blueGrey[300]),
        MenuItem("Tambah Item", Icons.add, color: Colors.cyan[900]),
        MenuItem("Logout", Icons.logout),
      ];
      ```
  5. Membuat card yang akan menampilkan 3 tombol tersebut dengan kode.
      ```dart
      class MenuItemCard extends StatelessWidget {
      final MenuItem item;

      const MenuItemCard(this.item, {super.key});

      @override
      Widget build(BuildContext context) {
        return Material(
          borderRadius: BorderRadius.circular(10),
          color: item.color ?? Colors.blueGrey[700],
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
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
      ```
  6. Menampilkan item-item yang sudah didefinisikan kedalam body pada Scaffold agar dapat ditampilkan dengan kode
      ```dart
      class HomePage extends StatelessWidget {
      const HomePage({super.key});

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: ...,
          body: SingleChildScrollView(
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
          );
        }
      }
      ```

### Memunculkan SnackBar
  1. Menambahkan kode onTap pada _widget_ InkWel pada MenuItemCard agar setiap tombol dipencet akan menampilkan SnackBar dengan kode
      ```dart
      class MenuItemCard extends StatelessWidget {
      final MenuItem item;

      const MenuItemCard(this.item, {super.key});

      @override
      Widget build(BuildContext context) {
        return Material(
          ...,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              ScaffoldMessenger.of(context)
                ..hideCurrentMaterialBanner()
                ..showSnackBar(SnackBar(
                    content: Text("Kamu telah menekan tombol ${item.name}")));
            },
            child: ...,
            ),
          );
        }
      }  
      ```

### Bonus
Sudah dikerjakan dengan menambahkan field color dengan tipe Color dan menggunakan Color pada _widget_ Material dengan field color yang ada pada kelas ItemMenu. 

