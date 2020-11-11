import 'package:flutter/material.dart';
import 'package:skype_clone/resources/firebase_repository.dart';
import 'package:skype_clone/utils/universal_variables.dart';
import 'package:skype_clone/utils/utilities.dart';
import 'package:skype_clone/widgets/appbar.dart';
import 'package:skype_clone/widgets/custom_tile.dart';

class ChatListScreen extends StatefulWidget {
  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

final FirebaseRepository _repository = FirebaseRepository();

class _ChatListScreenState extends State<ChatListScreen> {
  String currentUserId;
  String initials;

  @override
  void initState() {
    super.initState();
    _repository.getCurrentUser().then(
          (user) => setState(
            () {
              currentUserId = user.uid;
              initials = Utils.getInitials(user.displayName);
            },
          ),
        );
  }

  CustomAppBar customAppBar(BuildContext context) {
    return CustomAppBar(
        title: UserCircle(initials),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        centerTitle: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UniversalVariables.blackColor,
      appBar: customAppBar(context),
      floatingActionButton: NewChatButton(),
      body: ChatListContainer(currentUserId),
    );
  }
}

class ChatListContainer extends StatefulWidget {
  final String currentUserId;

  ChatListContainer(this.currentUserId);

  @override
  _ChatListContainerState createState() => _ChatListContainerState();
}

class _ChatListContainerState extends State<ChatListContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: 2,
          itemBuilder: (context, index) {
            return CustomTile(
              mini: false,
              onTap: () {},
              leading: Container(
                constraints: BoxConstraints(maxHeight: 60, maxWidth: 60),
                child: Stack(
                  children: <Widget>[
                    CircleAvatar(
                      maxRadius: 30,
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(
                          'https://lh3.googleusercontent.com/a-/AOh14GjNT0Bano8JM6mSVm_C44WqJJ-XQdBAdicI3tuR2A=s96-c'),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 17,
                        width: 17,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: UniversalVariables.onlineDotColor,
                          border: Border.all(
                            color: UniversalVariables.blackColor,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              title: Text(
                'Dinushi',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Arial',
                  fontSize: 19.0,
                ),
              ),
              subtitle: Text(
                'Hello',
                style: TextStyle(
                  color: UniversalVariables.greyColor,
                  fontSize: 14.0,
                ),
              ),
            );
          }),
    );
  }
}

class UserCircle extends StatelessWidget {
  final String text;

  UserCircle(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: UniversalVariables.seperatorColor,
      ),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              '$text',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: UniversalVariables.lightBlueColor,
                fontSize: 13.0,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 12,
              width: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: UniversalVariables.blackColor,
                  width: 2,
                ),
                color: UniversalVariables.onlineDotColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewChatButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: UniversalVariables.fabGradient,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Icon(
        Icons.edit,
        size: 30.0,
        color: Colors.white,
      ),
      padding: EdgeInsets.all(20),
    );
  }
}
