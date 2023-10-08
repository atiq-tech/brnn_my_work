import 'dart:convert';

import 'package:ecommerceshope/API_Map_data_Show/map_data_show.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

class API_MAP_DATA_DEMO_PAGE extends StatefulWidget {
  const API_MAP_DATA_DEMO_PAGE({Key? key}) : super(key: key);

  @override
  State<API_MAP_DATA_DEMO_PAGE> createState() => _API_MAP_DATA_DEMO_PAGEState();
}

class _API_MAP_DATA_DEMO_PAGEState extends State<API_MAP_DATA_DEMO_PAGE> {

  @override
  void initState() {
     // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FetchUserList _userList = FetchUserList();
    return Scaffold(
      appBar: AppBar(centerTitle: true,
      title: Text("API_MAP_DATA_DEMO_PAGE",style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 22,
      ),),
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        child: FutureBuilder<List<UserList>>(
            future: _userList.getuserList(),
            builder: (context, snapshot) {
              var data = snapshot.data;
              return ListView.builder(
                  itemCount: data?.length,
                  itemBuilder: (context, index) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Row(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurpleAccent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    '${data?[index].id}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${data?[index].website}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      '${data?[index].email}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ])
                            ],
                          ),
                          // trailing: Text('More Info'),
                        ),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
