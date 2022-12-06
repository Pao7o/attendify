import 'package:attendify/screens/comment_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:comment_box/comment/comment.dart';
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

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];


  bool confetti = false;

   static var postOrigin = [
    'Reposted by @friendUser',
    'Based on your interests',
    'Followed by 3 friends',
    'Posted near you',
    'Popular this month',
    'Sponsored'
  ];

   static var _random = new Random();

  int _current = 0;
  final CarouselController _controller = CarouselController();

// generate a random index based on the list length
// and use it to retrieve the element
  var element = postOrigin[_random.nextInt(postOrigin.length)];

  var itemCount = 7;

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
                itemCount: itemCount,
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
                          carouselController: _controller,
                          options: CarouselOptions(height : ResponsiveFlutter.of(context).moderateScale(310),
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              initialPage: 1,
                              viewportFraction: 1.0,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                });
                              }),
                          items: [1,2,3,4,5,6].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Stack(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.symmetric(vertical : ResponsiveFlutter.of(context).moderateScale(5)),
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                      ),
                                      child: Image.asset(ImagePath.image_4,fit: BoxFit.fill,)
                                  ),
                                    Container(

                                    )
                                  ],
                                );
                                },
                            );

                          }).toList(),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: ResponsiveFlutter.of(context).moderateScale(5),
                            height: ResponsiveFlutter.of(context).moderateScale(5),
                            margin: EdgeInsets.symmetric(vertical: ResponsiveFlutter.of(context).moderateScale(3), horizontal: ResponsiveFlutter.of(context).moderateScale(3)),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (AppColors().btnColor)
                                    .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                          ),
                        );
                      }).toList(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: ResponsiveFlutter.of(context).moderateScale(6),bottom:ResponsiveFlutter.of(context).moderateScale(16) ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left : ResponsiveFlutter.of(context).moderateScale(35),right:ResponsiveFlutter.of(context).moderateScale(15)),
                            child: SizedBox(
                              height:ResponsiveFlutter.of(context).moderateScale(25),width: ResponsiveFlutter.of(context).moderateScale(25),
                              child: IconButton(icon: Image.asset(!confetti ? ImagePath.confetti : ImagePath.confettiFilled),
                                iconSize: 10,
                                padding: new EdgeInsets.all(ResponsiveFlutter.of(context).moderateScale(0)),
                                onPressed: () { setState(() {
                                  confetti = !confetti;
                                }); },),
                            ),
                          ),
                          Text("1273 loved this",style: TextStyle(color: AppColors().lightColor),),
                          Padding(
                            padding: EdgeInsets.only(left:ResponsiveFlutter.of(context).moderateScale(15),top:ResponsiveFlutter.of(context).moderateScale(4),right:ResponsiveFlutter.of(context).moderateScale(10) ),
                            child: SizedBox(
                              height:ResponsiveFlutter.of(context).moderateScale(30),width: ResponsiveFlutter.of(context).moderateScale(30),
                              child: IconButton(icon: Image.asset(ImagePath.comment),
                                iconSize: 10,
                                padding: new EdgeInsets.all(ResponsiveFlutter.of(context).moderateScale(0)),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CommentClass(),
                                    ),
                                  );
                                },),
                            ),
                          ),
                          Text("35 comments",style: TextStyle(color: AppColors().lightColor),),
                        ],
                      ),
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
                              child: SizedBox(
                                  width: ResponsiveFlutter.of(context).moderateScale(185),child: Column(
                                children: [
                                  buildText("The best description you ever seen in your life hehe"),
                                ],
                              )),
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






