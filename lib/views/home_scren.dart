//  import 'dart:developer';

// import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:kon/views/bottom_nav_bar_page/group_page.dart';
// import 'package:kon/views/bottom_nav_bar_page/notification_page.dart';
// import 'package:kon/views/bottom_nav_bar_page/settings_page.dart';
// import 'package:kon/views/profile_screen.dart';
// import 'package:kon/widgets/cusom_side_bar.dart';
// import 'package:kon/views/bottom_nav_bar_page/home_page.dart';
// import 'package:kon/widgets/custom_dialog.dart';
// import 'package:kon/widgets/custom_search_text_field.dart';


// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   /// Controller to handle PageView and also handles initial page
//   final _pageController = PageController(initialPage: 0);

//   /// Controller to handle bottom nav bar and also handles initial page
//   final NotchBottomBarController _controller = NotchBottomBarController(index: 0);

//   int maxCount = 5;
//     bool _showBottomAndTopBars =true;
//     bool _isSidebarOpen =false;

//   @override
//   void dispose() {
//     _pageController.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController searchTextEditingController = TextEditingController();

//     void _toggleBars(bool show){
//       setState(() {
//         _showBottomAndTopBars = show;
//       });
//     }
//     void _toggleSidebar(){
//       setState(() {
//         _isSidebarOpen = !_isSidebarOpen ;
//       });
//     }
//     /// widget list
//     final List<Widget> bottomBarPages = [
//        HomePage(controller: _controller,onScroll: _toggleBars),
//        GroupPage(onScroll: _toggleBars),
//        Page2(),
//        Page3(),
//       //  GroupPage(onScroll: _toggleBars),
//       //  NotificationPage(onScroll: _toggleBars),
//       //  SettingsPage(onScroll: _toggleBars),
      
//     ];
//     return Scaffold(
//       body: Stack(
//       children: [
//         // Container(
//         //   // color: Colors.green,
//         //   padding:EdgeInsets.only(
//         //     top: MediaQuery.of(context).padding.top
//         //   ),
//         // ),
//         Positioned.fill(
//     child: PageView(
//       controller: _pageController,
//       physics: const NeverScrollableScrollPhysics(),
//       children: List.generate(bottomBarPages.length, (index) => bottomBarPages[index]),
//     ),
//         ),
        
//         ///////////////////////////////// TOP AppBar ////////////////////////////////
//         AnimatedPositioned(
//     top: _showBottomAndTopBars ? 40 : -100,
//     left: 15,
//     right: 15,
//     duration: Duration(milliseconds: 300),
//     child: Row(
//       children: [
//         if (_showBottomAndTopBars)
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.1),
//                 blurRadius: 8,
//                 spreadRadius: 2,
//                 offset: Offset(0, 4),
//               ),
//             ],
//           ),
//           child: IconButton(
//             // onPressed: (){
//             //   Get.to(ProfileScreen());
//             // },
//             onPressed: _toggleSidebar,
//             icon: const Icon(Icons.menu, color: Colors.green),
//           ),
//         ),
//         const SizedBox(width: 15),
//         CustomSearchTextField(controller: searchTextEditingController),
//         SizedBox(width: 15,),
//         ////////////////////  Icon-Add On the top AppBar ///////////////////////////////////
//         // Container(
//         //   decoration: BoxDecoration(
//         //     color: Colors.white,
//         //     borderRadius: BorderRadius.circular(10),
//         //     boxShadow: [
//         //       BoxShadow(
//         //         color: Colors.black.withOpacity(0.1),
//         //         blurRadius: 8,
//         //         spreadRadius: 2,
//         //         offset: Offset(0, 4),
//         //       ),
//         //     ],
//         //   ),
//         //   child: IconButton(
            
