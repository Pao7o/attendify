import 'package:attendify/features/common/image_path.dart';
import 'package:flutter/material.dart';
import '../features/common/app_colors.dart';
import 'full_screen_images_screen.dart';

class ClubDetails extends StatefulWidget {
  final String image; // Ajoutez cette ligne pour passer l'image en paramètre
  final String nameGroup;
  final List<String> passions;

  ClubDetails({required this.image,required this.nameGroup,required this.passions}) : super(); // Et cette ligne pour l'initialiser

  @override
  _ClubDetailsState createState() => _ClubDetailsState();
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
                              'Public group',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 25,),
                            Text(
                              '120 members',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                  ),
                                ),
                            SizedBox(width: 25,),
                            Text(
                              '3 friends',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
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
                              color: Colors.white,
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
                        padding: const EdgeInsets.all(16),
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
                      GridView.count(
                        shrinkWrap: true,
                        primary: false,
                        crossAxisCount: 3, // Nombre de colonnes
                        children: List.generate(9, (index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FullScreenImage(imageAsset:ImagePath.image_2),
                                ),
                              );
                            },
                            child: Container(
                              height: 10,
                              width: 10,
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
                                ImagePath.image_2,
                                fit: BoxFit.cover,
                              ),

                            ),
                          );
                        }),
                      )

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
