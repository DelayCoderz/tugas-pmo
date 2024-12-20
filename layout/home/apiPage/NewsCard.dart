import 'package:flutter/material.dart';
import 'package:tugas/layout/model/Getnews.dart'; // Import model data berita
import 'Detailnewspage.dart'; // Import halaman detail berita

class Newscard extends StatelessWidget {
  const Newscard({Key? key, required this.getnews}) : super(key: key);

  final Getnews getnews; // Variabel untuk menampung data berita

  @override
  Widget build(BuildContext context) {
    return InkWell( // Widget yang dapat diklik
      onTap: () {
        Navigator.push( // Navigasi ke halaman detail
          context,
          MaterialPageRoute(
            builder: (context) {
              return Detailnewspage(getnews: getnews); // Kirim data berita ke halaman detail
            },
          ),
        );
      },
      child: Container(
        decoration: const BoxDecoration(color: Colors.white), // Dekorasi container
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alignment teks ke kiri
          children: [
            // Text(posts.id.toString()), // Mungkin untuk debugging, bisa dihapus
            Text(
              getnews.title, // Menampilkan judul berita
              style: const TextStyle(
                fontWeight: FontWeight.bold, // Teks tebal
              ),
            ),
            const SizedBox(height: 10), // Spasi vertikal
            Text(getnews.body), // Menampilkan isi berita
          ],
        ),
      ),
    );
  }
}