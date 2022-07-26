import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_ui/constant/story_json.dart';
import 'package:test_ui/pages/home_page.dart';
import 'package:test_ui/pages/search_page.dart';
import 'package:test_ui/resources/theme/colors.dart';

import '../resources/assetsStrings.dart';
import '../resources/strings_manger.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      backgroundColor: ColorManger.black,
      body: getBody(),
      bottomNavigationBar: buttomNavigatorWidget(),
      // getFooter(),
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      HomePage(),
      SearchPage(),
      const Center(
        child: Text(
          "Upload Page",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ColorManger.white),
        ),
      ),
      const Center(
        child: Text(
          "Activity Page",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ColorManger.white),
        ),
      ),
      const Center(
        child: Text(
          "Account Page",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ColorManger.white),
        ),
      )
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }

  AppBar getAppBar() {
    if (_currentIndex == 0) {
      return AppBar(
        backgroundColor: ColorManger.appBarColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SvgPicture.asset(
              "assets/images/camera_icon.svg",
              width: 30,
            ),
            const Text(
              "Instagram",
              style: TextStyle(fontFamily: 'Billabong', fontSize: 35),
            ),
            SvgPicture.asset(
              "assets/images/message_icon.svg",
              width: 30,
            ),
          ],
        ),
      );
    }
    //  else if (pageIndex == 1) {
    //   return null;
    // }
    else if (_currentIndex == 2) {
      return AppBar(
        backgroundColor: ColorManger.appBarColor,
        title: const Text("Upload"),
      );
    } else if (_currentIndex == 3) {
      return AppBar(
        backgroundColor: ColorManger.appBarColor,
        title: const Text("Activity"),
      );
    } else {
      return AppBar(
        backgroundColor: ColorManger.appBarColor,
        title: const Text("Account"),
      );
    }
  }

  Widget getFooter() {
    List bottomItems = [
      _currentIndex == 0
          ? "assets/images/home_active_icon.svg"
          : "assets/images/home_icon.svg",
      _currentIndex == 1
          ? "assets/images/search_active_icon.svg"
          : "assets/images/search_icon.svg",
      _currentIndex == 2
          ? "assets/images/upload_active_icon.svg"
          : "assets/images/upload_icon.svg",
      _currentIndex == 3
          ? "assets/images/love_active_icon.svg"
          : "assets/images/love_icon.svg",
      _currentIndex == 4
          ? "assets/images/account_active_icon.svg"
          : "assets/images/account_icon.svg",
    ];

    return Container(
      width: double.infinity,
      height: 80,
      decoration: const BoxDecoration(color: ColorManger.appFooterColor),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomItems.length, (index) {
            return InkWell(
                onTap: () {
                  selectedTab(index);
                },
                child: SvgPicture.asset(
                  bottomItems[index],
                  width: 27,
                ));
          }),
        ),
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget buttomNavigatorWidget() {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: ColorManger.appFooterColor,
      ),
      child: SizedBox(
        height: 80,
        child: BottomNavigationBar(
            backgroundColor: ColorManger.appFooterColor,
            selectedItemColor: ColorManger.white,
            selectedIconTheme:
                const IconThemeData(size: 20, color: ColorManger.white),
            currentIndex: _currentIndex,
            onTap: selectedTab,
            items: [
              BottomNavigationBarItem(
                label: AppStrings.home,
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    ImageAssets.homeIcon,
                    width: 27,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: AppStrings.search,
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    ImageAssets.searchIcon,
                    width: 27,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: AppStrings.addPost,
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    ImageAssets.addPosticon,
                    width: 27,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: AppStrings.activityPage,
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    ImageAssets.activityPageIcon,
                    width: 27,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: AppStrings.accountPage,
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 17,
                    backgroundImage: NetworkImage(
                      profile,
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
