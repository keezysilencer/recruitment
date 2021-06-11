import 'package:flutter/material.dart';

import '../../domain/entities/post.dart';

class UserDetailsPage extends StatelessWidget {
  final User user;

  const UserDetailsPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shadowColor: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Text("User Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Divider(),
          Expanded(
              child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.picture),
            ),
            title: Container(
              child: Text("${user.firstName} ${user.lastName}",
                  style: TextStyle(fontSize: 20)),
            ),
            subtitle: Container(
              child: Text(user.email),
            ),
            trailing: Container(
              child: Text(user.title),
            ),
          )),
        ],
      ),
    );
  }
}