//         //     onPressed: () {
//         //       CustomDialog(context);
//         //     },
//         //     icon: const Icon(Icons.add, color: Colors.green),
//         //   ),
//         // ),
//         //////////////////// End Add Icon ON the top APPBAR ///////////////////////////////////

        
//       ],
//     ),
//         ),
    
      
//         // لإغلاق القائمة عند الضغط في أي مكان
//         if (_isSidebarOpen)
//     Positioned.fill(
//       child: GestureDetector(
//         onTap: _toggleSidebar,
//         child: Container(color: Colors.black.withOpacity(0.5)), // تأثير التعتيم عند الفتح
//       ),
//     ),
//         // الشريط الجانبي
//         AnimatedPositioned(
//     duration: const Duration(milliseconds: 300),
//     left: _isSidebarOpen ? 0 : -250,
//     top: 0,
//     bottom: 0,
//     child: CustomSidebar(onClose: _toggleSidebar),
//         ),
    
          
//             ],
//     )
//     ,
//     extendBody: true,
//     bottomNavigationBar: (bottomBarPages.length <= maxCount)
//         ? AnimatedNotchBottomBar(
//                 /// Provide NotchBottomBarController
//                 notchBottomBarController: _controller,
//                 color: Colors.white,
//                 showLabel: true,
//                 textOverflow: TextOverflow.visible,
//                 maxLine: 1,
//                 shadowElevation: 5,
//                 kBottomRadius: 28.0,
              
//                 // notchShader: const SweepGradient(
//                 //   startAngle: 0,
//                 //   endAngle: pi / 2,
//                 //   colors: [Colors.red, Colors.green, Colors.orange],
//                 //   tileMode: TileMode.mirror,
//                 // ).createShader(Rect.fromCircle(center: Offset.zero, radius: 8.0)),
//                 notchColor: Colors.black87,
              
//                 /// restart app if you change removeMargins
//                 removeMargins: false,
//                 bottomBarWidth: 500,
//                 showShadow: false,
//                 durationInMilliSeconds: 300,
              
//                 itemLabelStyle: const TextStyle(fontSize: 10),
              
//                 elevation: 1,
//                 bottomBarItems: const [
//                   BottomBarItem(
//                     inActiveItem: Icon(
//                       Icons.home,
//                       color: Colors.blueGrey,
//                     ),
//                     activeItem: Icon(
//                       Icons.home_filled,
//                       color: Colors.green,
//                     ),
//                     itemLabel: 'Home',
//                   ),
//                   BottomBarItem(
//                     inActiveItem: Icon(Icons.groups_2_outlined, color: Colors.blueGrey),
//                     activeItem: Icon(
//                       Icons.groups_2_outlined,
//                       color: Colors.green,
//                     ),
//                     itemLabel: 'Groups',
//                   ),
//                   BottomBarItem(
//                     inActiveItem: Icon(
//                       Icons.notification_important_outlined,
//                       color: Colors.blueGrey,
//                     ),
//                     activeItem: Icon(
//                       Icons.notification_important_outlined,
//                       color: Colors.green,
//                     ),
//                     itemLabel: 'Notification',
//                   ),
//                   BottomBarItem(
//                     inActiveItem: Icon(
//                       Icons.settings,
//                       color: Colors.blueGrey,
//                     ),
//                     activeItem: Icon(
//                       Icons.settings,
//                       color: Colors.green,
//                     ),
//                     itemLabel: 'Settings',
//                   ),
//                 ],
//                 onTap: (index) {
//                   log('current selected index $index');
//                   _pageController.jumpToPage(index);
//                 },
//                 kIconSize: 24.0,
//               ): null,
//     );
//   }
// }

// /// add controller to check weather index through change or not. in page 1
// class Page1 extends StatelessWidget {
//   final NotchBottomBarController? controller;

//   const Page1({Key? key, this.controller}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.yellow,
//       child: Center(
//         /// adding GestureDetector
//         child: GestureDetector(
//           behavior: HitTestBehavior.translucent,
//           onTap: () {
//             controller?.jumpTo(2);
//           },
//           child: const Text('Page 1'),
//         ),
//       ),
//     );
//   }
// }

// class Page2 extends StatelessWidget {
//   const Page2({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(color: Colors.green, child: const Center(child: Text('Page 2')));
//   }
// }

