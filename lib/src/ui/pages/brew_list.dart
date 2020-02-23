import 'package:alebrew/src/models/brew.dart';
import 'package:alebrew/src/ui/components/brew_item.dart';
import 'package:alebrew/src/ui/pages/add_new_brew.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class BrewList extends StatefulWidget {
  BrewList({Key key}) : super(key: key);

  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  TextEditingController _searchController = TextEditingController();
  String searchResult = "";

  String _getNumberOfElementsInBrewery() {
    int _elementNumber = Hive.box<Brew>("Brewery").values.length;

    return _elementNumber >= 10 ? " (${_elementNumber.toString()})" : "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(right: 30, left: 30, top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "All" + _getNumberOfElementsInBrewery(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    color: Colors.pink[200],
                    child: Text(
                      "New",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddNewBrew(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 5),
          Container(
            height: 40,
            child: TextField(
              autofocus: false,
              autocorrect: false,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[100],
                hintText: "Search brew...",
                hintStyle: TextStyle(color: Colors.grey[600]),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
              controller: _searchController,
              onChanged: (String value) {
                setState(
                  () {
                    searchResult = value;
                  },
                );
              },
            ),
          ),
          SizedBox(height: 20),
          ValueListenableBuilder(
            valueListenable: Hive.box<Brew>("Brewery").listenable(),
            builder: (context, Box<Brew> box, _) {
              return Flexible(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(height: 1, color: Colors.black);
                  },
                  itemCount: box.values.length,
                  itemBuilder: (context, index) {
                    return searchResult == null || searchResult == ""
                        ? brewListItem(context, box, index)
                        : box
                                .getAt(index)
                                .name
                                .toLowerCase()
                                .contains(searchResult)
                            ? brewListItem(context, box, index)
                            : Container();
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
