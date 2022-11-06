import 'dart:io';
import 'dart:ui';

import 'package:attendify/common/app_colors.dart';
import 'package:attendify/common/common_widget.dart';
import 'package:attendify/common/dotted_line.dart';
import 'package:attendify/common/image_path.dart';
import 'package:attendify/common/strings.dart';
import 'package:attendify/responsive/responsive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({Key? key}) : super(key: key);

  @override
  _CreateEventScreenState createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  AppColors appColors = AppColors();
  String? selectedDate = "Select date";
  String? selectedTime = "Select time";

  String dropDownValue = 'Category ';
  var items = [
    'Category ',
    'Category 1',
    'Category 2',
    'Category 3',
    'Category 4',
  ];

  final ImagePicker picker = ImagePicker();
  XFile? image;
  File? imageFile;

  TimeOfDay time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: appColors.appMediumColor,
        body: Column(
          children: [
            commonAppBar(
              title: Strings.createEvent,
              backArrow: false,
              context: context,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(
                  vertical: ResponsiveFlutter.of(context).moderateScale(15),
                  horizontal: ResponsiveFlutter.of(context).moderateScale(20),
                ),
                children: [
                  GestureDetector(
                    onTap: () {
                      imagePick();
                    },
                    child: FDottedLine(
                      color: appColors.lightPinkColor,
                      strokeWidth: 1.5,
                      dottedLength: 6.0,
                      space: 3.5,
                      height: ResponsiveFlutter.of(context).verticalScale(130),
                      width: double.infinity,
                      corner: FDottedLineCorner.all(ResponsiveFlutter.of(context).moderateScale(20)),
                      child: Container(
                        height: ResponsiveFlutter.of(context).verticalScale(130),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: appColors.appLightColor,
                          borderRadius: BorderRadius.circular(
                            ResponsiveFlutter.of(context).moderateScale(20),
                          ),
                        ),
                        child: imageFile == null
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    ImagePath.image,
                                    height: ResponsiveFlutter.of(context).moderateScale(25),
                                    color: appColors.lightColor,
                                  ),
                                  SizedBox(
                                    height: ResponsiveFlutter.of(context).verticalScale(5),
                                  ),
                                  MyTextView(
                                    Strings.tapToAddImage,
                                    textAligntNew: TextAlign.center,
                                    styleNew: MyTextStyle(
                                      colorNew: appColors.lightColor,
                                      fontWeightNew: FontWeight.w400,
                                      size: ResponsiveFlutter.of(context).fontSize(2),
                                    ),
                                  ),
                                ],
                              )
                            : Image.file(
                                imageFile!,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).verticalScale(10),
                  ),
                  Container(
                    height: ResponsiveFlutter.of(context).verticalScale(50),
                    padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveFlutter.of(context).moderateScale(20),
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: appColors.appLightColor,
                      borderRadius: BorderRadius.circular(
                        ResponsiveFlutter.of(context).moderateScale(20),
                      ),
                      border: Border.all(
                        color: appColors.borderColor,
                        width: 1.5,
                      ),
                    ),
                    child: DropdownButton(
                      value: dropDownValue,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: appColors.lightPinkColor,
                      ),
                      style: MyTextStyle(
                        colorNew: appColors.lightColor,
                        fontWeightNew: FontWeight.w400,
                        size: ResponsiveFlutter.of(context).fontSize(1.8),
                      ),
                      iconSize: ResponsiveFlutter.of(context).moderateScale(30),
                      isExpanded: true,
                      dropdownColor: appColors.appLightColor,
                      borderRadius: BorderRadius.circular(ResponsiveFlutter.of(context).moderateScale(20)),
                      underline: Container(),
                      alignment: Alignment.bottomCenter,
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          alignment: Alignment.centerLeft,
                          child: MyTextView(
                            items,
                            textAligntNew: TextAlign.center,
                            styleNew: MyTextStyle(
                              colorNew: appColors.lightColor,
                              fontWeightNew: FontWeight.w500,
                              size: ResponsiveFlutter.of(context).fontSize(1.8),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          dropDownValue = value.toString();
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).verticalScale(10),
                  ),
                  Container(
                    height: ResponsiveFlutter.of(context).verticalScale(50),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveFlutter.of(context).moderateScale(20),
                    ),
                    decoration: BoxDecoration(
                      color: appColors.appLightColor,
                      borderRadius: BorderRadius.circular(
                        ResponsiveFlutter.of(context).moderateScale(20),
                      ),
                      border: Border.all(
                        color: appColors.borderColor,
                        width: 1.5,
                      ),
                    ),
                    child: commonTestField(
                      context: context,
                      keyboardType: TextInputType.multiline,
                      hintText: Strings.enterEventName,
                      icon: false,
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).verticalScale(10),
                  ),
                  Container(
                    height: ResponsiveFlutter.of(context).verticalScale(50),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveFlutter.of(context).moderateScale(20),
                    ),
                    decoration: BoxDecoration(
                      color: appColors.appLightColor,
                      borderRadius: BorderRadius.circular(
                        ResponsiveFlutter.of(context).moderateScale(20),
                      ),
                      border: Border.all(
                        color: appColors.borderColor,
                        width: 1.5,
                      ),
                    ),
                    child: commonTestField(
                      context: context,
                      keyboardType: TextInputType.number,
                      hintText: Strings.price,
                      icon: false,
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).verticalScale(10),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2035),
                            );
                            if (picked != null) {
                              selectedDate = ("${picked.day} / ${picked.month} / ${picked.year}");
                              setState(() {});
                            }
                          },
                          child: Container(
                            height: ResponsiveFlutter.of(context).verticalScale(50),
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: ResponsiveFlutter.of(context).moderateScale(20),
                            ),
                            decoration: BoxDecoration(
                              color: appColors.appLightColor,
                              borderRadius: BorderRadius.circular(
                                ResponsiveFlutter.of(context).moderateScale(20),
                              ),
                              border: Border.all(
                                color: appColors.borderColor,
                                width: 1.5,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: MyTextView(
                                    selectedDate!,
                                    textAligntNew: TextAlign.center,
                                    styleNew: MyTextStyle(
                                      colorNew: appColors.lightColor,
                                      fontWeightNew: FontWeight.w400,
                                      size: ResponsiveFlutter.of(context).fontSize(1.8),
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  ImagePath.pinkCalendar,
                                  color: appColors.lightPinkColor,
                                  height: ResponsiveFlutter.of(context).moderateScale(23),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: ResponsiveFlutter.of(context).moderateScale(10),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            selectTime(context);
                          },
                          child: Container(
                            height: ResponsiveFlutter.of(context).verticalScale(50),
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: ResponsiveFlutter.of(context).moderateScale(20),
                            ),
                            decoration: BoxDecoration(
                              color: appColors.appLightColor,
                              borderRadius: BorderRadius.circular(
                                ResponsiveFlutter.of(context).moderateScale(20),
                              ),
                              border: Border.all(
                                color: appColors.borderColor,
                                width: 1.5,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyTextView(
                                  selectedTime!,
                                  textAligntNew: TextAlign.center,
                                  styleNew: MyTextStyle(
                                    colorNew: appColors.lightColor,
                                    fontWeightNew: FontWeight.w400,
                                    size: ResponsiveFlutter.of(context).fontSize(1.8),
                                  ),
                                ),
                                Image.asset(
                                  ImagePath.pinkTime,
                                  color: appColors.lightPinkColor,
                                  height: ResponsiveFlutter.of(context).moderateScale(23),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).verticalScale(10),
                  ),
                  Container(
                    height: ResponsiveFlutter.of(context).verticalScale(50),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveFlutter.of(context).moderateScale(20),
                    ),
                    decoration: BoxDecoration(
                      color: appColors.appLightColor,
                      borderRadius: BorderRadius.circular(
                        ResponsiveFlutter.of(context).moderateScale(20),
                      ),
                      border: Border.all(
                        color: appColors.borderColor,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: commonTestField(
                            context: context,
                            keyboardType: TextInputType.multiline,
                            hintText: Strings.location,
                            icon: false,
                          ),
                        ),
                        Image.asset(
                          ImagePath.pinkLocation,
                          color: appColors.lightPinkColor,
                          height: ResponsiveFlutter.of(context).moderateScale(23),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).verticalScale(10),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveFlutter.of(context).moderateScale(20),
                      vertical: ResponsiveFlutter.of(context).moderateScale(15),
                    ),
                    decoration: BoxDecoration(
                      color: appColors.appLightColor,
                      borderRadius: BorderRadius.circular(
                        ResponsiveFlutter.of(context).moderateScale(20),
                      ),
                      border: Border.all(
                        color: appColors.borderColor,
                        width: 1.5,
                      ),
                    ),
                    child: TextField(
                      style: MyTextStyle(
                        colorNew: appColors.lightColor,
                        fontWeightNew: FontWeight.w400,
                        size: ResponsiveFlutter.of(context).fontSize(1.8),
                      ),
                      cursorColor: appColors.lightColor,
                      keyboardType: TextInputType.multiline,
                      expands: false,
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: Strings.enterEmailDetails,
                        hintStyle: MyTextStyle(
                          colorNew: appColors.lightColor,
                          fontWeightNew: FontWeight.w400,
                          size: ResponsiveFlutter.of(context).fontSize(1.8),
                        ),
                        isDense: true,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).verticalScale(20),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierColor: Colors.black54,
                          barrierDismissible: true,
                          builder: (context) {
                            return WillPopScope(
                              onWillPop: () async => false,
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Stack(
                                  children: [
                                    Center(
                                      child: Container(
                                        height: ResponsiveFlutter.of(context).verticalScale(200),
                                        width: double.infinity,
                                        margin: EdgeInsets.symmetric(
                                          horizontal: ResponsiveFlutter.of(context).moderateScale(30),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            ResponsiveFlutter.of(context).moderateScale(20),
                                          ),
                                          image: const DecorationImage(
                                            image: AssetImage(ImagePath.hurray),
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              ImagePath.ok,
                                              height: ResponsiveFlutter.of(context).verticalScale(55),
                                            ),
                                            SizedBox(
                                              height: ResponsiveFlutter.of(context).verticalScale(10),
                                            ),
                                            MyTextView(
                                              Strings.hurray,
                                              styleNew: MyTextStyle(
                                                colorNew: appColors.white,
                                                size: ResponsiveFlutter.of(context).fontSize(3.3),
                                                fontWeightNew: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: ResponsiveFlutter.of(context).verticalScale(10),
                                            ),
                                            MyTextView(
                                              Strings.yourEventSuccessfullyCreated,
                                              styleNew: MyTextStyle(
                                                colorNew: appColors.white,
                                                size: ResponsiveFlutter.of(context).fontSize(2.2),
                                                fontWeightNew: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(bottom: ResponsiveFlutter.of(context).moderateScale(20)),
                                          child: Image.asset(
                                            ImagePath.close,
                                            height: ResponsiveFlutter.of(context).verticalScale(45),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: commonButton(
                      context: context,
                      title: Strings.createEvent,
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).verticalScale(80),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void imagePick() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageFile = File(image!.path);
      debugPrint("Image ------------- >>>> ${image!.path}");
    } else {
      debugPrint("<<<< ------------- Image Not Selected ------------- >>>>");
    }
    setState(() {});
  }

  selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: time,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != time) {
      time = timeOfDay;
      debugPrint("time ------------- >>>> $timeOfDay");
      selectedTime = timeOfDay.hour.toString() + " : " + timeOfDay.minute.toString();
      setState(() {});
    } else {
      debugPrint("<<<< ------------- Time Not Selected ------------- >>>>");
    }
  }
}