// class Page3 extends StatelessWidget {
//   const Page3({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(color: Colors.red, child: const Center(child: Text('Page 3')));
//   }
// }

// class Page4 extends StatelessWidget {
//   const Page4({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(color: Colors.blue, child: const Center(child: Text('Page 4')));
//   }
// }

// class Page5 extends StatelessWidget {
//   const Page5({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(color: Colors.lightGreenAccent, child: const Center(child: Text('Page 5')));
//   }
// }

import 'dart:developer';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:kon/views/bottom_nav_bar_page/courses_page.dart';
import 'package:kon/views/bottom_nav_bar_page/groups_page.dart';
import 'package:kon/views/bottom_nav_bar_page/notification_page.dart';
import 'package:kon/views/bottom_nav_bar_page/services_page_categories.dart';
import 'package:kon/views/bottom_nav_bar_page/settings_page.dart';
import 'package:kon/widgets/custom_widgets/cusom_side_bar.dart';
import 'package:kon/views/bottom_nav_bar_page/home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController(initialPage: 0);
  final NotchBottomBarController _controller = NotchBottomBarController(index: 0);

  int maxCount = 5;
  bool _showBottomAndTopBars = true;
  bool _isSidebarOpen = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchTextEditingController = TextEditingController();

    void _toggleBars(bool show) {
      setState(() {
        _showBottomAndTopBars = show;
      });
    }

    void _toggleSidebar() {
      setState(() {
        _isSidebarOpen = !_isSidebarOpen;
      });
    }

    final List<Widget> bottomBarPages = [
      HomePage(controller: _controller, onScroll: _toggleBars),
      GroupsPage(onScroll: _toggleBars),
      CoursesPage(onScroll: _toggleBars),
      ServicesPageCategories(onScroll: _toggleBars),
    ];

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(bottomBarPages.length, (index) => bottomBarPages[index]),
            ),
          ),


          // لإغلاق القائمة عند الضغط في أي مكان
          if (_isSidebarOpen)
            Positioned.fill(
              child: GestureDetector(
                onTap: _toggleSidebar,
                child: Container(color: Colors.black.withOpacity(0.5)),
              ),
            ),

          // الشريط الجانبي
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: _isSidebarOpen ? 0 : -250,
            top: 0,
            bottom: 0,
            child: CustomSidebar(onClose: _toggleSidebar),
          ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              notchBottomBarController: _controller,
              color: Colors.white,
              showLabel: true,
              textOverflow: TextOverflow.visible,
              maxLine: 1,
              shadowElevation: 5,
              kBottomRadius: 28.0,
              notchColor: Colors.black87,
              removeMargins: false,
              bottomBarWidth: 500,
              showShadow: false,
              durationInMilliSeconds: 300,
              itemLabelStyle: const TextStyle(fontSize: 10),
              elevation: 1,
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.home_filled,
                    color: Colors.green,
                  ),
                  itemLabel: 'Home',
                ),
                BottomBarItem(
                  inActiveItem: Icon(Icons.groups_2_outlined, color: Colors.blueGrey),
                  activeItem: Icon(
                    Icons.groups_2_outlined,
                    color: Colors.green,
                  ),
                  itemLabel: 'Groups',
                ),
                // BottomBarItem(
                //   inActiveItem: Icon(
                //     Icons.menu_book_outlined,
                //     color: Colors.blueGrey,
                //   ),
                //   activeItem: Icon(
                //     Icons.menu_book_outlined,
                //     color: Colors.green,
                //   ),
                //   itemLabel: 'Courses',
                // ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.notification_important_outlined,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.notification_important_outlined,
                    color: Colors.green,
                  ),
                  itemLabel: 'Notification',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.settings,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.settings,
                    color: Colors.green,
                  ),
                  itemLabel: 'Settings',
                ),
              ],
              onTap: (index) {
                log('current selected index $index');
                _pageController.jumpToPage(index);
              },
              kIconSize: 24.0,
            )
          : null,
    );
  }
}
