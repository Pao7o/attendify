import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../features/common/app_colors.dart';
import '../features/common/image_path.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}
AppColors appColors = AppColors();
ImagePath imagePath = ImagePath();

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:appColors.black ,
        title: Text("Contacts"),
      ),
    );
  }
}
