import 'package:flutter/material.dart';
import '../screen/newProduct.dart';

class UserProductW extends StatelessWidget {
  final String title;
  final String imageUrl;
  UserProductW(this.imageUrl, this.title);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context).pushNamed(NewProduct.routeName);
                }),
            IconButton(icon: Icon(Icons.delete), onPressed: () {})
          ],
        ),
      ),
    );
  }
}
