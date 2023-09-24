import 'package:auto_route/auto_route.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_cashier/config/util/app_theme.dart';
import 'package:my_cashier/config/util/custom_widget.dart';
import 'package:my_cashier/presentation/pages/home/sidebar/sidebar_view.dart';
import 'package:sidebarx/sidebarx.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  late SidebarXController _controller;
  final _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _controller = SidebarXController(selectedIndex: 0, extended: true);

    _controller.addListener(() {
      setState(() {
        if (_controller.selectedIndex == 5) {
          _controller.selectIndex(index);
          AwesomeDialog(
            context: context,
            dialogType: DialogType.noHeader,
            animType: AnimType.scale,
            dialogBackgroundColor: AppTheme.bgColor,
            titleTextStyle: AppTheme.subtitle2(color: AppTheme.blackColor),
            descTextStyle: AppTheme.body3(color: AppTheme.blackColor),
            btnOkColor: AppTheme.blue1,
            buttonsTextStyle: AppTheme.subtitle3(color: AppTheme.white),
            title: 'Close App?',
            desc: 'Are you sure want to close this app?',
            btnCancelText: 'No',
            btnCancelOnPress: () {},
            btnOkText: 'Yes',
            btnOkOnPress: () {
              SystemNavigator.pop();
            },
          ).show();
        } else {
          setState(() {
            index = _controller.selectedIndex;
          });
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final isSmallScreen = MediaQuery.of(context).size.width < 600;
        return Scaffold(
          key: _key,
          backgroundColor: AppTheme.bgColor,
          appBar: isSmallScreen
              ? AppBar(
                  backgroundColor: AppTheme.white,
                  title: Image.asset(
                    'assets/images/ic_logo_app.png',
                    height: 32,
                  ),
                  leading: Container(
                    margin: const EdgeInsets.all(12),
                    child: SizedBox(
                      width: 32,
                      height: 32,
                      child: MaterialButton(
                        color: AppTheme.white,
                        padding: const EdgeInsets.all(4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        onPressed: () {
                          _key.currentState?.openDrawer();
                        },
                        child: ImageIcon(
                          AssetImage(imagePaths('ic_menu')),
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  actions: [
                    Container(
                      margin: const EdgeInsets.all(12),
                      child: SizedBox(
                        width: 32,
                        height: 32,
                        child: MaterialButton(
                          color: AppTheme.white,
                          padding: const EdgeInsets.all(4),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          onPressed: () {},
                          child: ImageIcon(
                            AssetImage(imagePaths('ic_cart')),
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : null,
          drawer: Sidebar(
            controller: _controller,
          ),
          body: Row(
            children: [
              if (!isSmallScreen)
                Sidebar(
                  controller: _controller,
                ),
              Expanded(
                child: Center(
                  child: _ScreensExample(
                    controller: _controller,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemBuilder: (context, index) => Container(
                height: 100,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppTheme.blue1,
                  boxShadow: const [BoxShadow()],
                ),
              ),
            );

          case 5:
            return Text(
              pageTitle,
              style: theme.textTheme.headlineSmall,
            );
          default:
            return Text(
              pageTitle,
              style: theme.textTheme.headlineSmall,
            );
        }
      },
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'Search';
    case 2:
      return 'People';
    case 3:
      return 'Favorites';
    case 4:
      return 'Custom iconWidget';
    case 5:
      return 'Profile';

    default:
      return 'Not found page';
  }
}

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
const divider = Divider(color: AppTheme.blackColor2, height: 1);
