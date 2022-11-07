import 'package:attendify/common/constants.dart';
import 'package:attendify/screens/location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter/services.dart' show rootBundle ;

import '../common/app_colors.dart';
import '../responsive/responsive_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';



class LocationTest extends StatefulWidget{
  String get location => _LocationTestState.location;

  @override
  _LocationTestState createState() => _LocationTestState();
}

class _LocationTestState extends State<LocationTest> {
  String googleApikey = "AIzaSyDG_znTnwlDEfiJ_VoaxMO23bRnwhlDH7g";
  GoogleMapController? mapController; //contrller for Google map
  CameraPosition? cameraPosition;
  LatLng startLocation = LatLng( 48.866667, 2.333333);
  static String location = "Search location";
  String? _mapStyle;

  @override
  void initState() {
    super.initState();
    if(Constants.darkTheme){
      rootBundle.loadString('assets/map_styles/map_styles.txt').then((string) {
        _mapStyle = string;}
      );
    }

  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          toolbarHeight:ResponsiveFlutter.of(context).moderateScale(56),
          backgroundColor: AppColors().appMediumColor,
          leading: IconButton(padding: EdgeInsets.only(left: ResponsiveFlutter.of(context).moderateScale(30)),
            icon: Icon(Icons.arrow_back_ios, color: AppColors().lightColor,size: ResponsiveFlutter.of(context).moderateScale(22),),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Container(
            margin: EdgeInsets.only(right:ResponsiveFlutter.of(context).moderateScale(56)),
            child: Center(child: SizedBox
              (child: Center(
                child: Text
                ("Location map",style: TextStyle
                (color:AppColors().lightColor,
                fontSize: ResponsiveFlutter.of(context).fontSize(2.7),),),
              ),
              width:ResponsiveFlutter.of(context).moderateScale(600),
            ),
            ),
          ),
        ),
        body: Stack(
            children:[

              GoogleMap( //Map widget from google_maps_flutter package
                zoomGesturesEnabled: true, //enable Zoom in, out on map
                initialCameraPosition: CameraPosition( //inital position in map
                  target: startLocation, //initial position
                  zoom: 12.0, //initial zoom level
                ),
                mapType: MapType.normal, //map type
                onMapCreated: (controller) { //method called when map is created
                  setState(() {
                    mapController = controller;
                    mapController?.setMapStyle(_mapStyle);

                  });
                },
                onCameraMove: (CameraPosition cameraPositiona) {
                  cameraPosition = cameraPositiona;
                },
                onCameraIdle: () async {
                  List<Placemark> placemarks = await placemarkFromCoordinates(cameraPosition!.target.latitude, cameraPosition!.target.longitude);
                  setState(() {
                    location = placemarks.first.administrativeArea.toString() + ", " +  placemarks.first.street.toString();
                  });
                },
              ),



              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      width: double.infinity,
                      height:ResponsiveFlutter.of(context).moderateScale(56),
                      margin: EdgeInsets.only(right: ResponsiveFlutter.of(context).moderateScale(60), left: ResponsiveFlutter.of(context).moderateScale(20),bottom: ResponsiveFlutter.of(context).moderateScale(20),),

                      child: ElevatedButton(

                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors().appMediumColor
                        ),
                        onPressed: () {
                          if(location=="Search location"){
                            Fluttertoast.showToast(
                                msg: "Enter your location before ;)",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 256
                            );

                          }else
                        Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context)=> const SaveAdress())
                        );
                        },
                        child:  Text(
                          "I'm here",

                          style: TextStyle(fontSize: ResponsiveFlutter.of(context).fontSize(3),color: AppColors().lightColor),
                        ),
                      ),


                      ),
                ],
                      ),






              //search autoconplete input
              Positioned(  //search input bar
                  top:ResponsiveFlutter.of(context).moderateScale(10),
                  child: InkWell(
                      onTap: () async {
                        var place = await PlacesAutocomplete.show(
                            context: context,
                            apiKey: googleApikey,
                            mode: Mode.overlay,
                            types: [],
                            strictbounds: false,
                            components: [Component(Component.country, 'fr')],
                            //google_map_webservice package
                            onError: (err){
                              print(err);
                            }
                        );

                        if(place != null){
                          setState(() {
                            location = place.description.toString();
                          });
                          //form google_maps_webservice package
                          final plist = GoogleMapsPlaces(apiKey:googleApikey,
                            apiHeaders: await GoogleApiHeaders().getHeaders(),
                            //from google_api_headers package
                          );
                          String placeid = place.placeId ?? "0";
                          final detail = await plist.getDetailsByPlaceId(placeid);
                          final geometry = detail.result.geometry!;
                          final lat = geometry.location.lat;
                          final lang = geometry.location.lng;
                          var newlatlang = LatLng(lat, lang);

                          //move map camera to selected place with animation
                          mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: newlatlang, zoom: 17)));
                        }
                      },
                      child:Padding(
                        padding: EdgeInsets.all(ResponsiveFlutter.of(context).moderateScale(15)),
                        child: Card(
                          child: Container(
                              padding: EdgeInsets.all(ResponsiveFlutter.of(context).moderateScale(4)),
                              width: MediaQuery.of(context).size.width - 40,
                              child: ListTile(
                                leading: Image.asset("assets/images/ic_map_picker.png", width: ResponsiveFlutter.of(context).moderateScale(25),),
                                title:Text(location, style: TextStyle(fontSize: ResponsiveFlutter.of(context).moderateScale(18)),),
                                trailing: Icon(Icons.search),
                                dense: true,
                              )
                          ),
                        ),
                      )
                  )
              )


            ]
        )
    );
  }
}