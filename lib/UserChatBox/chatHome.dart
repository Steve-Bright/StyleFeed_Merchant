import 'package:flutter/material.dart';
import 'chatPage.dart';
import '../home-pages/home.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_application_1/home-pages/add.dart';
import 'package:flutter_application_1/home-pages/noti.dart';
import 'chatPage.dart';


class Message {
  final String text;
  final String user;

  Message(this.text, this.user);
}

class User {
  final String name;
  final String profileImage;

  User(this.name, this.profileImage);
}

class ChatHome extends StatelessWidget {
  final List<Message> messages = [
    Message("Is this shirt still available?", "Wai Yan Linn"),
    Message("I want this shirt", "Ma Nan"),

  ];

  final List<User> users = [
    User("Wai Yan Linn", "assets/shirt.png"),
    User("Ma Nan", "assets/shirt.png"),

  ];

  final String currentUserProfileImage = "assets/highculturedlogo.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Messages'),
            // leading: IconButton(
            //   icon: Icon(Icons.arrow_back),
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            // ),
            // Add the user's profile image to the top right corner
            actions: [
              CircleAvatar(
                backgroundImage: AssetImage(currentUserProfileImage),
                radius: 20, // Adjust the size as needed
              ),
            ],
          ),
          body: MessageList(messages: messages, users: users),
        bottomNavigationBar: Container(
          color: Color.fromARGB(255, 247, 247, 247),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: GNav (
              iconSize: 25,
              onTabChange: (index){
                print(index);
              },
              color: Colors.black,
              activeColor: Colors.black,
              padding: EdgeInsets.all(20),
              tabs: [
                GButton(icon: Icons.home,
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Myhome(),
                    ));
                  },
                ),
                GButton(icon: Icons.add_box,
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => AddProductScreen(),
                    ));
                  },
                ),
                GButton(icon: Icons.notifications,
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => noti(),
                    ));
                  },
                ),
                GButton(icon: Icons.message_rounded,
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => ChatHome(),
                    ));
                  },
                ),
              ],
            ),
          ),
        )
    );
  }
}

class MessageList extends StatelessWidget {
  final List<Message> messages;
  final List<User> users;

  MessageList({required this.messages, required this.users});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        final user = users.firstWhere((u) => u.name == message.user);

        return InkWell(
          onTap: (){
            // Navigator.pushNamed(context, '/chatPage');
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ChatPage()));
          },
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(user.profileImage),
            ),
            title: Text(message.user),
            subtitle: Text(message.text),
          ),
        );
      },
    );
  }
}
