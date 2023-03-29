import 'package:attendify/screens/new_event_location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../common/app_colors.dart';
import '../../common/common_widget.dart';
import '../../common/image_path.dart';
import '../../../responsive/responsive_flutter.dart';

class NewEventDate extends StatefulWidget {
  final String eventName;

  const NewEventDate({
    Key? key,
    required this.eventName,
  }) : super(key: key);

  @override
  State<NewEventDate> createState() => _NewEventDateState();
}

class _NewEventDateState extends State<NewEventDate> {
  AppColors appColors = AppColors();
  final _formKey = GlobalKey<FormState>();
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  DateTime startSelectedTime = DateTime.now();
  DateTime endSelectedTime = DateTime.now();
  var dateFormat = DateFormat("dd/MM/yyyy");
  TimeOfDay time = TimeOfDay.now();
  TimeOfDay time2 = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light
          .copyWith(statusBarColor: appColors.appMediumColor),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF2F2644),
                        Color(0xFF4B4E69),
                        Color(0xFF8B81A4),
                      ],
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            widget.eventName,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Image.asset(
                            'assets/images/new_event_date.png',
                          ),
                          const Text(
                            "Date and time of the event :",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        MyTextView(
                                          "Start Date",
                                          styleNew: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Image.asset(
                                          ImagePath.pinkCalendar,
                                          color: appColors.lightPinkColor,
                                          height: ResponsiveFlutter.of(context)
                                              .moderateScale(23),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        final DateTime? picked =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2035),
                                        );
                                        if (picked != null) {
                                          startDate = picked;
                                          setState(() {});
                                        }
                                      },
                                      child: Container(
                                        height: ResponsiveFlutter.of(context)
                                            .verticalScale(50),
                                        width: ResponsiveFlutter.of(context)
                                            .scale(150),
                                        padding: EdgeInsets.symmetric(
                                          horizontal:
                                              ResponsiveFlutter.of(context)
                                                  .moderateScale(20),
                                        ),
                                        decoration: BoxDecoration(
                                          color: appColors.appLightColor,
                                          borderRadius: BorderRadius.circular(
                                            ResponsiveFlutter.of(context)
                                                .moderateScale(20),
                                          ),
                                          border: Border.all(
                                            color: appColors.borderColor,
                                            width: 1.5,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: MyTextView(
                                                DateFormat.yMd()
                                                    .format(startDate),
                                                textAligntNew: TextAlign.center,
                                                styleNew: MyTextStyle(
                                                  colorNew:
                                                      appColors.lightColor,
                                                  fontWeightNew:
                                                      FontWeight.w400,
                                                  size: ResponsiveFlutter.of(
                                                          context)
                                                      .fontSize(1.8),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        MyTextView(
                                          "End Date",
                                          styleNew: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Image.asset(
                                          ImagePath.pinkCalendar,
                                          color: appColors.lightPinkColor,
                                          height: ResponsiveFlutter.of(context)
                                              .moderateScale(23),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        final DateTime? picked =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2035),
                                        );
                                        if (picked != null) {
                                          endDate = picked;
                                          setState(() {});
                                        }
                                      },
                                      child: Container(
                                        height: ResponsiveFlutter.of(context)
                                            .verticalScale(50),
                                        width: ResponsiveFlutter.of(context)
                                            .scale(150),
                                        padding: EdgeInsets.symmetric(
                                          horizontal:
                                              ResponsiveFlutter.of(context)
                                                  .moderateScale(20),
                                        ),
                                        decoration: BoxDecoration(
                                          color: appColors.appLightColor,
                                          borderRadius: BorderRadius.circular(
                                            ResponsiveFlutter.of(context)
                                                .moderateScale(20),
                                          ),
                                          border: Border.all(
                                            color: appColors.borderColor,
                                            width: 1.5,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: MyTextView(
                                                DateFormat.yMd()
                                                    .format(endDate),
                                                textAligntNew: TextAlign.center,
                                                styleNew: MyTextStyle(
                                                  colorNew:
                                                      appColors.lightColor,
                                                  fontWeightNew:
                                                      FontWeight.w400,
                                                  size: ResponsiveFlutter.of(
                                                          context)
                                                      .fontSize(1.8),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        MyTextView(
                                          "Start Time",
                                          styleNew: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Image.asset(
                                          ImagePath.pinkTime,
                                          color: appColors.lightPinkColor,
                                          height: ResponsiveFlutter.of(context)
                                              .moderateScale(23),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        startTime(context);
                                      },
                                      child: Container(
                                        height: ResponsiveFlutter.of(context)
                                            .verticalScale(50),
                                        width: ResponsiveFlutter.of(context)
                                            .scale(150),
                                        padding: EdgeInsets.symmetric(
                                          horizontal:
                                              ResponsiveFlutter.of(context)
                                                  .moderateScale(20),
                                        ),
                                        decoration: BoxDecoration(
                                          color: appColors.appLightColor,
                                          borderRadius: BorderRadius.circular(
                                            ResponsiveFlutter.of(context)
                                                .moderateScale(20),
                                          ),
                                          border: Border.all(
                                            color: appColors.borderColor,
                                            width: 1.5,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: MyTextView(
                                                DateFormat.Hm()
                                                    .format(startSelectedTime),
                                                textAligntNew: TextAlign.center,
                                                styleNew: MyTextStyle(
                                                  colorNew:
                                                      appColors.lightColor,
                                                  fontWeightNew:
                                                      FontWeight.w400,
                                                  size: ResponsiveFlutter.of(
                                                          context)
                                                      .fontSize(1.8),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        MyTextView(
                                          "End Time",
                                          styleNew: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Image.asset(
                                          ImagePath.pinkTime,
                                          color: appColors.lightPinkColor,
                                          height: ResponsiveFlutter.of(context)
                                              .moderateScale(23),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        endTime(context);
                                      },
                                      child: Container(
                                        height: ResponsiveFlutter.of(context)
                                            .verticalScale(50),
                                        width: ResponsiveFlutter.of(context)
                                            .scale(150),
                                        padding: EdgeInsets.symmetric(
                                          horizontal:
                                              ResponsiveFlutter.of(context)
                                                  .moderateScale(20),
                                        ),
                                        decoration: BoxDecoration(
                                          color: appColors.appLightColor,
                                          borderRadius: BorderRadius.circular(
                                            ResponsiveFlutter.of(context)
                                                .moderateScale(20),
                                          ),
                                          border: Border.all(
                                            color: appColors.borderColor,
                                            width: 1.5,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: MyTextView(
                                                DateFormat.Hm()
                                                    .format(endSelectedTime),
                                                textAligntNew: TextAlign.center,
                                                styleNew: MyTextStyle(
                                                  colorNew:
                                                      appColors.lightColor,
                                                  fontWeightNew:
                                                      FontWeight.w400,
                                                  size: ResponsiveFlutter.of(
                                                          context)
                                                      .fontSize(1.8),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 250,
                            height: 50,
                            child: MaterialButton(
                                color: appColors.btnColor,
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side:
                                        const BorderSide(color: Colors.black)),
                                onPressed: () {
                                  if (dateIsValide()) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              NewEventLocation(
                                            eventName: widget.eventName,
                                            eventDuration: calculateDuration(),
                                          ),
                                        ));
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text(
                                          "The start date/hour must be greater than the end date/hour"),
                                    ));
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 65.0),
                                      child: Text(
                                        "Continue",
                                        style: TextStyle(
                                            color: appColors.lightColor,
                                            fontSize:
                                                ResponsiveFlutter.of(context)
                                                    .fontSize(2)),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 50,
                                    ),
                                    Icon(Icons.arrow_forward,
                                        color: appColors.lightColor)
                                  ],
                                )),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                            width: 250,
                            height: 50,
                            child: MaterialButton(
                                color: appColors.blurBtnColor,
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side:
                                        const BorderSide(color: Colors.black)),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Icon(Icons.arrow_back,
                                        color: appColors.lightColor),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 35.0),
                                      child: Text(
                                        "Back",
                                        style: TextStyle(
                                            color: appColors.lightColor,
                                            fontSize:
                                                ResponsiveFlutter.of(context)
                                                    .fontSize(2)),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 80,
                                    )
                                  ],
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 84),
                            child: Stack(
                              children: [
                                LinearProgressIndicator(
                                  backgroundColor: Colors.grey[200],
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                          Colors.purple),
                                  value: 0.2,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('20%'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool dateIsValide() {
    if (startSelectedTime == DateTime.now() ||
        endSelectedTime == DateTime.now()) {
      return false;
    }
    return startDate.isBefore(endDate) || startDate.isAtSameMomentAs(endDate);

    // &&
    // int.parse(startSelectedTime.toString().split(":")[0]) * 60 +
    // int.parse(startSelectedTime.toString().split(":")[1]) <
    //int.parse(endSelectedTime.toString().split(":")[0]) * 60 +
    //int.parse(endSelectedTime.toString().split(":")[1]));
  }

  String calculateDuration() {
  
    Duration duration = DateFormat("dd / MM / yyyy HH:mm")
        .parse('$endDate $endSelectedTime')
        .difference(DateFormat("dd / MM / yyyy HH:mm")
            .parse('$startDate $startSelectedTime'));

    if (duration.inDays > 0) {
      return '${duration.inDays} day(s)';
    } else if (duration.inHours > 0) {
      return '${duration.inHours} hour(s)';
    } else {
      return '${duration.inMinutes} minute(s)';
    }
  }

  startTime(BuildContext context1) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context1,
      initialTime: time,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != time) {
      time = timeOfDay;
      debugPrint("time ------------- >>>> $timeOfDay");
      //startSelectedTime =
      //    "${timeOfDay.hour < 10 ? "0" : ""}${timeOfDay.hour}:${timeOfDay.minute < 10 ? "0" : ""}${timeOfDay.minute}";
      setState(() {});
    } else {
      debugPrint("<<<< ------------- Time Not Selected ------------- >>>>");
    }
  }

  endTime(BuildContext context2) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context2,
      initialTime: time2,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != time2) {
      time2 = timeOfDay;
      debugPrint("time ------------- >>>> $timeOfDay");
      // endSelectedTime =
      //   "${timeOfDay.hour < 10 ? "0" : ""}${timeOfDay.hour}:${timeOfDay.minute < 10 ? "0" : ""}${timeOfDay.minute}";

      setState(() {});
    } else {
      debugPrint("<<<< ------------- Time Not Selected ------------- >>>>");
    }
  }
}
