import 'dart:io';

import 'package:attendify/screens/chat_screen.dart';
import 'package:attendify/screens/feed_screen.dart';
import 'package:attendify/screens/friends_screen.dart';
import 'package:attendify/screens/my_events_screen.dart';
import 'package:attendify/screens/story_view.dart';
import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rect_getter/rect_getter.dart';

import '../features/common/app_colors.dart';
import '../features/common/common_widget.dart';
import '../features/common/image_path.dart';
import '../features/common/story_data.dart';
import '../features/common/strings.dart';
import '../responsive/responsive_flutter.dart';
import 'clubs_screen.dart';
import 'my_booking_screen.dart';
import 'story_settings.dart';

class ChatInterface extends StatefulWidget {
  const ChatInterface({Key? key}) : super(key: key);

  @override
  State<ChatInterface> createState() => _ChatInterfaceState();
}

class _ChatInterfaceState extends State<ChatInterface>
    with TickerProviderStateMixin {
  GlobalKey<RectGetterState> reactGetterkey = RectGetter.createGlobalKey();
  Rect? rect;
  AnimationController? storyAnimationController;
  Animation? storycolorAnimation;
  static const Duration animationDuration = Duration(seconds: 1);
  static const Duration delay = Duration(seconds: 1);
  TabController? tabController;
  int? tab = 0;
  String _elementSelectionne = 'Elément 1';

  File? imageFile;
  final ImagePicker _picker = ImagePicker();

  void pickImageFromGallery() async {
    XFile? imageFile = await _picker.pickImage(source: ImageSource.gallery,
      maxHeight:1080,
      maxWidth: 1080,
    );
    _cropImage(imageFile!.path);
    Navigator.pop(context);
  }

  void pickImageFromCamera() async {
    XFile? imageFile = await _picker.pickImage(source: ImageSource.camera,
      maxHeight:1080,
      maxWidth: 1080,
    );
    _cropImage(imageFile!.path);
    Navigator.pop(context);
  }


  void _cropImage (filePath) async {
    File? croppedImage = (await ImageCropper().cropImage(
      sourcePath : filePath, maxHeight : 1080,maxWidth : 1080,
    )) as File?;
    if(croppedImage != null){
      setState(() {
        imageFile = croppedImage;
      });
    }

  }




  @override
  void initState() {
    super.initState();
    storyAnimationController =
        AnimationController(vsync: this, duration: animationDuration);
    storycolorAnimation = ColorTween(begin: Colors.black12, end: Colors.black)
        .animate(storyAnimationController!);
    storyAnimationController!.addListener(() {
      setState(() {});
    });
  }

  @override
  AppColors appColors = AppColors();
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: appColors.appMediumColor,
          body: Padding(
            padding:
                EdgeInsets.all(ResponsiveFlutter.of(context).moderateScale(0)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: ResponsiveFlutter.of(context).moderateScale(220),
                    decoration: BoxDecoration(
                      color: appColors.appDarkColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                            ResponsiveFlutter.of(context).moderateScale(30)),
                        bottomRight: Radius.circular(
                            ResponsiveFlutter.of(context).moderateScale(30)),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(
                          ResponsiveFlutter.of(context).moderateScale(5)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: ResponsiveFlutter.of(context)
                          .verticalScale(20),),
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: ResponsiveFlutter.of(context)
                                      .verticalScale(30),
                                  width: ResponsiveFlutter.of(context)
                                      .scale(30),
                                ),
                                SizedBox(width:ResponsiveFlutter.of(context).moderateScale(0),),
                                MyTextView(
                                  "Social".toUpperCase(),
                                  textAligntNew: TextAlign.center,
                                  styleNew: MyTextStyle(
                                    colorNew: AppColors().lightColor,
                                    fontWeightNew: FontWeight.w600,
                                    size: ResponsiveFlutter.of(context)
                                        .fontSize(2.4),
                                  ),
                                ),

                                Row(
                                  children: [
                                    PopupMenuButton<String>(
                                child: Image.asset(
                                ImagePath().addPicture,
                                  width: ResponsiveFlutter.of(context).moderateScale(40),
                                  height: ResponsiveFlutter.of(context).moderateScale(40),
                                ),
                                    onSelected: (value) {
                                      setState(() {
                                        _elementSelectionne = value;
                                      });
                                    },
                                    itemBuilder: (context) => <PopupMenuEntry<String>>[
                                      PopupMenuItem(height: ResponsiveFlutter.of(context).verticalScale(50),
                                        value: 'Camera',
                                        onTap: () {
                                        pickImageFromCamera();
                                        },
                                        child: Text('Camera'),

                                      ),
                                      PopupMenuItem(height: ResponsiveFlutter.of(context).verticalScale(50),
                                        value: 'Gallery',
                                        onTap: () {
                                        pickImageFromGallery();
                                        },
                                        child: Text('Gallery'),
                                      ),
                                    ],
                                  ),
                                    SizedBox(width:ResponsiveFlutter.of(context).moderateScale(15) ,),
                                    Container(
                                      height: ResponsiveFlutter.of(context)
                                          .verticalScale(45),
                                      width: ResponsiveFlutter.of(context)
                                          .scale(45),
                                      alignment: Alignment.center,
                                      child: Image(
                                        image: AssetImage(ImagePath().chatSwitch),
                                        height: ResponsiveFlutter.of(context)
                                            .moderateScale(30),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: ResponsiveFlutter.of(context)
                                    .verticalScale(5),
                                bottom: ResponsiveFlutter.of(context)
                                    .verticalScale(5)),
                            child: SizedBox(
                              height:
                                  ResponsiveFlutter.of(context).verticalScale(80),
                              width: double.maxFinite,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: ResponsiveFlutter.of(context)
                                          .verticalScale(5)),
                                  itemBuilder: (context, index) {
                                    return UserStoryItem(
                                      setRectPoint: (rectpoint) {
                                        print(rect);
                                        setState(() {
                                          rect = rectpoint;
                                        });
                                        onStoryItemTap(rect, index);
                                      },
                                      index: index,
                                    );
                                  }),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 90,
                                child: TabBar(
                                  controller: tabController,
                                  indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      ResponsiveFlutter.of(context)
                                          .moderateScale(25),
                                    ), // Creates border
                                    color: appColors.btnColor,
                                  ),
                                  onTap: (value) {
                                    tab = value;
                                    setState(() {});
                                    debugPrint("value ------>> $value");
                                  },
                                  tabs: [
                                    Container(
                                      height: ResponsiveFlutter.of(context)
                                          .moderateScale(45),
                                      alignment: Alignment.center,
                                      child: MyTextView(
                                        "Feed",
                                        textAligntNew: TextAlign.start,
                                        maxLineWrap: true,
                                        styleNew: MyTextStyle(
                                          colorNew: tab == 0
                                              ? appColors.white
                                              : appColors.darkGreyText,
                                          fontWeightNew: FontWeight.w600,
                                          size: ResponsiveFlutter.of(context)
                                              .fontSize(1.8),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: ResponsiveFlutter.of(context)
                                          .moderateScale(45),
                                      alignment: Alignment.center,
                                      child: MyTextView(
                                        "Clubs",
                                        textAligntNew: TextAlign.start,
                                        maxLineWrap: true,
                                        styleNew: MyTextStyle(
                                          colorNew: tab == 1
                                              ? appColors.white
                                              : appColors.darkGreyText,
                                          fontWeightNew: FontWeight.w600,
                                          size: ResponsiveFlutter.of(context)
                                              .fontSize(1.8),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: ResponsiveFlutter.of(context)
                                          .moderateScale(45),
                                      alignment: Alignment.center,
                                      child: MyTextView(
                                        "People",
                                        textAligntNew: TextAlign.start,
                                        maxLineWrap: true,
                                        styleNew: MyTextStyle(
                                          colorNew: tab == 2
                                              ? appColors.white
                                              : appColors.darkGreyText,
                                          fontWeightNew: FontWeight.w600,
                                          size: ResponsiveFlutter.of(context)
                                              .fontSize(1.8),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Expanded(
                                flex: 3,
                                child: SizedBox(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      height: ResponsiveFlutter.of(context).moderateScale(500),
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        color: appColors.appDarkColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                              ResponsiveFlutter.of(context).moderateScale(30)),
                        ),
                      ),
                      child: TabBarView(
                          controller: tabController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: const [
                            FeedScreen(),
                            ClubsScreen(),
                            MyBookingScreen(),
                          ]))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onStoryItemTap(reactpoint, index) {
    setState(() => rect = reactpoint);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() =>
          rect = rect!.inflate(1.3 * MediaQuery.of(context).size.longestSide));
      storyAnimationController!.forward();
      Future.delayed(animationDuration, () {
        Navigator.of(context)
            .push(
              FadeRouteBuilder(
                page: StoryFeedView(
                    stories: stories, herotagString: 'index$index'),
              ),
            )
            .then((value) => setState(() => rect = null));
      });
    });
  }
}

class UserStoryItem extends StatefulWidget {
  const UserStoryItem(
      {Key? key, required this.index, required this.setRectPoint})
      : super(key: key);

  final int index;
  final Function(Rect?) setRectPoint;
  @override
  _UserStoryItemState createState() => _UserStoryItemState();
}

class _UserStoryItemState extends State<UserStoryItem>
    with TickerProviderStateMixin {
  /// Variables
  late Animation<double> gap;
  late Animation<double> base;
  late Animation<double> reverse;
  AnimationController? animationController;
  Rect? rect;
  GlobalKey touchPoint = GlobalKey();

  get storyAnimationController => null;

  static const Duration animationDuration = Duration(seconds: 1);
  static const Duration delay = Duration(seconds: 1);

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));
    base = CurvedAnimation(parent: animationController!, curve: Curves.easeOut);
    reverse = Tween<double>(begin: 0.0, end: -1.0).animate(base);
    gap = Tween<double>(begin: 3.0, end: 0.0).animate(base)
      ..addListener(() {
        setState(() {});
      });
    animationController!.forward();
    animationController!.addListener(() {
      if (animationController!.isCompleted) {
        animationController!.repeat();
      }
    });
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: ResponsiveFlutter.of(context).verticalScale(5)),
      child: GestureDetector(
        key: touchPoint,
        behavior: HitTestBehavior.opaque,
        onTapUp: (detalis) {
          var object = touchPoint.currentContext?.findRenderObject();
          var translation = object?.getTransformTo(null).getTranslation();
          var size = object?.semanticBounds.size;
          rect = Rect.fromLTWH(
              translation!.x, translation.y, size!.width, size.height);
          widget.setRectPoint(rect);
        },
        child: Hero(
          tag: "index${widget.index}",
          transitionOnUserGestures: true,
          child: Container(
            alignment: Alignment.center,
            child: RotationTransition(
              turns: base,
              child: DashedCircle(
                gapSize: gap.value,
                dashes: 30,
                color: const Color(0xffed4634),
                child: RotationTransition(
                  turns: reverse,
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      radius: ResponsiveFlutter.of(context)
                          .moderateScale(30),
                      backgroundImage: AssetImage(ImagePath.image_3),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onStoryItemTap(reactpoint, index) {
    setState(() => rect = reactpoint);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() =>
          rect = rect!.inflate(1.3 * MediaQuery.of(context).size.longestSide));
      storyAnimationController!.forward();
      Future.delayed(animationDuration, () {
        Navigator.of(context)
            .push(
              FadeRouteBuilder(
                page: StoryFeedView(
                    stories: stories, herotagString: 'index$index'),
              ),
            )
            .then((value) => setState(() => rect = null));
      });
    });
  }
}
