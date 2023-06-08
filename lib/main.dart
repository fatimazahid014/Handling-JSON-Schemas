import 'dart:async';
import 'dart:convert';
import 'dart:io';
import '../models/search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}
// Async method to fetch the JSON data

class _MyAppState extends State<MyApp> {
  late String search;
  @override
  initState() {
    super.initState();
    fetchUrlToDartObject();
  }

  String convertToJSON(List<Search> searches) {
    print(searches);
    String json = '[';
    searches.forEach((search) {
      json += search.toJson().toString();
    });
    json += ']';
    return json;
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    print("Path:$path");
    return File('$path/searchlist.json');
  }

  Future<File> writeCounter(String data) async {
    final file = await _localFile;
    // Write the file
    return file.writeAsString(data);
  }

  Future<List<Search>> fetchUrlToDartObject() async {
    final response = await http
        .get(Uri.parse('https://codewithandrea.com/search/search.json'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<dynamic> results = json.decode(response.body)['results'];
      List<Search> list = results.map<Search>((json) {
        return Search.fromJsonOrNull(json);
      }).toList();
      String data = convertToJSON(list);
      writeCounter(data);
      // print(json);
      return list;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<List<Search>> readJsonFile() async {
      List<Search> myArticles = [];

      try {
        String myString = await DefaultAssetBundle.of(context)
            .loadString('assets/searchlist.json');
        List myMap = jsonDecode(myString);
        myMap.forEach((dynamic article) {
          Search myArticle = Search.fromJsonOrNull(article);
          myArticles.add(myArticle);
        });
      } catch (e) {
        print(e);
      }
      return myArticles;
    }

    Future<String> readJsonFileToString() async {
      String myString = "";
      try {
        myString = await DefaultAssetBundle.of(context)
            .loadString('assets/searchlist.json');
        return myString;
      } catch (e) {
        print(e);
      }
      return myString;
    }

    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
          backgroundColor:Colors.red,
        ),
        // body: FutureBuilder<String>(
        //   future: readJsonFileToString(),
        //   initialData: "",
        //   builder: (context, snapshot) {
        //     return snapshot.hasData
        //         ? Text(snapshot.data as String)
        body: FutureBuilder<List>(
          future: readJsonFile(),
          initialData: [],
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      final item = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text("Title: ${item.title}"),
                          subtitle: Text("Url: ${item.url}"),
                        ),
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
