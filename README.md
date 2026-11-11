# myportofolio_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


### Tugas 7

1. widget tree merupakan representasi dari semua widget UI. Pada saat widget parent di rebuild, widget child juga akan ikut di rebuild. 
2. a. StatelessWidget: merupakan widget yang tidak membutuhkan mutable state. Stateless widget berguna ketika UI yang kita gunakan tidak bergantung pada apapun selain konfigurasi informasi di objek itu sendiri & BuildContext dari widget itu sendiri.
b. Scaffold class merupakan widget yang mengimplementasikandasar Material Design untuk struktur layout visual.
c. AppBar merupakan widget yang berfungsi untuk meletakan app bar di bagian atas layar.
d. Text berfungsi untuk menampilkan string teks dengan satu gaya 
e. TextStyle merupakan widget yang mendeskripsikan bagaimana memformat & mewarnai teks
f.Theme merupakan widget yg mendeskripsikan warna & tipografi pilihan dari aplikasi
g.Padding merupakan widget yang memberikan padding kepada anak-anak widgetnya
h. EdgeInsets merupakan wiget yang memberikan jarak untuk sebuah widget yang ada di dalam kotak  dari pinggir 
i. Column merupakan widget yang menampilkan anak-anaknya di array vertikal
j. CrossAxisAlignment mendeskripsikan bagaimana anak widget harus ditempatkan sepanjang cross axis di flex layout
k. Row merupakan widget yang menampilkan anak-anaknya di array horizontal
l. MainAxisAlignment mendeskripsikan bagaimana anak widget harus ditempatkan sepanjang main axis di flex layout
m. SizedBox merupakan widget box dengan ukuran ygg ditentukan
n. Center merupakan widget yang menempatkan anak-anak widgetnya di tengah
o. FontWeight merupakan widget yang menentukan ketebalan font
p. GridView merupakan widget yang membuat layout dengan beberapa tiles di sepanjang cross axis
q. BuildContext merupakan widget yang menghandle lokasi dari widget di widget tree
r. Card merupakan widget yang membuat panel dengan ujung bulat & sebuah bayangan elevasi.
s. Container merupakan widget yang membantu untuk mengkombinasikan pewarnaan, posisi, & ukuran widget
t. MediaQuery membentuk subpohon tempat kueri media mengarah ke data yang diberikan.
v. Material merupakan widget yang mengatur bagaimana visual & bayangan antar widget
w. BorderRadius merupakan widget yang mengatur radius bagi masing-masing border.
x. InkWell merupakan material persegi panjang yyang merespon terhadap sentuhan
y. ScaffoldMessenger mengatur SnackBars & MaterialBanners untuk Scaffold descendant
z. TextAlign mengatur alignment dari teks yg ada
aa. MaterialApp merupakan widget yang menggabungkan beberapa widget yang umum dibutuhkan untuk Material Design Applications
bb. ThemeData mendefinisikan konfigurasi tema visual secara keseluruhan untuk MaterialApp atau widget subtree
cc. ColorScheme merupakan widget yang mencakup 45 warna yang bisa digunakan untuk mengkonfigurasi warna properti
dd. Colors merupakan widget yang bisa digunakan untuk mengatur warna widget dari palet warna

3. MaterialApp merupakan widget yang menggabungkan beberapa widget yang umum dibutuhkan untuk Material Design Applications. Widget ini umum digunakan sebagai root widget kakrena dapat menggabungkan beberapa widget yg umum digunakan. Selain itu, widget ini juga dibangung di atas WidgetsApp dengan menambahkan fungsional yang spesifik secara material desain

4. StatelessWidget & StatefulWdiget memiliki perbedaan dari cara mengatur UI nya. StatefulWidget dapat mendeskripsikan perubahan secara dinamis sedangkan StatelessWidget tidak. StatelessWidget baik untuk digunakan jika kita tidak memerlukan untuk mengganti UI secara dinamis berdasarkan interaksi. StatefulWidget baik digunakan jika UI yang kita buat harus berubah secara dinamis berdasarkan interaksi user & aplikasi.

5. BuildContext merupakan Sebuah pegangan ke lokasi widget dalam pohon widget. Kelas ini menyajikan serangkaian metode yang dapat digunakan dari metode StatelessWidget. Setiap widget memiliki BuildContext-nya sendiri, yang menjadi induk dari widget yang dikembalikan oleh fungsi StatelessWidget.build atau State.build. Secara khusus, ini berarti bahwa di dalam metode build, konteks build dari widget yang memiliki metode build tidak sama dengan konteks build dari widget yang dikembalikan oleh metode build.

7. Hot reload mereload perubahan kode ke VM & membangun ulang widget tree sambil menyimpan state. Hot restart mereload perubahan kode ke VM & membangun ulang widget tree tidak menyimpan state. Kita tidak bisa mengandalkan hot reload ketika kita 
ingin mereset state dari sistem kita karena hot reload tetap menyimpan state sebelumnya. Oleh karena itu, Hot restart & Full restart harus digunakan

### AI Disclosure
Saya tidak menggunakan AI dalam pengerjaan tugas 7. Seluruh pengerjaan saya lakukan secara manual dengan membaca kode & dokumentasi yang tersedia di website Flutter yang tersedia di https://api.flutter.dev/index.html.

Selain itu saya juga membaca beberapa dokumentasi yg ada di link berikut
https://medium.com/easy-flutter/understanding-stateless-widget-and-stateful-widget-in-flutter-a-comprehensive-guide-1fa5f81510a9

> Keterbatasan AI: tidak tahu karena saya tidak pakai untuk tugas ini
> Perbaikan manual yang dilakukan: Saya mendebug closing tag & bracket yang muncul karena kesalahan ketik, dsb. 