import 'package:attendify/features/common/image_path.dart';
import 'package:flutter/material.dart';
import '../features/common/app_colors.dart';
import 'full_screen_images_screen.dart';
import 'mini_events_widget.dart';

class ClubDetails extends StatefulWidget {
  final String image; // Ajoutez cette ligne pour passer l'image en paramètre
  final String nameGroup;
  final List<String> passions;
  final int members;
  final int friends;
  final bool isPublic;



  ClubDetails({required this.image,required this.nameGroup,required this.passions, required this.members, required this.friends, required this.isPublic,}) : super(); // Et cette ligne pour l'initialiser

  @override
  _ClubDetailsState createState() => _ClubDetailsState(events: [ {
    'name': 'Soirée de fin d\'année',
    'date': '31 décembre 2022',
    'numGroupMembers': 50,
  },
    {
      'name': 'Randonnée en montagne',
      'date': '6 janvier 2023',
      'numGroupMembers': 12,
    },
    {
      'name': 'Festival de musique',
      'date': '19-21 août 2023',
      'numGroupMembers': 35,
    },]);
}

class _ClubDetailsState extends State<ClubDetails> {
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }
  String _buttonText = 'Join group';

  List<String> imageAssets = [
    ImagePath.image_1,
    ImagePath.image_2,
    ImagePath.image_3,
    ImagePath.image_4,
    ImagePath.image_5,
    ImagePath.image_6,
    ImagePath.image_7,
    ImagePath.image_8,

  ];
  final List<Map<String, dynamic>> events;

   _ClubDetailsState({
    required this.events,
  }) : super();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().appMediumColor,
        body : ClipRRect(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  expandedHeight: 200,
                  floating: false,
                  flexibleSpace: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(50),
                    ),
                    child: FlexibleSpaceBar(
                      centerTitle: true,
                      background: Column(
                        children:
                        [
                          Expanded(
                            child: Image.asset(
                              widget.image,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                    Column(
                    children: <Widget>[
                    Center(
            child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://picsum.photos/200/300'),
            ),
          ),
        ),
      Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Center(
          child: Text(
            widget.nameGroup,
            style: TextStyle(
              fontSize: 28,
              fontFamily: 'Pacifico',
              fontWeight: FontWeight.bold,
              color: AppColors().btnColor,
                          ),
                        ),
                      ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              widget.isPublic? 'Public Club' : 'Private Club',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors().lightColor,
                              ),
                            ),
                            SizedBox(width: 25,),
                            Text(
                              '${widget.members} members',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors().lightColor,
                                  ),
                                ),
                            SizedBox(width: 25,),
                            Text(
                              '${widget.friends} friends',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors().lightColor,
                              ),
                            ),
                              ],
                            ),
                          ),
                      MaterialButton(
                        onPressed: () {
                          snackBar('Group joined !');
                          setState(() {
                            _buttonText = 'Open chat group';
                          });
                        },
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(
                          _buttonText,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        minWidth: 300,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Description:',
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors().btnColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric( horizontal: 16),
                        child: Container(
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors().lightColor,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Hobbies :',
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors().btnColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        alignment: WrapAlignment.center,
                        children: widget.passions
                            .map((passion) => Chip(
                          label: Text(
                            '#$passion',
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.purple,
                        ))
                            .toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16,top: 16),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Medias :',
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors().btnColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      GridView.count(padding: EdgeInsets.all(16),
                        shrinkWrap: true,
                        primary: false,
                        crossAxisCount: 6, // Nombre de colonnes
                        children: List.generate(imageAssets.length, (index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FullScreenImage(imageAssets: imageAssets,initialIndex: index),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5.0,
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                imageAssets[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16,top: 16),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Events :',
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors().btnColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: events.map((event) {
                          return Column(
                            children: [
                              EventWidget(
                                eventName: event['name'],
                                // autres propriétés de l'événement
                              ),
                              SizedBox(height: 8),
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      );
    }
  }
