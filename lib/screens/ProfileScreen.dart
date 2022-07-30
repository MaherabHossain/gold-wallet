// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProfileSceen extends StatefulWidget {
  const ProfileSceen({Key? key}) : super(key: key);

  @override
  State<ProfileSceen> createState() => _ProfileSceenState();
}

class _ProfileSceenState extends State<ProfileSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
    );
  }
}
