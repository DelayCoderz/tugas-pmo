import 'package:flutter/material.dart';
import 'package:tugas/layout/model/Getnews.dart';

class Detailnewspage extends StatelessWidget {
  final Getnews getnews;

  const Detailnewspage({Key? key, required this.getnews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID: ${getnews.id}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text('Title: ${getnews.title}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  const Text('Body:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(getnews.body, style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
