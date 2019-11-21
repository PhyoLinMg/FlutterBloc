import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:starter/chopper/single_post_page.dart';
import 'package:starter/network/post_api_service.dart';

class Posts extends StatelessWidget {
  const Posts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chopper Blog"),
      ),
      body: _buildBody(context),
      
    );
  }
}

FutureBuilder<Response> _buildBody(BuildContext context) {
  return FutureBuilder<Response>(
    future: Provider.of<PostApiService>(context).getPosts(),
    builder: (context,snapshot){
      if(snapshot.connectionState==ConnectionState.done){
          final List posts=json.decode(snapshot.data.bodyString);
          return _buildPosts(context,posts);
      }
      else{
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    },

  );
}
ListView _buildPosts(BuildContext context,List posts){
  return ListView.builder(
      itemCount: posts.length,
      padding: EdgeInsets.all(6),
      itemBuilder: (context,index){
        return Card(
          elevation: 3,
          child: ListTile(
            title: Text(
              posts[index]['title'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(posts[index]['body']),
            onTap: ()=> _navigateToSinglePost(context,posts[index]['id']),
            
          ),
        );
      },

  );
}
 void _navigateToSinglePost(BuildContext context, int id) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Provider(builder: (_) => PostApiService.create(),
      dispose: (_, PostApiService service) => service.client.dispose(),child: SinglePostPage(postid: id),),
      ),
    );
  }