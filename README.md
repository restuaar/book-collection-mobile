# BOOK COLLECTION

**Nama** : **Restu Ahmad Ar Ridho** <br/>
**NPM** : **2206028951** <br/>
**Kelas** : **PBP - E**

## List README Tugas Sebelumnnya

- [README TUGAS 7](./src/README/README_7.md)
- [README TUGAS 8](./src/README/README_8.md)

## Pengambilan Data JSON Tanpa Membuat Model dan Kelebihannya
Ya, kita dapat melakukan pengambilan dan penguraian data JSON tanpa membuat model terlebih dahulu. Biasanya dapat menggunakan fungsi atau metode yang disediakan oleh bahasa pemrograman atau framework untuk membaca dan mengubah data JSON ke dalam tipe data yang sesuai, seperti dalam Flutter menggunakan metode json.decode() untuk mengonversi string JSON menjadi tipe data Dart yang sesuai.

Apakah lebih baik atau tidak untuk membuat model terlebih dahulu sebelum melakukan pengambilan data JSON tergantung pada kompleksitas data yang akan olah dan kebutuhan aplikasi:
- **Kasus Pengambilan Data Sederhana**: Jika struktur data JSON yang ambil sederhana dan hanya membutuhkan beberapa nilai dari JSON, mungkin tidak perlu membuat model terlebih dahulu. bisa menggunakan metode `json.decode()` untuk mengubah JSON menjadi tipe data Dart seperti `Map<String, dynamic> atau List<dynamic>` dan mengakses nilai secara langsung. 
- **Struktur Data yang Lebih Kompleks**: Jika struktur data JSON kompleks dan perlu mengelola banyak data dengan hubungan yang lebih dalam antara bidang-bidangnya, maka membuat model (class) sebelumnya dapat membantu dalam pemetaan data dan pemeliharaan kode.


## Fungsi dari CookieRequest dan Kegunaan Untuk Dibagikan Semua Komponen
`CookieRequest` adalah objek yang digunakan untuk membuat permintaan HTTP dengan menyertakan informasi cookie. CookieRequest digunakan untuk menambahkan atau memanipulasi cookie yang akan disertakan dalam permintaan HTTP yang dibuat oleh aplikasi seperti ketika membuat permintaan ke server menggunakan HTTP (misalnya dengan menggunakan http.get, http.post, atau pustaka HTTP lainnya).

Keuntungan dari membagikan instance CookieRequest ke semua komponen di aplikasi Flutter:

 - **Konsistensi**: Memastikan bahwa semua permintaan HTTP yang dibuat dari berbagai bagian atau komponen aplikasi menggunakan cookie yang sama dan sesuai.

 - **Pengelolaan yang Mudah**: Dengan membagikan instance yang sama, dapat dengan mudah mengelola cookie yang ingin disertakan dalam permintaan dari satu tempat. Misalnya, dapat menambahkan, menghapus, atau memperbarui cookie di satu titik, dan perubahan ini akan tercermin dalam semua permintaan HTTP yang dibuat menggunakan instance CookieRequest yang sama.

 - **Mengurangi Redundansi Kode**: Dengan menggunakan instance yang dibagikan, tidak perlu membuat atau mengonfigurasi ulang cookie dalam setiap komponen yang memerlukannya. Hal ini mengurangi redundansi kode dan membuat pengelolaan cookie menjadi lebih terpusat.

## Mekanisme Pengambilan Data dari JSON
1. **Ambil Data dari Sumber Eksternal (API, File, dll.)**:  
Data JSON bisa diperoleh dari berbagai sumber seperti API HTTP, penyimpanan lokal, atau bahkan file JSON yang disertakan dalam proyek Flutter. Untuk mengambil data dari API, biasanya akan menggunakan metode http.get atau pustaka HTTP lainnya untuk melakukan permintaan ke server dan menerima respons berupa JSON.
2. **Parse Data JSON**:  
Setelah data JSON diterima, langkah berikutnya adalah mengurai atau mengekstrak informasi yang relevan dari struktur JSON. Anda dapat menggunakan fungsi bawaan seperti json.decode() untuk mengonversi string JSON menjadi tipe data Dart yang sesuai, seperti `Map<String, dynamic> atau List<dynamic>`.
3. **Model Data (Opsional)**:  
Untuk mempermudah pengelolaan data dan memastikan kejelasan struktur data, Anda dapat membuat model (class) yang merepresentasikan entitas dari data JSON. Ini membantu dalam pengorganisasian data dan memudahkan pemahaman terhadap struktur data yang digunakan.
4. **Tampilkan Data pada Widget Flutter**:
Setelah data berhasil diambil dan diuraikan, langkah terakhir adalah menampilkannya pada widget atau antarmuka pengguna di Flutter. Dapat menggunakan widget-widget seperti Text, ListView, GridView, Card, dan lainnya untuk menampilkan data sesuai kebutuhan dalam aplikasi Flutter.


