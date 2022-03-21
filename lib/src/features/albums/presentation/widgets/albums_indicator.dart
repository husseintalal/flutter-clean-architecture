import 'package:flutter/cupertino.dart';

class AlbumsIndicator extends StatelessWidget {
  const AlbumsIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CupertinoActivityIndicator(),);
  }
}
