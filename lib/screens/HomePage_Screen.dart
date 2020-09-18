import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipes.dart';
import 'package:recipe_app/widgets/Catalog.dart';

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [
          Container(
            child: IconButton(
              icon: Icon(Icons.restaurant_menu),
              onPressed: null,
              iconSize: 40,
            ),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            Container(
              child: Text(
                'Food Recipes',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            SizedBox(height: 60),
            SizedBox(height: 35),
            FutureBuilder(
                future:
                    DefaultAssetBundle.of(context).loadString("assets/db.json"),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Recipe> myData = parseJson(snapshot.data.toString());

                    return Catalog(myData);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }

  List<Recipe> parseJson(String response) {
    if (response == null || response == '') {
      return [];
    }
    final parsed = jsonDecode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Recipe>((json) => new Recipe.fromJson(json)).toList();
  }
}
