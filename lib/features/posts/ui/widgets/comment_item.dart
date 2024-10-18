import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  const ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
            'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
        radius: 20,
      ),
      title: Text('User Name', style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Content', style: TextStyle(color: Color.fromARGB(255, 249, 133, 133), fontSize: 15)),
          SizedBox(height: 5),
          Text('2 hours ago', style: TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
      trailing: Icon(Icons.favorite_border),
    );
  }
}