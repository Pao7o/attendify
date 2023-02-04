import 'package:attendify/screens/new_event_location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../features/common/app_colors.dart';
import '../features/common/common_widget.dart';
import '../features/common/image_path.dart';
import '../responsive/responsive_flutter.dart';
import 'new_event_name_screen.dart';

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
  String? startDate = "Start date";
  String? endDate = "End date";
  String? startSelectedTime = "Start time";
  String? endSelectedTime = "End time";
  var dateFormat = new DateFormat("dd/MM/yyyy");
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
                  decoration: BoxDecoration(
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
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            "${widget.eventName} ? Original.",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Image.asset('assets/images/new_event_date.png'),
                          Text(
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
                                      startDate = DateFormat('dd / MM / yyyy')
                                          .format(picked);
                                      setState(() {});
                                    }
                                  },
                                  child: Container(
                                    height: ResponsiveFlutter.of(context)
                                        .verticalScale(50),
                                    width: ResponsiveFlutter.of(context)
                                        .scale(150),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: ResponsiveFlutter.of(context)
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
                                            startDate!,
                                            textAligntNew: TextAlign.center,
                                            styleNew: MyTextStyle(
                                              colorNew: appColors.lightColor,
                                              fontWeightNew: FontWeight.w400,
                                              size:
                                                  ResponsiveFlutter.of(context)
                                                      .fontSize(1.8),
                                            ),
                                          ),
                                        ),
                                        Image.asset(
                                          ImagePath.pinkCalendar,
                                          color: appColors.lightPinkColor,
                                          height: ResponsiveFlutter.of(context)
                                              .moderateScale(23),
                                        )
                                      ],
                                    ),
                                  ),
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
                                      endDate = DateFormat('dd / MM / yyyy')
                                          .format(picked);
                                      setState(() {});
                                    }
                                  },
                                  child: Container(
                                    height: ResponsiveFlutter.of(context)
                                        .verticalScale(50),
                                    width: ResponsiveFlutter.of(context)
                                        .scale(150),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: ResponsiveFlutter.of(context)
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
                                            endDate!,
                                            textAligntNew: TextAlign.center,
                                            styleNew: MyTextStyle(
                                              colorNew: appColors.lightColor,
                                              fontWeightNew: FontWeight.w400,
                                              size:
                                                  ResponsiveFlutter.of(context)
                                                      .fontSize(1.8),
                                            ),
                                          ),
                                        ),
                                        Image.asset(
                                          ImagePath.pinkCalendar,
                                          color: appColors.lightPinkColor,
                                          height: ResponsiveFlutter.of(context)
                                              .moderateScale(23),
                                        )
                                      ],
                                    ),
                                  ),
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
                                      horizontal: ResponsiveFlutter.of(context)
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
                                            startSelectedTime!,
                                            textAligntNew: TextAlign.center,
                                            styleNew: MyTextStyle(
                                              colorNew: appColors.lightColor,
                                              fontWeightNew: FontWeight.w400,
                                              size:
                                                  ResponsiveFlutter.of(context)
                                                      .fontSize(1.8),
                                            ),
                                          ),
                                        ),
                                        Image.asset(
                                          ImagePath.pinkTime,
                                          color: appColors.lightPinkColor,
                                          height: ResponsiveFlutter.of(context)
                                              .moderateScale(23),
                                        ),
                                      ],
                                    ),
                                  ),
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
                                      horizontal: ResponsiveFlutter.of(context)
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
                                            endSelectedTime!,
                                            textAligntNew: TextAlign.center,
                                            styleNew: MyTextStyle(
                                              colorNew: appColors.lightColor,
                                              fontWeightNew: FontWeight.w400,
                                              size:
                                                  ResponsiveFlutter.of(context)
                                                      .fontSize(1.8),
                                            ),
                                          ),
                                        ),
                                        Image.asset(
                                          ImagePath.pinkTime,
                                          color: appColors.lightPinkColor,
                                          height: ResponsiveFlutter.of(context)
                                              .moderateScale(23),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 250,
                            height: 50,
                            child: MaterialButton(
                                color: Colors.green[400],
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side: BorderSide(color: Colors.black)),
                                onPressed: () {
                                  if (dateIsValide()) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              NewEventLocation(),
                                        ));
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
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
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Icon(Icons.arrow_forward,
                                        color: appColors.lightColor)
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                            width: 250,
                            height: 50,
                            child: MaterialButton(
                                color: Colors.red[800],
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side: BorderSide(color: Colors.black)),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Icon(Icons.arrow_back,
                                        color: appColors.lightColor),
                                    SizedBox(
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
                                    SizedBox(
                                      width: 80,
                                    )
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 84),
                            child: Stack(
                              children: [
                                LinearProgressIndicator(
                                  backgroundColor: Colors.grey[200],
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.purple),
                                  value: 0.2,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
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
    return DateFormat("dd / MM / yyyy")
            .parse(startDate!)
            .isBefore(DateFormat("dd / MM / yyyy").parse(endDate!)) ||
        (DateFormat("dd / MM / yyyy").parse(startDate!).isAtSameMomentAs(
                DateFormat("dd / MM / yyyy").parse(endDate!)) &&
            int.parse(startSelectedTime!.split(":")[0]) * 60 +
                    int.parse(startSelectedTime!.split(":")[1]) <
                int.parse(endSelectedTime!.split(":")[0]) * 60 +
                    int.parse(endSelectedTime!.split(":")[1]));
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
      startSelectedTime = timeOfDay.hour.toString() +
          " : " +
          (timeOfDay.minute < 10 ? "0" : "") +
          timeOfDay.minute.toString();
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
      endSelectedTime = timeOfDay.hour.toString() +
          " : " +
          (timeOfDay.minute < 10 ? "0" : "") +
          timeOfDay.minute.toString();

      setState(() {});
    } else {
      debugPrint("<<<< ------------- Time Not Selected ------------- >>>>");
    }
  }
}
