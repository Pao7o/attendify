import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';


import '../features/common/app_colors.dart';
import '../features/common/common_widget.dart';
import '../features/common/image_path.dart';
import '../responsive/responsive_flutter.dart';
import "dart:math";

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
  bool isReadMore = false;

  var items = [
    'Popular',
    'Near you',
    'Recommanded',
  ];
   static var postOrigin = [
    'Reposted by @friendUser',
    'Based on your interests',
    'Followed by 3 friends',
    'Posted near you',
    'Popular this month',
    'Sponsored'
  ];

   static var _random = new Random();

// generate a random index based on the list length
// and use it to retrieve the element
  var element = postOrigin[_random.nextInt(postOrigin.length)];

  var itemCount = 2;

  Widget buildText(String text) {
    return ReadMoreText(
        text,
        colorClickableText: AppColors().btnColor,
        trimMode: TrimMode.Line,
        trimLines:1 ,
        trimCollapsedText: 'Show more',
        trimExpandedText: 'Show less',

        style : TextStyle(
          color: AppColors().greyTextColor,fontSize: ResponsiveFlutter.of(context).fontSize(1.7),
        )
    );
  }
  Widget buildButton() =>TextButton(
      style: TextButton.styleFrom(
          textStyle : TextStyle(fontSize: ResponsiveFlutter.of(context).fontSize(1.5)
            ,)
      ),
      onPressed: () =>setState(() =>
        isReadMore = !isReadMore
      ), child: Text(isReadMore ? 'Less' : 'More'));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                itemCount: itemCount+1,
                padding: EdgeInsets.only(
                    bottom: ResponsiveFlutter.of(context).moderateScale(100),
                ),
                itemBuilder: (context, index) => Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: ResponsiveFlutter.of(context).moderateScale(40)),
                          child: SizedBox(height:ResponsiveFlutter.of(context).moderateScale(15),
                              width : ResponsiveFlutter.of(context).moderateScale(200),
                            child:buildText(element),),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(height : ResponsiveFlutter.of(context).moderateScale(310),enlargeCenterPage: true,enableInfiniteScroll: false,initialPage: 1),
                          items: [1,2,3,4,5].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Stack(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.symmetric(vertical : ResponsiveFlutter.of(context).moderateScale(5)),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.amber,
                                      ),
                                      child: ClipRRect(borderRadius: BorderRadius.circular(20),
                                          child: Image.asset(ImagePath.image_4,fit: BoxFit.fill,))
                                  ),

                                  ],
                                );
                                },
                            );
                          }).toList(),
                        ),

                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left : ResponsiveFlutter.of(context).moderateScale(35),right:ResponsiveFlutter.of(context).moderateScale(20)),
                          child: SizedBox(
                            height:ResponsiveFlutter.of(context).moderateScale(45),width: ResponsiveFlutter.of(context).moderateScale(30),
                            child: Image(image: AssetImage(ImagePath().confetti)),
                          ),
                        )
                      ],
                    ),
                    ClipRect(
                      child: Padding(
                        padding: EdgeInsets.only(left : ResponsiveFlutter.of(context).moderateScale(35),right:ResponsiveFlutter.of(context).moderateScale(20)  ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(right : ResponsiveFlutter.of(context).moderateScale(10)),
                              child: SizedBox(height:ResponsiveFlutter.of(context).moderateScale(18),width: ResponsiveFlutter.of(context).moderateScale(18),
                                child:CircleAvatar(
                                  backgroundImage: AssetImage(ImagePath.image_3,),
                                ) ,),
                            ),
                            Text("Username",style: TextStyle(
                                color: AppColors().lightColor
                            ),
                            ),
                            SizedBox(width:ResponsiveFlutter.of(context).moderateScale(10),),
                            Padding(
                              padding: EdgeInsets.only(top : ResponsiveFlutter.of(context).moderateScale(3)),
                              child: Expanded(
                                child: SizedBox(
                                    width: ResponsiveFlutter.of(context).moderateScale(185),child: Column(
                                  children: [
                                    buildText("The best description you ever seen in your life hehe" " "),
                                  ],
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                separatorBuilder: (context, index) => SizedBox(height: ResponsiveFlutter.of(context).moderateScale(20),)
              ),
            ),
          ],
        ),
      ),
    );
  }

}






