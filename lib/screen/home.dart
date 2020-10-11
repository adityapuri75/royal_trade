import 'package:flutter/material.dart';
import 'package:royaltrade/screen/Authentication/login.dart';
import 'package:royaltrade/screen/Authentication/signup.dart';
import 'package:royaltrade/widget/home_widget.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _pageIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 20, 52, 1),
      drawer: Container(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Royal Trade"),
      ),
      body: PageView(
        children: [HomeWidget(), Login2(), SignUp2()],
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        backgroundColor: Colors.purple,
        currentIndex: _pageIndex,
        onTap: onTabTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.mail), title: Text("Messages")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text("Profile")),
        ],
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
