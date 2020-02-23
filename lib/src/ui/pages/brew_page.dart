import 'package:alebrew/src/models/brew.dart';
import 'package:alebrew/src/ui/components/appbar.dart';
import 'package:alebrew/src/ui/components/drawer.dart';
import 'package:alebrew/src/ui/components/title.dart';
import 'package:flutter/material.dart';

class BrewPage extends StatefulWidget {
  final Brew brew;

  BrewPage({Key key, @required this.brew}) : super(key: key);

  @override
  _BrewPageState createState() => _BrewPageState();
}

class _BrewPageState extends State<BrewPage> {
  Brew brew;
  TextEditingController _searchController = TextEditingController();
  String searchResult = "";

  @override
  void initState() {
    brew = widget.brew;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Home / ${brew.name}"),
      drawer: drawer(context),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(right: 30, left: 30, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            title(brew.name, 35),
            SizedBox(height: 25),
            Text(
              "Last Edited: ${brew.lastEdited}",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 25),
            Container(
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  if (brew.pageList.isEmpty)
                    Text("wena")
                  else
                    Flexible(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "All",
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
                                      "New Batch",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Text("Add New Batch"),
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
                          Flexible(
                            child: ListView.builder(
                              itemCount: brew.pageList.length,
                              itemBuilder: (context, index) {
                                return Text("wena");
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),

            // ValueListenableBuilder(
            //   valueListenable: Hive.box<Brew>("Brewery").listenable(),
            //   builder: (context, Box<Brew> box, _) {
            //     return Flexible(
            //       child: ListView.separated(
            //         separatorBuilder: (context, index) {
            //           return Divider(height: 1, color: Colors.black);
            //         },
            //         itemCount: box.values.length,
            //         itemBuilder: (context, index) {
            //           return searchResult == null || searchResult == ""
            //               ? brewListItem(context, box, index)
            //               : box
            //                       .getAt(index)
            //                       .name
            //                       .toLowerCase()
            //                       .contains(searchResult)
            //                   ? brewListItem(context, box, index)
            //                   : Container();
            //         },
            //       ),
            //     );
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
