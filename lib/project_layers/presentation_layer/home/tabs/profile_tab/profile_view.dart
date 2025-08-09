import 'package:flutter/material.dart';

import '../../../authentication/signin/cubit/sign_in_view_model.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(onPressed: ()async{
        final token = await storage.read(key: 'token');
        print(token);
      }, child: Text("token")),
    );
  }
}
