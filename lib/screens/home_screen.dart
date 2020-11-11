import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skype_clone/screens/pageviews/chat_list_screen.dart';
import 'package:skype_clone/utils/universal_variables.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UniversalVariables.blackColor,
      body: PageView(
        children: <Widget>[
          Container(
            child: ChatListScreen(),
          ),
          Center(
              child: Text(
            'Call Logs',
            style: TextStyle(color: Colors.white),
          )),
          Center(
              child: Text(
            'Contact Screen',
            style: TextStyle(color: Colors.white),
          )),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: CupertinoTabBar(
            backgroundColor: UniversalVariables.blackColor,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.chat,
                    color: (_page == 0)
                        ? UniversalVariables.lightBlueColor
                        : UniversalVariables.greyColor,
                  ),
                  label: 'Chats',
                  backgroundColor: (_page == 0)
                      ? UniversalVariables.lightBlueColor
                      : Colors.grey),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.call,
                    color: (_page == 1)
                        ? UniversalVariables.lightBlueColor
                        : UniversalVariables.greyColor,
                  ),
                  label: 'Call',
                  backgroundColor: (_page == 1)
                      ? UniversalVariables.lightBlueColor
                      : Colors.grey),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.contact_page,
                    color: (_page == 2)
                        ? UniversalVariables.lightBlueColor
                        : UniversalVariables.greyColor,
                  ),
                  label: 'Contacts',
                  backgroundColor: (_page == 2)
                      ? UniversalVariables.lightBlueColor
                      : Colors.grey),
            ],
            onTap: navigationTapped,
            currentIndex: _page,
          ),
        ),
      ),
    );
  }
}
