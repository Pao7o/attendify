import 'package:attendify/screens/contacts_screen.dart';
import 'package:attendify/screens/location_map.dart';
import 'package:attendify/screens/share_media_screen.dart';
import 'package:flutter/material.dart';

import '../features/common/app_colors.dart';
import '../features/common/image_path.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {


  AppColors appColors = AppColors();
  ImagePath imagePath = ImagePath();

  bool _isSelected = false;
  Chat _selectedChat = Chat(name: '', message: '', time: '');
  List<Chat> _selectedChats = [];
  List<GroupChat> groupChats = [];

  Widget _showDeleteConfirmationDialog(List<Chat> chats) {
    return AlertDialog(
      title: Text("Supprimer les conversations sélectionnées ?"),
      content: Text("Cette action est irréversible"),
      actions: <Widget>[
        MaterialButton(
          child: Text("Annuler"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        MaterialButton(
          child: Text("Supprimer"),
          onPressed: () {
            setState(() {
              chats.removeWhere((chat) => _selectedChats.contains(chat));
              _selectedChats.clear();
            });

            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.appMediumColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 200),
              pageBuilder: (context, animation, secondaryAnimation) =>
                  ContactsScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              },
            ),
          );
        },
        child: Icon(Icons.people_alt),
        backgroundColor: appColors.btnColor,
      ),
      appBar: AppBar(
        title: Text('Discussions'),
        backgroundColor: appColors.black,
        actions: <Widget>[
          if (_selectedChats.isNotEmpty)
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      _showDeleteConfirmationDialog(chats),
                );
              },
            ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: ChatSearchDelegate(chats));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return (chat is IndividualChat) ? Container(
            decoration: BoxDecoration(
              color: _selectedChats.contains(chat) ? Colors.white24 : null,
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                child: Text(chat.name[0]),
              ),
              title: Text(
                chat.name,
                style: TextStyle(color: appColors.white),
              ),
              subtitle: Text(
                chat.message,
                style: TextStyle(color: appColors.greyTextColor),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    chat.time,
                    style: TextStyle(color: Colors.green),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child:
                        Text('99', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageViewScreen(chat.name),
                  ),
                );
              },
              onLongPress: () {
                setState(() {
                  if (_selectedChats.contains(chat)) {
                    _selectedChats.remove(chat);
                  } else {
                    _selectedChats.add(chat);
                  }
                });
              },
            ),
          ) : Container(
            decoration: BoxDecoration(
              color: _selectedChats.contains(chat) ? Colors.white24 : null,
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                child: Text(chat.name[0]),
              ),
              title: Text(
                chat.name,
                style: TextStyle(color: appColors.white),
              ),
              subtitle: Text(
                "${(chat as GroupChat).members[0]} : "+chat.message,
                style: TextStyle(color: appColors.greyTextColor),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    chat.time,
                    style: TextStyle(color: Colors.green),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child:
                        Text('99', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageViewScreen(chat.name),
                  ),
                );
              },
              onLongPress: () {
                setState(() {
                  if (_selectedChats.contains(chat)) {
                    _selectedChats.remove(chat);
                  } else {
                    _selectedChats.add(chat);
                  }
                });
              },
            ),
          );

        },
      ),
    );
  }
}

class ChatSearchDelegate extends SearchDelegate {
  final List<Chat> _chats;

  ChatSearchDelegate(this._chats);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = _chats
        .where((chat) => chat.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final chat = results[index];
        return ListTile(
          leading: CircleAvatar(
            child: Text(chat.name[0]),
          ),
          title: Text(chat.name),
          subtitle: Text(chat.message),
          trailing: Text(chat.time),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ImageViewScreen(chat.name),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = _chats
        .where(
            (chat) => chat.name.toLowerCase().startsWith(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final chat = suggestions[index];
        return ListTile(
          leading: CircleAvatar(
            child: Text(chat.name[0]),
          ),
          title: Text(chat.name),
          subtitle: Text(chat.message),
          trailing: Text(chat.time),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ImageViewScreen(chat.name),
              ),
            );
          },
        );
      },
    );
  }
}

class Chat {
  final String name;
  final String message;
  final String time;



  Chat({required this.name, required this.message, required this.time});
}

class IndividualChat extends Chat {

  IndividualChat({name, message, time,})
      : super(name: name, message: message, time: time,);
}

class GroupChat extends Chat {
  final List<String> members;

  GroupChat({name, message, time, required this.members})
      : super(name: name, message: message, time: time,);
}

final List<Chat> chats = [
  IndividualChat(
      name: "Bob", message: "Salut", time: "10:30",),
  GroupChat(
      name: "Famille",
      message: "Rendez-vous dimanche",
      time: "11:00",
      members: ["Bob", "Alice", "Charlie"]),
];


