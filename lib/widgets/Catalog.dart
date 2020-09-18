import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipes.dart';
import 'package:recipe_app/screens/Details_Screen.dart';

class Catalog extends StatelessWidget {
  final List<Recipe> myData;

  Catalog(
    this.myData,
  );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 530,
      child: ListView.builder(
        // shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              onTap: () => lookDetailsOfRecipe(context, myData[index]),
              child: makeRecipeCard(myData[index], index));
        },
        itemCount: this.myData == null ? 0 : this.myData.length,
      ),
    );
  }
}

void lookDetailsOfRecipe(BuildContext context, Recipe recipe) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
    return Details(recipe);
  }));
}

Widget makeRecipeCard(Recipe data, int index) {
  return Container(
    margin: EdgeInsets.only(left: 50, right: 15),
    width: 270,
    height: 500,
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(30)),
    child: Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
              flex: 1,
              child: Container(
                child: Column(
                  children: [
                    Text(
                      data.meal,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: 17),
                    Text(
                      data.area,
                      style: TextStyle(
                          fontFamily: 'Quattrocento Sans',
                          fontSize: 16,
                          color: Colors.grey),
                    )
                  ],
                ),
              )),
          Flexible(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(bottom: 10),

                //height: 200,
                child: ClipOval(
                  child: Image.network(
                    data.mealThumb,
                    fit: BoxFit.cover,
                    width: 170,
                    height: 165,
                  ),
                ),
              )),
          Flexible(
              flex: 1,
              child: Container(
                child: Column(
                  children: [
                    Text(
                      data.category,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.start,
                        children: [
                          ...data.ingredients
                              .map((e) => Text(e + ', ',
                                  style: TextStyle(
                                      letterSpacing: 0.1,
                                      fontFamily: 'Quattrocento Sans',
                                      fontSize: 12,
                                      color: Colors.grey)))
                              .toList(),
                        ]),
                  ],
                ),
              )),
        ],
      ),
    ),
  );
}
