import 'package:first_api1/Model/jason/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Model> postList = [];
  Future<List<Model>> getPostApi() async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    );
    //  here decode the jason into data
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      postList.clear();
      for (var i in data) {
        postList.add(Model.fromJson(i as Map<String, dynamic>));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      appBar: AppBar(title: Text("Api Tutorial"),
      backgroundColor: Colors.tealAccent,),
      body: 
         Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator(),);
                  } else {
                    return ListView.builder(
                      itemCount: postList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                          elevation: 4,
                          child: Padding(padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Text(
                                  postList[index].id.toString(),
                                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  postList[index].userId.toString() ,
                                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  postList[index].title ?? 'no title',
                                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  postList[index].body ?? 'no body',
                                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),

                                )
                              ],
                            ),

                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
    );
  }
}
