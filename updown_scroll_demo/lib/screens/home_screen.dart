import 'package:updown_scroll_demo/constants/export.dart';
import 'package:updown_scroll_demo/screens/dashboard_screen.dart';
import 'commandment_view_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  int menuIndex = 0;

  pages(int index) {
    return index == 0
        ? DashboardScreen(isIndex: 0, isFav: menuIndex == 2)
        : index == 1
            ? DashboardScreen(
                isIndex: 1,
                isFav: menuIndex == 2,
              )
            : index == 2
                ? const Page1()
                : index == 3
                    ? const Page1()
                    : index == 4
                        ? CommandmentViewScreen(
                            isIndex: 4, isFav: menuIndex == 2)
                        : index == 5
                            ? CommandmentViewScreen(
                                isIndex: 5, isFav: menuIndex == 2)
                            : const Page1();
  }

  @override
  Widget build(BuildContext context) {
    var isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: const Color(0xffC4DFCB),
      body: pages(pageIndex),
      bottomNavigationBar: isLandscape
          ? buildMyLandscapeNavBar(context)
          : buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        /*borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),*/
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              commonBottomBarTitle(
                isSelected: 0,
                title: Strings.strWeSay,
                onClick: () {
                  setState(() {
                    pageIndex = 0;
                    menuIndex = 0;
                  });
                },
              ),
              commonBottomBarTitle(
                isSelected: 1,
                title: Strings.strWePray,
                onClick: () {
                  setState(() {
                    pageIndex = 1;
                    menuIndex = 1;
                  });
                },
              ),
              commonBottomBarTitle(
                isSelected: 2,
                title: Strings.strFaves,
                onClick: () {
                  setState(() {
                    menuIndex = 2;
                  });
                },
              ),
              commonBottomBarTitle(
                isSelected: 3,
                title: Strings.strAmen,
                onClick: () {
                  setState(() {
                    pageIndex = 3;
                    menuIndex = 3;
                  });
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                commonBottomBarTitle(
                  isSelected: 4,
                  title: Strings.strKJV,
                  onClick: () {
                    setState(() {
                      pageIndex = 4;
                      menuIndex = 4;
                    });
                  },
                ),
                commonBottomBarTitle(
                  isSelected: 5,
                  title: Strings.strNKJV,
                  onClick: () {
                    setState(() {
                      pageIndex = 5;
                      menuIndex = 5;
                    });
                  },
                ),
                commonBottomBarTitle(
                  isSelected: 6,
                  title: Strings.strContents,
                  onClick: () {
                    setState(() {
                      pageIndex = 6;
                      menuIndex = 6;
                    });
                  },
                ),
                /* commonBottomBarTitle(isSelected: 7,title: Strings.strContents,onClick: (){
                  setState(() {
                    pageIndex = 7;
                  });
                },),*/
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildMyLandscapeNavBar(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        /*borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),*/
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          commonBottomBarTitle(
            isSelected: 0,
            title: Strings.strWeSay,
            onClick: () {
              setState(() {
                pageIndex = 0;
                menuIndex = 0;
              });
            },
          ),
          commonBottomBarTitle(
            isSelected: 1,
            title: Strings.strWePray,
            onClick: () {
              setState(() {
                pageIndex = 1;
                menuIndex = 1;
              });
            },
          ),
          commonBottomBarTitle(
            isSelected: 2,
            title: Strings.strFaves,
            onClick: () {
              setState(() {
                menuIndex = 2;
              });
            },
          ),
          commonBottomBarTitle(
            isSelected: 3,
            title: Strings.strAmen,
            onClick: () {
              setState(() {
                pageIndex = 3;
                menuIndex = 3;
              });
            },
          ),
          commonBottomBarTitle(
            isSelected: 4,
            title: Strings.strKJV,
            onClick: () {
              setState(() {
                pageIndex = 4;
                menuIndex = 4;
              });
            },
          ),
          commonBottomBarTitle(
            isSelected: 5,
            title: Strings.strNKJV,
            onClick: () {
              setState(() {
                pageIndex = 5;
                menuIndex = 5;
              });
            },
          ),
          commonBottomBarTitle(
            isSelected: 6,
            title: Strings.strContents,
            onClick: () {
              setState(() {
                pageIndex = 6;
                menuIndex = 6;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget commonBottomBarTitle(
      {required VoidCallback onClick,
      required String title,
      required int isSelected}) {
    return GestureDetector(
        onTap: onClick,
        child: TextView(
          text: title,
          textColor: menuIndex == isSelected ? AppColors.black : AppColors.gray,
        ));
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '',
        style: TextStyle(
          color: Colors.green[900],
          fontSize: 45,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

