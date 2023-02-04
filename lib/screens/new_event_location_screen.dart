import 'package:attendify/screens/new_event_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:google_maps_webservice/directions.dart';
import 'package:google_maps_webservice/places.dart';

import '../features/common/app_colors.dart';
import '../features/common/constants.dart';
import '../responsive/responsive_flutter.dart';

class NewEventLocation extends StatefulWidget {
  final String eventName;
  final String eventDuration;

  const NewEventLocation(
      {Key? key, required this.eventName, required this.eventDuration})
      : super(key: key);

  @override
  State<NewEventLocation> createState() => _NewEventLocationState();
}

class _NewEventLocationState extends State<NewEventLocation> {
  AppColors appColors = AppColors();
  bool isExpanded = false;

  String googleApikey = "AIzaSyD5MSB1CS_v2naDJIcRIKGg9fXWXcKmRyQ";
  GoogleMapController? mapController; //controller for Google map
  CameraPosition? cameraPosition;
  LatLng startLocation = LatLng(48.866667, 2.333333);
  static String location = "Search location";
  String? _mapStyle;

  @override
  void initState() {
    super.initState();
    if (Constants.darkTheme) {
      rootBundle.loadString('assets/map_styles/map_styles.txt').then((string) {
        _mapStyle = string;
      });
    }
  }

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
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        widget.eventName+" will last " +widget.eventDuration +" but...",
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
                      Image.asset('assets/images/new_event_location.png'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          textAlign: TextAlign.center,
                          "Where ? Choose your location",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ),
                      InkWell(
                          onTap: () async {
                            var place = await PlacesAutocomplete.show(
                                context: context,
                                apiKey: googleApikey,
                                mode: Mode.overlay,
                                types: [],
                                strictbounds: false,
                                components: [
                                  Component(Component.country, 'fr')
                                ],
                                //google_map_webservice package
                                onError: (err) {
                                  print(err);
                                });

                            if (place != null) {
                              setState(() {
                                location = place.description.toString();
                              });
                              //form google_maps_webservice package
                              final plist = GoogleMapsPlaces(
                                apiKey: googleApikey,
                                apiHeaders:
                                    await GoogleApiHeaders().getHeaders(),
                                //from google_api_headers package
                              );
                              String placeid = place.placeId ?? "0";
                              final detail =
                                  await plist.getDetailsByPlaceId(placeid);
                              final geometry = detail.result.geometry!;
                              final lat = geometry.location.lat;
                              final lang = geometry.location.lng;
                              var newlatlang = LatLng(lat, lang);

                              //move map camera to selected place with animation
                              mapController?.animateCamera(
                                  CameraUpdate.newCameraPosition(
                                      CameraPosition(
                                          target: newlatlang, zoom: 17)));
                            }
                          },
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                                ResponsiveFlutter.of(context)
                                    .moderateScale(15),
                                ResponsiveFlutter.of(context)
                                    .moderateScale(0),
                                ResponsiveFlutter.of(context)
                                    .moderateScale(15),
                                ResponsiveFlutter.of(context)
                                    .moderateScale(15)),
                            child: Card(
                              child: Container(
                                  padding: EdgeInsets.all(
                                      ResponsiveFlutter.of(context)
                                          .moderateScale(4)),
                                  width:
                                      MediaQuery.of(context).size.width - 40,
                                  child: ListTile(
                                    leading: Image.asset(
                                      "assets/images/ic_map_picker.png",
                                      width: ResponsiveFlutter.of(context)
                                          .moderateScale(25),
                                    ),
                                    title: Text(
                                      location,
                                      style: TextStyle(
                                          fontSize:
                                              ResponsiveFlutter.of(context)
                                                  .moderateScale(18)),
                                    ),
                                    trailing: Icon(Icons.search),
                                    dense: true,
                                  )),
                            ),
                          )),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Container(
                          height: 180,
                          width: 370,
                          decoration: BoxDecoration(),
                          child: Stack(
                            children: [
                              GoogleMap(
                                zoomControlsEnabled: false,
                                zoomGesturesEnabled: true,
                                //enable Zoom in, out on map
                                initialCameraPosition: CameraPosition(
                                  //inital position in map
                                  target: startLocation,
                                  //initial position
                                  zoom: 12.0, //initial zoom level
                                ),
                                mapType: MapType.normal,
                                //map type
                                onMapCreated: (controller) {
                                  //method called when map is created
                                  setState(() {
                                    mapController = controller;
                                    mapController?.setMapStyle(_mapStyle);
                                  });
                                },
                                onCameraMove:
                                    (CameraPosition cameraPositiona) {
                                  cameraPosition = cameraPositiona;
                                },
                                onCameraIdle: () async {
                                  List<Placemark> placemarks =
                                      await placemarkFromCoordinates(
                                          cameraPosition!.target.latitude,
                                          cameraPosition!.target.longitude);
                                  setState(() {
                                    location = placemarks.first.street
                                            .toString() +
                                        ", " +
                                        placemarks.first.locality.toString();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              width: 150,
                              height: 50,
                              child: MaterialButton(
                                  color: Colors.red[800],
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0),
                                      side: BorderSide(color: Colors.black)),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Icon(Icons.arrow_back,
                                          color: appColors.lightColor),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Text(
                                        "Back",
                                        style: TextStyle(
                                            color: appColors.lightColor,
                                            fontSize:
                                                ResponsiveFlutter.of(context)
                                                    .fontSize(2)),
                                      ),
                                    ],
                                  )),
                            ),
                            SizedBox(
                              width: 150,
                              height: 50,
                              child: MaterialButton(
                                  color: Colors.green[400],
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0),
                                      side: BorderSide(color: Colors.black)),
                                  onPressed: () {
                                    if (location != "Search location") {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                NewEventsDetails(),
                                          ));
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text("Choose place :) "),
                                      ));
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Continue",
                                        style: TextStyle(
                                            color: appColors.lightColor,
                                            fontSize:
                                                ResponsiveFlutter.of(context)
                                                    .fontSize(2)),
                                      ),
                                      Icon(Icons.arrow_forward,
                                          color: appColors.lightColor)
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 84),
                        child: Stack(
                          children: [
                            LinearProgressIndicator(
                              backgroundColor: Colors.grey[200],
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.purple),
                              value: 0.4,
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('40%'),
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
          ],
        ),
      )),
    );
  }
}
