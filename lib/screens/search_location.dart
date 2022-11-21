import 'dart:convert';

import 'package:attendify/features/common/app_colors.dart';
import 'package:attendify/responsive/responsive_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class SearchLocation extends StatefulWidget {
  const SearchLocation({Key? key}) : super(key: key);

  @override
  State<SearchLocation> createState() => _SearchLocationState();
}

var _controller = TextEditingController();

class _SearchLocationState extends State<SearchLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors().lightColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        titleSpacing: 0,
        backgroundColor: AppColors().appMediumColor,
        toolbarHeight: ResponsiveFlutter.of(context).moderateScale(45),
        title: SizedBox(
          height: ResponsiveFlutter.of(context).moderateScale(50),
          child: Column(
            children: [
              Center(
                child: TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _controller.clear();
                        },
                      ),
                      hintText: 'Type your location...',
                      border: InputBorder.none),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
