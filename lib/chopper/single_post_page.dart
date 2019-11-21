import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:starter/network/post_api_service.dart';

class SinglePostPage extends StatelessWidget {
  final int postid;

  const SinglePostPage({Key key,this.postid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tapped Post Here'),
      ),
      body: FutureBuilder<Response>(
          future: Provider.of<PostApiService>(context).getPost(postid),
          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.done){
              final Map post=json.decode(snapshot.data.bodyString);
              return _buildPost(post);
            }
            else{
              return Center(child: CircularProgressIndicator(),);
            }
          },
      ),
    );
  }
}
Padding _buildPost(Map post){
  return Padding(padding: EdgeInsets.all(8.0),
    child: Column(
      children: <Widget>[
        Text(post['title'],
          style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8,),
        Text(post['body'])
      ],
    ),
  
  );
}