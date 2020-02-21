import 'package:alebrew/src/models/brew.dart';
import 'package:alebrew/src/providers/provider.dart';
import 'package:alebrew/src/ui/components/brew_item.dart';
import 'package:alebrew/src/ui/components/show_clear_trash_modal.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class Trash extends StatefulWidget {
  Trash({Key key}) : super(key: key);

  @override
  _TrashState createState() => _TrashState();
}

class _TrashState extends State<Trash> {
  TextEditingController _searchController = TextEditingController();
  String searchResult = "";

  @override
  void initState() {
    super.initState();
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
                "Trash",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 60,
                child: FlatButton(
                  color: Colors.pink[200],
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () => showClearTrashModal(
                    context,
                    Hive.box<Brew>("Trash"),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 10),
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
                hintText: "Search in trash...",
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
            valueListenable: Hive.box<Brew>("Trash").listenable(),
            builder: (context, Box<Brew> box, _) {
              return Flexible(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(height: 1, color: Colors.black);
                  },
                  itemCount: box.values.length,
                  itemBuilder: (context, index) {
                    return searchResult == null || searchResult == ""
                        ? brewListItem(context, box, index, true)
                        : box
                                .getAt(index)
                                .name
                                .toLowerCase()
                                .contains(searchResult)
                            ? brewListItem(context, box, index, true)
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
