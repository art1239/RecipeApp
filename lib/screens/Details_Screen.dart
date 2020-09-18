import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipes.dart';

class Details extends StatelessWidget {
  final Recipe recipe;
  Details(this.recipe);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.meal),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.network(recipe.mealThumb),
              ),
            ),
            Text(
              recipe.category,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                recipe.instructions,
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
