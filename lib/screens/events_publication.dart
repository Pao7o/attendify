import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../common/common_widget.dart';
import '../common/image_path.dart';
import '../common/strings.dart';
import '../responsive/responsive_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'chat_screen.dart';
import 'edit_event_screen.dart';

class EventsPublications extends StatefulWidget {
  const EventsPublications({Key? key}) : super(key: key);

  @override
  State<EventsPublications> createState() => _EventsPublicationsState();
}

class _EventsPublicationsState extends State<EventsPublications> {
  AppColors appColors = AppColors();
  ImagePath imagePath = ImagePath();
  String? dropdownvalue = 'Popular';

  var items = [
    'Popular',
    'Near you',
    'Recommanded',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        backgroundColor: appColors.appMediumColor,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left : ResponsiveFlutter.of(context).moderateScale(20),
                  top: ResponsiveFlutter.of(context).moderateScale(10),
              bottom: ResponsiveFlutter.of(context).moderateScale(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: ResponsiveFlutter.of(context).moderateScale(150),
                    height:ResponsiveFlutter.of(context).moderateScale(25),
                    decoration: BoxDecoration(
                      color: appColors.appDarkColor,
                      borderRadius: BorderRadius.circular(
                        ResponsiveFlutter.of(context).moderateScale(20),
                      ),

                    ),
                    child: DropdownButtonHideUnderline(
                      child: Theme(
                        data: Theme.of(context).copyWith(canvasColor: AppColors().appMediumColor),
                        child: DropdownButton(items: items.map((items) {
                          return DropdownMenuItem(value: items, child: Center(
                            child: Text(items,
                              style: TextStyle(color: AppColors().lightColor,),),
                          ));
                        }).toList(),
                          isExpanded: true,
                          hint: Text("Sort by"),
                          onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue;
                          });
                        },

                          value: dropdownvalue,icon: new Icon(Icons.arrow_drop_down,color:AppColors().lightColor,),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 2,
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveFlutter.of(context).moderateScale(00),
                ),
                itemBuilder: (context, index) => Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(height : ResponsiveFlutter.of(context).moderateScale(290),enlargeCenterPage: true,),
                      items: [1,2,3,4,5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 7.0,vertical: 15.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                    color: Colors.amber,
                                ),
                                child: ClipRRect(borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(ImagePath.image_4,fit: BoxFit.fill,))
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: ResponsiveFlutter.of(context).moderateScale(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
}}
