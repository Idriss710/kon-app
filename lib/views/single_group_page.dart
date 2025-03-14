import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:kon/widgets/custom_widgets/cusom_side_bar.dart';
import 'package:kon/widgets/custom_widgets/custom_button.dart';
import 'package:kon/widgets/custom_widgets/custom_expandable_text.dart';
import 'package:kon/widgets/custom_widgets/custom_post_card.dart';
import 'package:kon/widgets/custom_widgets/custom_search_text_field.dart';
import 'package:kon/widgets/custom_widgets/custom_up_part_of_single_group_page.dart';
import 'package:kon/widgets/pages_for_adding_post_project_course_service/add_post.dart';
import 'package:kon/widgets/profile_screen_section/cover_and_photo_for_group.dart';

class SingleGroupPage extends StatefulWidget {
  const SingleGroupPage({Key? key}) : super(key: key);

  @override
  _SingleGroupPageState createState() => _SingleGroupPageState();
}

class _SingleGroupPageState extends State<SingleGroupPage> {
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
        setState(() => _showTopBar = false);
        _isScrollingDown = true;
      }
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (_isScrollingDown) {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Group Details',) ,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              // قائمة المنشورات
              Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    // CoverAndPhotoForGroup(),
          
                    Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: _items.length + 1,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return CustomUpPartOfSingleGroupPage();
                          }
                          if (index == _items.length) {
                            return _isLoading
                                ? Center(child: CircularProgressIndicator())
                                : SizedBox.shrink();
                          }
                          return CustomPostcustomCard(showLikeComment: true);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.to(AddPostPage());
      },
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      tooltip: 'Add Post',
      child: const Icon(Icons.add),
      ),
    );
  }
}
