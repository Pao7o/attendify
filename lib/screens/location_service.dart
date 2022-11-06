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
            padding: const EdgeInsets.all(32.0),
            child: Container(
            child: Center(child:
            Text(LocationTest().location,style: TextStyle(fontSize: 40,color: AppColors().lightColor),maxLines: 2,)
            ),
        ),
          ),
        SizedBox(width: double.infinity,

          child: Padding(
            padding: const EdgeInsets.only(left: 36.0,bottom: 8),
            child: Text('Address name :',textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColors().lightColor,fontSize: 25,),),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 0,bottom: 32, right: 32,left: 32),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFF6F6F6),
                borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              padding: EdgeInsets.only(top: 10),

              child: Center(
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(
                    height: 1.5,fontSize: 40,
                  ),
                  decoration: InputDecoration(

                    labelStyle:TextStyle(fontSize: 40,color: AppColors().appDarkColor,),
                    hintText: "Exemple : Home address...",
                    hintStyle: TextStyle(fontSize: 40,color: Colors.black12,),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: SizedBox(height: 800, width: 800,
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
