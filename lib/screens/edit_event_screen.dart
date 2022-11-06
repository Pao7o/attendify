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

class EditEventScreen extends StatefulWidget {
  const EditEventScreen({Key? key}) : super(key: key);

  @override
  _EditEventScreenState createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  AppColors appColors = AppColors();

  String? selectedDate = "26 / 03 / 2021";
  String? selectedTime = "06:00";

  TextEditingController name = TextEditingController(text: "Musical Event 2021");
  TextEditingController price = TextEditingController(text: "\$ 200");
  TextEditingController date = TextEditingController(text: "26 / 03 / 2021");
  TextEditingController timeText = TextEditingController(text: "06:00");
  TextEditingController location = TextEditingController(text: "Royal Ln, San Francisco, USA");
  TextEditingController emailDetail = TextEditingController(text: "Some artists will really blow you away with their humility and inspire you to be better human being.");

  String dropDownValue = 'Category ';
  var items = ['Category ', 'Category 1', 'Category 2', 'Category 3', 'Category 4'];

  final ImagePicker picker = ImagePicker();
  XFile? image;
  File? imageFile;

  TimeOfDay time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
          decoration: BoxDecoration(
            color: appColors.appDarkColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(ResponsiveFlutter.of(context).moderateScale(20)),
              topRight: Radius.circular(ResponsiveFlutter.of(context).moderateScale(20)),
            ),
          ),
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
                  height: ResponsiveFlutter.of(context).verticalScale(100),
                  width: double.infinity,
                  corner: FDottedLineCorner.all(ResponsiveFlutter.of(context).moderateScale(20)),
                  child: Container(
                    height: ResponsiveFlutter.of(context).verticalScale(100),
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
              SizedBox(height: ResponsiveFlutter.of(context).verticalScale(5)),
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
              SizedBox(height: ResponsiveFlutter.of(context).verticalScale(5)),
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
                  controller: name,
                  keyboardType: TextInputType.multiline,
                  hintText: Strings.enterEventName,
                  icon: false,
                ),
              ),
              SizedBox(height: ResponsiveFlutter.of(context).verticalScale(5)),
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
                  controller: price,
                  context: context,
                  keyboardType: TextInputType.number,
                  hintText: Strings.price,
                  icon: false,
                ),
              ),
              SizedBox(height: ResponsiveFlutter.of(context).verticalScale(5)),
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
                  SizedBox(width: ResponsiveFlutter.of(context).moderateScale(10)),
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
                              selectedTime! + "PM",
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
              SizedBox(height: ResponsiveFlutter.of(context).verticalScale(5)),
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
                        controller: location,
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
              SizedBox(height: ResponsiveFlutter.of(context).verticalScale(5)),
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
                  controller: emailDetail,
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
              SizedBox(height: ResponsiveFlutter.of(context).verticalScale(20)),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: commonButton(
                  context: context,
                  title: Strings.save,
                ),
              ),
              SizedBox(height: ResponsiveFlutter.of(context).verticalScale(20)),
            ],
          ),
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
