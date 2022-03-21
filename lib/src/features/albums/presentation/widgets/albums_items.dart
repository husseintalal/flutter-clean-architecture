import 'package:flutter/material.dart';

import '../../domain/entities/albums.dart';

class AlbumsItems extends StatelessWidget {
  const AlbumsItems({
    Key? key, required this.albums,
  }) : super(key: key);

  final List<Albums>albums;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: albums.length,
      itemBuilder: (_,index) => buildAlbumsCard(index),
    );
  }

  Card buildAlbumsCard(int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20.0),
      elevation: 3.0,
      color: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(index.toString()),
        ),
        title: Text(albums[index].title),
      ),
    );
  }
}
