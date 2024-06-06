import 'package:flutter/material.dart';
import 'package:somaapp/model/user_model.dart';

class DetailPage extends StatelessWidget {
  final UserModel userModel;

  DetailPage({required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userModel.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username: ${userModel.username}'),
            Text('Email: ${userModel.email}'),
            Text('Phone: ${userModel.phone}'),
            Text('Website: ${userModel.website}'),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}