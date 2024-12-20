import 'package:flutter/material.dart';
import 'package:tugas/layout/model/Getnews.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:tugas/layout/home/apiPage/newscard.dart'; // Updated import

class Newspage extends StatefulWidget {
  const Newspage({Key? key}) : super(key: key);

  @override
  State<Newspage> createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  late Future<List<Getnews>> futurePosts;

  Future<List<Getnews>> fetchPosts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      var getPostsData = json.decode(response.body) as List;
      return getPostsData.map((i) => Getnews.fromJson(i)).toList();
    } else {
      throw Exception('Failed to load Posts');
    }
  }

  @override
  void initState() {
    super.initState();
    futurePosts = fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post List", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: FutureBuilder<List<Getnews>>(
        future: futurePosts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Newscard(getnews: snapshot.data![index]),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}