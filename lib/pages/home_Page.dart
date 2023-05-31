import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_4/component/lHome.dart';
import 'package:project_4/pages/first_Page.dart';

import '../component/lCustomer.dart';
import '../component/lDiscount.dart';
import '../component/lOnlineStore.dart';
import '../component/lOrder.dart';
import '../component/lProduct.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  PageController page = PageController();
  SideMenuController sideMenu = SideMenuController();
  @override
  void initState() {
    sideMenu.addListener((p0) {
      page.jumpToPage(p0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.network(
              'data:image/png;base64,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',
              height: 150,
              width: 150,
            ),
            const SizedBox(
              width: 40,
            ),
            Container(
              padding: const EdgeInsets.only(left: 15),
              height: 35,
              width: 600,
              decoration: const BoxDecoration(
                color: Color(0xfff1f2f3),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.search_outlined,
                    color: Color(0xff5c5f62),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Search',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  )
                ],
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.flag,
              color: Color(0xff00a0ac),
            ),
            const SizedBox(
              width: 8,
            ),
            const Text(
              'Setup guide',
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            const SizedBox(
              width: 18,
            ),
            const Icon(
              Icons.notifications,
              color: Color(0xff5c5f62),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xffe4e5e7),
              ),
              child: const Center(
                child: Text(
                  'ra',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            const Text(
              'rahaf alqahtani',
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            const SizedBox(
              width: 12,
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: sideMenu,
            style: SideMenuStyle(
              // showTooltip: false,
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: const Color.fromARGB(255, 230, 223, 223),
              selectedColor: const Color.fromARGB(255, 230, 223, 223),
              selectedTitleTextStyle: const TextStyle(color: Color(0xff008060)),
              selectedIconColor: const Color(0xff008060),
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.all(Radius.circular(10)),
              // ),
              // backgroundColor: Colors.blueGrey[700]
            ),
            title: Column(
              children: const [
                // ConstrainedBox(
                //   constraints: const BoxConstraints(
                //     maxHeight: 150,
                //     maxWidth: 150,
                //   ),
                //   child: Image.asset(
                //     'assets/images/easy_sidemenu.png',
                //   ),
                // ),
                Divider(
                  indent: 8.0,
                  endIndent: 8.0,
                ),
              ],
            ),
            footer: InkWell(
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FirstPage()));
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Log out',
                  style: TextStyle(color: Color(0xff008060), fontSize: 20),
                ),
              ),
            ),
            // const Padding(
            //   padding: EdgeInsets.all(8.0),
            //   child: Text(
            //     'mohada',
            //     style: TextStyle(fontSize: 15),
            //   ),
            // ),
            items: [
              SideMenuItem(
                priority: 0,
                title: 'Home',
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },
                icon: const Icon(Icons.home),
                // badgeContent: const Text(
                //   '3',
                //   style: TextStyle(color: Colors.white),
                // ),
                // tooltipContent: "This is a tooltip for Dashboard item",
              ),
              SideMenuItem(
                priority: 1,
                title: 'Customers',
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },
                icon: const Icon(Icons.supervisor_account),
              ),
              SideMenuItem(
                priority: 2,
                title: 'Orders',
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },
                icon: const Icon(Icons.drive_eta_outlined),
              ),
              SideMenuItem(
                priority: 3,
                title: 'Products',
                onTap: (page, h) {
                  sideMenu.changePage(page);
                },
                icon: const Icon(
                  Icons.local_offer,
                ),
              ),
              SideMenuItem(
                priority: 4,
                title: 'Discount',
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },
                icon: const Icon(
                  Icons.confirmation_number,
                ),
              ),
              // SideMenuItem(
              //   priority: 5,
              //   onTap:(page){
              //     sideMenu.changePage(5);
              //   },
              //   icon: const Icon(Icons.image_rounded),
              // ),
              // SideMenuItem(
              //   priority: 6,
              //   title: 'Only Title',
              //   onTap:(page){
              //     sideMenu.changePage(6);
              //   },
              // ),
              SideMenuItem(
                priority: 5,
                title: 'Online Store',
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },
                icon: const Icon(
                  Icons.storefront,
                ),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: page,
              children: const [
                LHome(),
                LCustomer(),
                LOrder(),
                LProduct(),
                LDiscount(),
                LOnlineStore(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
