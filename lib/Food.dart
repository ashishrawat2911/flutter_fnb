import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_fnb/FoodAndDrinks.dart';
import 'package:http/http.dart' as http;

class Food extends StatefulWidget {
  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food> {
  List<FoodList> foodList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<List<FoodList>> getData() async {
    String link;
    link = "http://www.mocky.io/v2/5b700cff2e00005c009365cf";

    var res = await http
        .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
    print(res.body);
    setState(() {
      if (res.statusCode == 200) {
        var data = json.decode(res.body);
        var rest = data["FoodList"] as List;
        foodList = rest.map((i) => FoodList.fromJson(i)).toList();
        print(foodList);
      }
    });
    print("List Size: ${foodList.length}");
    return foodList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: foodList == null
              ? CircularProgressIndicator()
              : listViewBuilder()),
    );
  }

  Widget item(List<FABList> fNBList, int position) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(30.0),
                topRight: Radius.circular(30.0))),
        child: Column(
          children: <Widget>[
            ClipRRect(
              child: Image.network(
                fNBList[position].imgUrl,
              ),
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(30.0),
                  topRight: Radius.circular(30.0)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MaterialButton(
                  onPressed: () {showModalSheet();},
                  color: Colors.white,
                  child: Text(
                    "Normal",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                MaterialButton(
                  color: Colors.yellow,
                  onPressed: () {showModalSheet();},
                  child: Text("Regular", style: TextStyle(color: Colors.black)),
                ),
                MaterialButton(
                  onPressed: () {showModalSheet();},
                  color: Colors.white,
                  child: Text("Large", style: TextStyle(color: Colors.black)),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "MEXICAN burger with chips",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "AED 15",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: InkWell(onTap: () {showModalSheet();},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "1",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget listViewBuilder() {
    return ListView.builder(
        itemCount: foodList[0].fNBList.length,
        itemBuilder: (context, position) {
          return item(foodList[0].fNBList, position);
        });
  }
  void showModalSheet(){

    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            color: Colors.yellow,
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Text(
                    "F&B SUMMARY",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,fontSize: 18),
                  ),
                  top: 20,
                  left: 20,
                ),
                Positioned(
                  child: Text(
                    "HOLSTEN BEER (1)",
                    style: TextStyle(color: Colors.black,fontSize: 18),
                  ),
                  top: 50,
                  left: 20,
                ),
                Positioned(
                  child: Text(
                    "8.0",
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),
                  ),
                  top: 50,
                  right: 20,
                ),
                Positioned(
                  child: Text(
                    "AED 8.0 ",
                    style: TextStyle(color: Colors.black,fontSize: 18),
                  ),
                  bottom: 20,
                  left: 20,
                ),
                Positioned(
                  child: Text(
                    "Pay >",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,fontSize: 18),
                  ),
                  bottom: 20,
                  right: 20,
                ),
              ],
            ),
          );
        });

  }
}
