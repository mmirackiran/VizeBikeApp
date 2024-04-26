import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vizeapp/components/bottom_nav_bar.dart';
import 'package:vizeapp/screens/favoriteScreen.dart';
import 'package:vizeapp/screens/sellingScreen.dart';
import '../core/localization.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bike App',
              style: TextStyle(
                color: Color(0xFFEF6C00),
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
            SizedBox(width: 55),
          ],
        ),
        elevation: 0,
        leading: Builder(
            builder: (context) => Padding(
                  padding: const EdgeInsets.only(left: 22, top: 12),
                  child: IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                )),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Divider(),
                InkWell(
                  onTap: () => GoRouter.of(context).push("/home"),
                  child: Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: ListTile(
                      leading: Icon(
                        Icons.home,
                      ),
                      title: Text(AppLocalizations.of(context)
                          .getTranslate("drawer_home")),
                    ),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: () => GoRouter.of(context).push("/about"),
                  child: Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: ListTile(
                      leading: Icon(Icons.info),
                      title: Text(AppLocalizations.of(context)
                          .getTranslate("drawer_about")),
                    ),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: () => GoRouter.of(context).push("/settings"),
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: ListTile(
                        leading: Icon(Icons.settings),
                        title: Text(AppLocalizations.of(context)
                            .getTranslate("drawer_settings")),
                      ),
                    ),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: () => GoRouter.of(context).push("/logout"),
                  child: const Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: ListTile(
                      leading: Icon(Icons.logout),
                      title: Text("Logout"),
                    ),
                  ),
                ),
                Divider(),
                SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
