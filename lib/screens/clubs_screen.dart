import 'dart:math';

import 'package:filter_list/filter_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../features/common/app_colors.dart';
import '../features/common/common_widget.dart';
import '../features/common/image_path.dart';
import 'club_details_screen.dart';
import '../features/common/strings.dart';
import '../responsive/responsive_flutter.dart';
import 'chat_screen.dart';
import 'edit_event_screen.dart';

class ClubsScreen extends StatefulWidget {
  const ClubsScreen({Key? key}) : super(key: key);

  @override
  State<ClubsScreen> createState() => _ClubsScreenState();
}

class _ClubsScreenState extends State<ClubsScreen> {
  AppColors appColors = AppColors();
  ImagePath imagePath = ImagePath();

  void openFilterDialog() async {
    await FilterListDialog.display<Filters>(
      context,
      listData: hobbys,
      selectedListData: selectedFilterList,
      choiceChipLabel: (user) => user!.name,
      validateSelectedItem: (list, val) => list!.contains(val),
      onItemSearch: (user, query) {
        return user.name.toLowerCase().contains(query.toLowerCase());
      },
      onApplyButtonClick: (list) {
        setState(() {
          selectedFilterList = List.from(list!);
        });
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        backgroundColor: appColors.appMediumColor,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 4.0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      // Ajoutez une icône de loupe pour la recherche
                      const Icon(Icons.search),
                      const SizedBox(width: 8.0),
                      // Ajoutez une zone de texte pour la barre de recherche
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration.collapsed(
                            hintText: 'Search clubs...',
                          ),
                        ),
                      ),
                      // Ajoutez un bouton "Rechercher" qui appelle une fonction lorsqu'il est pressé
                      MaterialButton(
                        onPressed: () => openFilterDialog(),
                        child: const Icon(Icons.filter_list),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Ajoutez une liste de groupes sous la barre de recherche
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  itemCount: groups.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration:
                                const Duration(milliseconds: 500),
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    ClubDetails(
                              image: ImagePath.image_2,
                              nameGroup: groups[index].name,
                              passions: groups[index].passions,
                            ),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      child: Card(
                        color: Colors.black87,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(ImagePath.image_2),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          groups[index].profilePicture),
                                    ),
                                    const SizedBox(width: 8),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          groups[index].name,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Text('Public club',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ],
                                    ),
                                    const Spacer(),
                                    Row(
                                      children: <Widget>[
                                        const Icon(Icons.man,
                                            color: Colors.white),
                                        const SizedBox(width: 8),
                                        Text('${groups[index].memberCount}',
                                            style: const TextStyle(
                                                color: Colors.white)),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    const Icon(Icons.people_alt_rounded,
                                        color: Colors.white),
                                    const SizedBox(width: 8),
                                    Text('${groups[index].memberCount - 6}',
                                        style: const TextStyle(
                                            color: Colors.white)),
                                  ],
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Wrap(
                                    spacing: 8.0,
                                    runSpacing: 4.0,
                                    alignment: WrapAlignment.center,
                                    children: groups[index]
                                        .passions
                                        .map((passion) => Chip(
                                              label: Text(
                                                '#$passion',
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                              backgroundColor: Colors.purple,
                                            ))
                                        .toList(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Filters {
  final String name;

  Filters({this.name = ""});
}

List<Filters>? selectedFilterList = [];

List<Filters> hobbys = [
  Filters(
    name: "Techno",
  ),
  Filters(
    name: "Rap",
  ),
  Filters(
    name: "Free-party",
  ),
  Filters(
    name: "Electro",
  ),
  Filters(
    name: "Home-party",
  ),
  Filters(
    name: "Board game",
  ),
  Filters(
    name: "Nightclub",
  ),
  Filters(
    name: "Bar",
  ),
  Filters(
    name: "Disguised",
  ),
  Filters(
    name: "Dancehall",
  ),
  Filters(
    name: "Zouk",
  ),
  Filters(
    name: "Festival",
  ),
  Filters(
    name: "Concert",
  ),
  Filters(
    name: "Afterwork",
  ),
  Filters(
    name: "Students",
  ),
  Filters(
    name: "School Events",
  ),
  Filters(
    name: "Pop",
  ),
  Filters(
    name: "Rock",
  ),
  Filters(
    name: "Salsa",
  ),
  Filters(
    name: "Reggae",
  ),
  Filters(
    name: "Dub",
  ),
  Filters(
    name: "Reggaeton",
  ),
  Filters(
    name: "80's",
  ),
  Filters(
    name: "90's",
  ),
  Filters(
    name: "2000's",
  ),
];
final random = Random();
final randomIndex1 = random.nextInt(hobbys.length);
final randomIndex2 = random.nextInt(hobbys.length);
final randomIndex3 = random.nextInt(hobbys.length);
final randomIndex4 = random.nextInt(hobbys.length);
final randomIndex5 = random.nextInt(hobbys.length);
final randomIndex6 = random.nextInt(hobbys.length);
final randomIndex7 = random.nextInt(hobbys.length);
final randomIndex8 = random.nextInt(hobbys.length);
final randomIndex9 = random.nextInt(hobbys.length);

class Group {
  final String name;
  final String profilePicture;
  final List<String> passions;
  final int memberCount;

  Group({
    this.name = '',
    this.profilePicture = '',
    this.passions = const [],
    this.memberCount = 0,
  });
}

List<Group> groups = [
  Group(
    name: 'Groupe de musique',
    profilePicture: 'https://picsum.photos/200',
    passions: [
      hobbys[randomIndex1].name,
      hobbys[randomIndex2].name,
      hobbys[randomIndex3].name,
      hobbys[randomIndex4].name,
      hobbys[randomIndex5].name,
      hobbys[randomIndex6].name,
      hobbys[randomIndex7].name,
      hobbys[randomIndex8].name,
      hobbys[randomIndex9].name,
    ],
    memberCount: 10,
  ),
  Group(
    name: 'Groupe de danse',
    profilePicture: 'https://picsum.photos/200',
    passions: [
      hobbys[randomIndex1].name,
      hobbys[randomIndex2].name,
      hobbys[randomIndex3].name,
      hobbys[randomIndex4].name,
      hobbys[randomIndex5].name,
      hobbys[randomIndex6].name,
      hobbys[randomIndex7].name,
      hobbys[randomIndex8].name,
      hobbys[randomIndex9].name,
    ],
    memberCount: 15,
  ),
  Group(
    name: 'Groupe de sport',
    profilePicture: 'https://picsum.photos/200',
    passions: [
      hobbys[randomIndex1].name,
      hobbys[randomIndex2].name,
      hobbys[randomIndex3].name,
      hobbys[randomIndex4].name,
      hobbys[randomIndex5].name,
      hobbys[randomIndex6].name,
      hobbys[randomIndex7].name,
      hobbys[randomIndex8].name,
      hobbys[randomIndex9].name,
    ],
    memberCount: 20,
  ),
];
