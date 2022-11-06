import 'package:attendify/screens/search_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:attendify/common/app_colors.dart';
import 'package:attendify/common/common_widget.dart';
import 'package:attendify/common/image_path.dart';
import 'package:attendify/common/strings.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../responsive/responsive_flutter.dart';
import 'edit_profile_screen.dart';
import 'location_controller.dart';


class LocationMap extends StatefulWidget {


  const LocationMap({Key? key}) : super(key: key);

  @override
  State<LocationMap> createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {
  late CameraPosition _cameraPosition;

  @override
  void initState(){
    super.initState();
    _cameraPosition=CameraPosition(target: LatLng(
        45.521563,-122.677433
    ), zoom: 17);
  }
  late GoogleMapController _mapController;

  AppColors appColors = AppColors();

  static const LatLng sourceLocation = LatLng(48.866667, 2.333333);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: appColors.appMediumColor,
            body: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: ResponsiveFlutter.of(context).moderateScale(45),
                      width: double.infinity,
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.symmetric(
                        vertical: ResponsiveFlutter.of(context).moderateScale(20),
                        horizontal: ResponsiveFlutter.of(context).moderateScale(20),
                      ),
                      decoration: BoxDecoration(
                        color: appColors.appDarkColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(ResponsiveFlutter.of(context).moderateScale(0)),
                          bottomRight: Radius.circular(ResponsiveFlutter.of(context).moderateScale(0)),
                        ),
                      ),

                    ),
                    commonAppBar(
                      appBarHeight:ResponsiveFlutter.of(context).moderateScale(45),
                      iconsize: ResponsiveFlutter.of(context).moderateScale(50),
                      editStack: StackFit.expand,
                      textSize: ResponsiveFlutter.of(context).fontSize(2.7),
                      editPadding: EdgeInsets.only(
                        bottom: ResponsiveFlutter.of(context).moderateScale(0),
                        left: ResponsiveFlutter.of(context).moderateScale(0),
                        right: ResponsiveFlutter.of(context).moderateScale(0),
                      ),
                      context: context,
                      backArrow: true,
                      title: Strings.dummyText39,
                      appBarColor: appColors.appDarkColor,
                      search: true,
                      searchClick: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchLocation(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Expanded(

                    child: GoogleMap(initialCameraPosition: CameraPosition(target: sourceLocation,zoom: 14.5,))
                )
              ],
            ),
    ),
        ),
    );

  }
}
