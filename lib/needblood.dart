import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NeedBlood extends StatefulWidget {
  @override
  _NeedBloodState createState() => _NeedBloodState();
}

String query = '';
List<String> newlist = new List();

class _NeedBloodState extends State<NeedBlood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Donors'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                final String selected =
                    await showSearch(context: context, delegate: DataSearch());
                if (selected != null && selected != query) {
                  setState(() {
                    query = selected;
                  });
                }
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 0),
        child: StreamBuilder(
          stream: Firestore.instance.collection("Donors").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(
              children: snapshot.data.documents.map((document) {
                
                newlist.add(document['DonorName']);
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1,
                      height: MediaQuery.of(context).size.height / 7.5,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xFF6448FE), Color(0xFF5FC6FF)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.blue.withOpacity(0.2),
                                blurRadius: 8.0,
                                spreadRadius: 2.0,
                                offset: Offset(4, 4))
                          ]),
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 12.0, 10.0, 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 70.0,
                                  width: 50.0,
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                        'https://static.toiimg.com/photo/76729750.cms'),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Name :' + " " + document['DonorName'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Poppins',
                                          fontSize: 18.0),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 6.0,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Bloodgroup :' +
                                          " " +
                                          document['Bloodgroup'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Poppins',
                                          fontSize: 18.0),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                                Row()
                              ],
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 25.0,
                                ),
                                IconButton(
                                    icon: Icon(Icons.arrow_forward_ios),
                                    onPressed: null)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    //  what kind of actions we want when click on search
    return <Widget>[
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
            showSuggestions(context);
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on left of appbar
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // show when someone searches for anythhing and selects anything
    return Text(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestion = query.isEmpty
        ? newlist
        : newlist
            .where((element) => element.toLowerCase().contains(query))
            .toList();
    return ListView.builder(
        itemCount: suggestion.length,
        itemBuilder: (BuildContext context, int index) {
          return new ListTile(
            title: Text(suggestion[index]),
            onTap: () {
              close(context, suggestion[index]);
            },
          );
        });

    // show when someone searches for anythhing
  }
}
