import 'package:attendify/screens/location_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:attendify/common/image_path.dart';


import '../common/app_colors.dart';
import '../responsive/responsive_flutter.dart';

class SaveAdress extends StatefulWidget {
  const SaveAdress({Key? key}) : super(key: key);

  @override
  State<SaveAdress> createState() => _SaveAdressState();
}

class _SaveAdressState extends State<SaveAdress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().appMediumColor,
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.all(ResponsiveFlutter.of(context).moderateScale(20)),
            child: Container(
              width: double.infinity,
              child: Row(
                children: [
                  Flexible(
                    child:
                        Row(
                          children: [
                            IconButton(onPressed: ()=> Navigator.of(context).pop(),
                            icon: Icon(Icons.arrow_back_ios, color: AppColors().lightColor,size: ResponsiveFlutter.of(context).moderateScale(22)),

                            ),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.all(ResponsiveFlutter.of(context).moderateScale(10)),
                                child: Text(LocationTest().location,style: TextStyle(fontSize: ResponsiveFlutter.of(context).fontSize(2),color: AppColors().lightColor),maxLines: 2,),
                              ),
                            ),
                          ],
                        ),

                  ),
                ],
              ),
            ),
          ),
        SizedBox(width: double.infinity,

          child: Padding(
            padding: EdgeInsets.only(left: ResponsiveFlutter.of(context).moderateScale(20),bottom: ResponsiveFlutter.of(context).moderateScale(5)),
            child: Text('Address name :',textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColors().lightColor,fontSize: ResponsiveFlutter.of(context).fontSize(1.5),),),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(bottom: ResponsiveFlutter.of(context).moderateScale(18), right: ResponsiveFlutter.of(context).moderateScale(18),left: ResponsiveFlutter.of(context).moderateScale(18)),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFF6F6F6),
                borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              padding: EdgeInsets.only(top: ResponsiveFlutter.of(context).moderateScale(5)),

              child: Center(
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(
                    height:  ResponsiveFlutter.of(context).moderateScale(1),fontSize: ResponsiveFlutter.of(context).fontSize(2),
                  ),
                  decoration: InputDecoration(

                    labelStyle:TextStyle(fontSize: ResponsiveFlutter.of(context).fontSize(2),color: AppColors().appDarkColor,),
                    hintText: "Exemple : Home address...",
                    hintStyle: TextStyle(fontSize: ResponsiveFlutter.of(context).fontSize(2),color: Colors.black12,),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: SizedBox(height:  ResponsiveFlutter.of(context).moderateScale(450), width:  ResponsiveFlutter.of(context).moderateScale(450),
                child: Image.asset(ImagePath().address,fit: BoxFit.fill,)),
          ),
           ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors().appMediumColor,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(color : AppColors().lightColor)

              )

            ),
            onPressed: () {

            },
            child:  Text(
              "Save this address",

              style: TextStyle(fontSize: ResponsiveFlutter.of(context).fontSize(3),color: AppColors().lightColor),
            ),
          ),
        ],
      ),
    );
  }
}
