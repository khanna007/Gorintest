import 'dart:convert';

import 'package:flutter/material.dart';

class SearchList extends StatefulWidget {
  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  List decodedObject;
  TextEditingController _textController = TextEditingController();
  List newDataList = List();

  jsonDecodeObject() async {
    String doc =
        await DefaultAssetBundle.of(context).loadString('assets/product.json');
    setState(() {
      decodedObject = jsonDecode(doc);
      newDataList = List.from(decodedObject);
    });
  }

  onItemChanged(String value) {
    setState(() {
      newDataList = decodedObject
          .where((string) =>
              string["product_name"].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    jsonDecodeObject();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('search')),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Search Here...',
              ),
              onChanged: onItemChanged,
            ),
          ),
          Expanded(
            child: newDataList != null
                ? ListView(
                    padding: EdgeInsets.all(12.0),
                    children: newDataList.map((data) {
                      return ListTile(
                        isThreeLine: true,
                        subtitle: Column(
                          children: <Widget>[
                            Text(data['product_name']),
                            Text(data['tag']),
                            Text(data['price']),
                          ],
                        ),
                        onTap: () => print(data),
                      );
                    }).toList(),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ],
      ),
    );
  }
}