## Widget yang Digunakan
|       **_Widget_**    |    **Fungsi**    |
|    :-----------:   |    :-----------:     |
|  Navigator | Digunakan untuk mengelola navigasi antara berbagai layar atau halaman (routes) dalam aplikasi Flutter |
| Provider | Digunakan untuk membagikan dan mengakses data di seluruh bagian aplikasi Flutter tanpa perlu meneruskan data secara langsung dari widget satu ke widget lainnya |
| FutureBuilder | Digunakan untuk membuat tampilan UI yang responsif berdasarkan hasil yang diberikan oleh sebuah `Future` |
| ElevatedButton | Tombol ini memiliki penampilan yang diangkat (raised) atau menonjol yang memberikan kesan interaktif kepada pengguna |


## Implementasi Tugas
## Membuat Halaman Login Flutter.
1. Membuat berkas baru pada `screens` dengan nama `login.dart`
2. Menambahkan kode seperti diberkas `login.dart` yang sudah dibuat.
3. Melakukan import ke `main.dart` dan mengganti HomePage dengan LoginApp

### Membuat Halaman Login di Django.
  1. Menambahkan App baru pada proyek Django `book-collecion` sebelumnnya.
  2. Menambahkan `corsheader` pada proyek Django.
  3. Melakukan setting pada berkas `setting.py` pada _main proyek_ dengan menambahkan
      ```python
      CORS_ALLOW_ALL_ORIGINS = True
      CORS_ALLOW_CREDENTIALS = True
      CSRF_COOKIE_SECURE = True
      SESSION_COOKIE_SECURE = True
      CSRF_COOKIE_SAMESITE = 'None'
      SESSION_COOKIE_SAMESITE = 'None'
      ```
  4. Membuat metode view pada berkas `views.py` pada folder app baru tersebut.
      ```python
      from django.shortcuts import render
      from django.contrib.auth import authenticate, login as auth_login, logout as auth_logout
      from django.http import HttpResponse, JsonResponse
      from django.views.decorators.csrf import csrf_exempt
      from django.contrib.auth.models import User


      @csrf_exempt
      def register(request):
          username = request.POST['username']
          password1 = request.POST['password1']
          password2 = request.POST['password2']

          if password1 == password2:
              user = User.objects.create_user(username=username, password=password1)
              auth_login(request, user)
              return JsonResponse({
                  "username": username,
                  "status": True,
                  "message": "Register sukses!"
              }, status=200)
          else:
              return JsonResponse({
                  "status": False,
                  "message": "Register gagal, kata sandi tidak sama."
              }, status=401)


      @csrf_exempt
      def login(request):
          username = request.POST['username']
          password = request.POST['password']
          user = authenticate(username=username, password=password)
          if user is not None:
              if user.is_active:
                  auth_login(request, user)
                  response =  JsonResponse({
                      "username": user.username,
                      "status": True,
                      "message": "Login sukses!"
                      # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
                  }, status=200)
                  
                  return response
              else:
                  return JsonResponse({
                      "status": False,
                      "message": "Login gagal, akun dinonaktifkan."
                  }, status=401)

          else:
              return JsonResponse({
                  "status": False,
                  "message": "Login gagal, periksa kembali email atau kata sandi."
              }, status=401)


      @csrf_exempt
      def logout(request):
          username = request.user.username

          try:
              auth_logout(request)
              return JsonResponse({
                  "username": username,
                  "status": True,
                  "message": "Logout berhasil!"
              }, status=200)
          except:
              return JsonResponse({
                  "status": False,
                  "message": "Logout gagal."
              }, status=401)

      ```
      > untuk login, logout dan register
  5. Membuat berkas url agar dapat disambukan melalui endpoint dan tambahkan pada url pada main proyek.
      ```python
      from django.urls import path
      from authentication.views import *

      app_name = 'authentication'

      urlpatterns = [
          path('register/', register, name='register'),
          path('login/', login, name='login'),
          path('logout/', logout, name='logout'),
      ]

      ```
  6. Menambahkan package ke proyek Flutter yaitu
      ```bash
      flutter pub add provider
      flutter pub add pbp_django_auth
      ```
  7. Menambahkan CookieRequest pada `main.dart` agar dapat membuat cookies keseluruh widget didalamnnya
### Membuat Model Baru
1. Membuat berkas book.dart pada folder `models`
2. Menambahkan hasil convert dari Quicktype yaitu agar sesuai dengan data JSON yang dikembalikan dalam proyek Django

## Membuat Halaman yang Menampilkan Semua Data dan Halaman Detail
1. Membuat berkas `book_list.dart` dan menambahkan kode yang tertera pada file tersebut, untuk mendapatkan data dapat digunakan
    ```dart
    ...
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
    ... 
    ```
2. Agar dapat menampilkan data yang di get dari url yang diberikan.
3. Menambahkan Widget InkWell sehingga terdapat method onTap agar jika di tap akan mempassing ke SingleBookPage
4. Untuk menampilkan detail suatu item dibuat berkas `single_book.dart` yang akan menerima data berupa model `Book` yang sudah dibuat sebelumnnya yang didapat dari `book_list.dart` sehingga dapat ditampilkan ke Flutter.

## Bonus
Membuat SignUp page.