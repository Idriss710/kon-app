import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:kon/widgets/custom_widgets/custom_service_card.dart';
import 'package:kon/widgets/pages_for_adding_post_project_course_service/add_service.dart';

class ServicesPage extends StatefulWidget {
  // final NotchBottomBarController? controller;

  const ServicesPage({Key? key})
      : super(key: key);

  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrollingDown = false;
  bool _showTopBar = true; // للتحكم في إظهار شريط البحث
  List<CustomServiceCard> _items =
      List.generate(5, (index) => CustomServiceCard());
  bool _isLoading = false;
  final TextEditingController searchTextEditingController =
      TextEditingController();
  bool _showBottomAndTopBars = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  // مراقبة التمرير وإخفاء/إظهار شريط البحث
  void _scrollListener() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (!_isScrollingDown) {
        // widget.onScroll(false);
        setState(() => _showTopBar = false);
        _isScrollingDown = true;
      }
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (_isScrollingDown) {
        // widget.onScroll(true);
        setState(() => _showTopBar = true);
        _isScrollingDown = false;
      }
    }

    // تحميل المزيد من المنشورات عند الاقتراب من نهاية القائمة
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      _loadMoreItems();
    }
  }

  // محاكاة تحميل المزيد من العناصر
  Future<void> _loadMoreItems() async {
    if (!_isLoading) {
      setState(() => _isLoading = true);
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        _items.addAll(List.generate(5, (index) => CustomServiceCard()));
        _isLoading = false;
      });
    }
  }

  // void _toggleSidebar() {
  //   setState(() {
  //     _isSidebarOpen = !_isSidebarOpen;
  //   });
  // }

  // void _toggleBars(bool show) {
  //   setState(() {
  //     _showBottomAndTopBars = show;
  //   });
  // }

  @override
  void dispose() {
    // _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
      children: [
        //////////////////////////// services List //////////////////////

        // GridView.builder(
        //   controller: _scrollController,
        //   itemCount: _items.length + 1,
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 1,
        //     crossAxisSpacing: 8.0, // المسافة الأفقية بين العناصر
        //     mainAxisSpacing: 8.0, // المسافة العمودية بين العناصر
        //     childAspectRatio: 0.9, // نسبة العرض إلى الارتفاع للعناصر
        //   ),
        //   itemBuilder: (context, index) {
        //     if (index == _items.length) {
        //       return _isLoading
        //           ? Center(child: CircularProgressIndicator())
        //           : SizedBox.shrink();
        //     }
        //     return CustomServiceCard();
        //   },
        // ),
        ListView.builder(
          controller: _scrollController,
          itemCount: _items.length + 1,
          itemBuilder: (context, index) {
            // if (index == 0)
            //   return SizedBox(
            //     height: 60,
            //   );

            if (index == _items.length) {
              return _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : SizedBox.shrink();
            }
            return CustomServiceCard();
            
          },
        ),

        /////////////// TOP AppBar /////////////////////
        AnimatedPositioned(
          top: _showTopBar ? 40 : -100,
          left: 15,
          right: 15,
          duration: Duration(milliseconds: 300),
          child: Row(
            children: [
              if (_showTopBar)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back, color: Colors.green),
                  ),
                ),
              // const SizedBox(width: 15),
              // CustomSearchTextField(controller: searchTextEditingController),
              // SizedBox(
              //   width: 15,
              // ),

              // ////////////////  Icon-Add On the top AppBar ///////////////////////////////////
              // Container(
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(10),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.black.withOpacity(0.1),
              //         blurRadius: 8,
              //         spreadRadius: 2,
              //         offset: Offset(0, 4),
              //       ),
              //     ],
              //   ),
              //   child: IconButton(
              //     onPressed: () {
              //       CustomDialog(context, 'Choose an action', false, true, false,false, false);
              //     },
              //     icon: const Icon(Icons.add, color: Colors.green),
              //   ),
              // ),
              // ////////////////// End Add Icon ON the top APPBAR ///////////////////////////////////
            ],
          ),
        ),

        // // dar shadow for closing the side bar
        // if (_isSidebarOpen)
        //   Positioned.fill(
        //     child: GestureDetector(
        //       onTap: _toggleSidebar,
        //       child: Container(
        //           color:
        //               Colors.black.withOpacity(0.5)), // تأثير التعتيم عند الفتح
        //     ),
        //   ),
        // // the sideBar
        // AnimatedPositioned(
        //   duration: const Duration(milliseconds: 300),
        //   left: _isSidebarOpen ? 0 : -250,
        //   top: 0,
        //   bottom: 0,
        //   child: CustomSidebar(onClose: _toggleSidebar),
        // ),
      ],
    ),
    
    floatingActionButton: AnimatedOpacity(
      opacity: _showTopBar?1.0 : 0.0,
      duration: Duration(microseconds: 300),
      child:  FloatingActionButton(onPressed: () {
      Get.to(AddServicePage());
    },
    backgroundColor: Colors.green,
    tooltip: 'Add Service',
    child: Icon(Icons.add,color: Colors.white,),
    ),)
    );
  }
}
