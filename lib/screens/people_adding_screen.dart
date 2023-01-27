import 'package:flutter/material.dart';

import '../features/common/app_colors.dart';
import '../features/common/image_path.dart';

class PeopleAdding extends StatefulWidget {
  const PeopleAdding({Key? key}) : super(key: key);

  @override
  State<PeopleAdding> createState() => _PeopleAddingState();
}

class _PeopleAddingState extends State<PeopleAdding> {
  AppColors appColors = AppColors();
  ImagePath imagePath = ImagePath();
  @override
  Widget build(BuildContext context) {
    List<Person> suggestionList = [
      Person(
        name: 'Alice',
        imageUrl: 'https://pbs.twimg.com/profile_images/1145687918438850561/N8QZzGJ5_400x400.jpg',
        followers: '35',
        friends: '10',
      ),
      Person(
        name: 'Bob',
        imageUrl: 'https://pbs.twimg.com/profile_images/1147538107617146880/h6Z2Q6Tn_400x400.jpg',
        followers: '45',
        friends: '7',
      ),
      Person(
        name: 'Charlie',
        imageUrl: 'https://pbs.twimg.com/profile_images/1152366353904009216/D8jEaJ7M_400x400.jpg',
        followers: '65',
        friends: '3',
      ),
    ];
    return SafeArea(
      top: false,
        bottom: false,
        child:Scaffold(
          backgroundColor: appColors.appMediumColor,
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 600,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      itemCount: suggestionList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 8,mainAxisSpacing: 16,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 20,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Flex(
                              direction: Axis.vertical,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage(suggestionList[index].imageUrl),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    suggestionList[index].name,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '${suggestionList[index].followers} followers - ${suggestionList[index].friends} friends',
                                  ),
                                ),

                                Expanded(
                                  flex: 2,
                                  child: ButtonBar(
                                    alignment: MainAxisAlignment.center,
                                    children: [
                                      MaterialButton(
                                        child: Text('FOLLOW'),
                                        onPressed: () {

                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )

                          ),
                        );
                      },
                    ),
                  )



                ),

              ],
            ),
          ),

        )
    );
  }
}

class Person {
  final String name;
  final String imageUrl;
  final String followers;
  final String friends;

  Person( {required this.name,required this.followers, required this.friends, required this.imageUrl});
}
