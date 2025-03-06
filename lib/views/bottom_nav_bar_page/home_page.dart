// import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:kon/widgets/custom_post_card.dart';

// class HomePage extends StatefulWidget {
//   final Function(bool) onScroll;
//   final NotchBottomBarController? controller;

//   const HomePage({Key? key, required this.onScroll, this.controller}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final ScrollController _scrollController = ScrollController();
//   bool _isScrollingDown = false;
//   List<CustomPostcustomCard> _items = List.generate(5, (index) => CustomPostcustomCard(showLikeComment: true));
//   bool _isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(_scrollListener);
//   }

//   void _scrollListener() {
//     if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
//       if (!_isScrollingDown) {
//         widget.onScroll(false);
//         _isScrollingDown = true;
//       }
//     } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
//       if (_isScrollingDown) {
//         widget.onScroll(true);
//         _isScrollingDown = false;
//       }
//     }

//     if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100) {
//       _loadMoreItems();
//     }
//   }

//   Future<void> _loadMoreItems() async {
//     if (!_isLoading) {
//       setState(() {
//         _isLoading = true;
//       });

//       await Future.delayed(Duration(seconds: 1));

//       setState(() {
//         _items.addAll(List.generate(5, (index) => CustomPostcustomCard(showLikeComment: true)));
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   void dispose() {
//     _scrollController.removeListener(_scrollListener);
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: ListView.builder(
//         controller: _scrollController,
//         itemCount: _items.length + 1,
//         itemBuilder: (context, index) {
//           if (index == _items.length) {
//             return _isLoading ? Center(child: CircularProgressIndicator()) : SizedBox.shrink();
//           }
//           return  CustomPostcustomCard(showLikeComment: true,);

//         },
//       ),
//     );
//   }
// }
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kon/widgets/cusom_side_bar.dart';
import 'package:kon/widgets/custom_post_card.dart';
import 'package:kon/widgets/custom_search_text_field.dart';

class HomePage extends StatefulWidget {
  final Function(bool) onScroll;
  final NotchBottomBarController? controller;

  const HomePage({Key? key, required this.onScroll, this.controller})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrollingDown = false;
  bool _showTopBar = true; // للتحكم في إظهار شريط البحث
  List<CustomPostcustomCard> _items =
      List.generate(5, (index) => CustomPostcustomCard(showLikeComment: true));
  bool _isLoading = false;
  final TextEditingController searchTextEditingController =
      TextEditingController();
  bool _isSidebarOpen = false;
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
        widget.onScroll(false);
        setState(() => _showTopBar = false);
        _isScrollingDown = true;
      }
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (_isScrollingDown) {
        widget.onScroll(true);
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
        _items.addAll(List.generate(
            5, (index) => CustomPostcustomCard(showLikeComment: true)));
        _isLoading = false;
      });
    }
  }

  void _toggleSidebar() {
    setState(() {
      _isSidebarOpen = !_isSidebarOpen;
    });
  }

  void _toggleBars(bool show) {
    setState(() {
      _showBottomAndTopBars = show;
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // قائمة المنشورات
        ListView.builder(
          controller: _scrollController,
          itemCount: _items.length + 1,
          itemBuilder: (context, index) {
            if (index == _items.length) {
              return _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : SizedBox.shrink();
            }
            return CustomPostcustomCard(showLikeComment: true);
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
                    onPressed: _toggleSidebar,
                    icon: const Icon(Icons.menu, color: Colors.green),
                  ),
                ),
              const SizedBox(width: 15),
              CustomSearchTextField(controller: searchTextEditingController),
              SizedBox(
                width: 15,
              ),


            ],
          ),
        ),

        // dar shadow for closing the side bar
        if (_isSidebarOpen)
          Positioned.fill(
            child: GestureDetector(
              onTap: _toggleSidebar,
              child: Container(
                  color:
                      Colors.black.withOpacity(0.5)), // تأثير التعتيم عند الفتح
            ),
          ),
        // the sideBar
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          left: _isSidebarOpen ? 0 : -250,
          top: 0,
          bottom: 0,
          child: CustomSidebar(onClose: _toggleSidebar),
        ),
      ],
    );
  }
}
