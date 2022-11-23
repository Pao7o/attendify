import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../features/common/app_colors.dart';
import '../features/common/common_widget.dart';
import '../features/common/image_path.dart';
import '../features/common/strings.dart';
import '../responsive/responsive_flutter.dart';
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
    'Recommanded for you',
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
              padding: EdgeInsets.only(
                  left: ResponsiveFlutter.of(context).moderateScale(20),
                  top: ResponsiveFlutter.of(context).moderateScale(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: ResponsiveFlutter.of(context).moderateScale(205),
                    height: ResponsiveFlutter.of(context).moderateScale(25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        DropdownButton(
                          items: items.map((items) {
                            return DropdownMenuItem(
                                value: items,
                                child: Text(
                                  items,
                                  style:
                                      TextStyle(color: AppColors().lightColor),
                                ));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue;
                            });
                          },
                          value: dropdownvalue,
                          icon: new Icon(Icons.arrow_drop_down),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: appColors.appDarkColor,
                      borderRadius: BorderRadius.circular(
                        ResponsiveFlutter.of(context).moderateScale(20),
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
                  horizontal: ResponsiveFlutter.of(context).moderateScale(20),
                  vertical: ResponsiveFlutter.of(context).moderateScale(10),
                ),
                itemBuilder: (context, index) => Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: ResponsiveFlutter.of(context).moderateScale(300),
                      width: double.infinity,
                      margin: EdgeInsets.only(
                          bottom:
                              ResponsiveFlutter.of(context).moderateScale(40)),
                      padding: EdgeInsets.all(
                          ResponsiveFlutter.of(context).moderateScale(15)),
                      decoration: BoxDecoration(
                        color: appColors.btnColor,
                        borderRadius: BorderRadius.circular(
                          ResponsiveFlutter.of(context).moderateScale(20),
                        ),
                      ),
                    ),
                  ],
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: ResponsiveFlutter.of(context).moderateScale(40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
