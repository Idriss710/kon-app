import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kon/widgets/custom_widgets/custom_post_card.dart';

class MyPostsPage extends StatefulWidget {
  // final Function(bool) onScroll;
  final NotchBottomBarController? controller;

  const MyPostsPage({Key? key, this.controller}) : super(key: key);

  @override
  _MyPostsPageState createState() => _MyPostsPageState();
}

class _MyPostsPageState extends State<MyPostsPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrollingDown = false;
  List<CustomPostcustomCard> _items = List.generate(5, (index) => CustomPostcustomCard(showLikeComment: true));
  bool _isLoading = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _scrollController.addListener(_scrollListener);
  // }

  // void _scrollListener() {
  //   if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
  //     if (!_isScrollingDown) {
  //       widget.onScroll(false);
  //       _isScrollingDown = true;
  //     }
  //   } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
  //     if (_isScrollingDown) {
  //       widget.onScroll(true);
  //       _isScrollingDown = false;
  //     }
  //   }

  //   if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100) {
  //     _loadMoreItems();
  //   }
  // }

  Future<void> _loadMoreItems() async {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });

      await Future.delayed(Duration(seconds: 1));

      setState(() {
        _items.addAll(List.generate(5, (index) => CustomPostcustomCard(showLikeComment: true)));
        _isLoading = false;
      });
    }
  }

  // @override
  // void dispose() {
  //   _scrollController.removeListener(_scrollListener);
  //   _scrollController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('My Posts'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _items.length + 1,
          itemBuilder: (context, index) {
            if (index == _items.length) {
              return _isLoading ? Center(child: CircularProgressIndicator()) : SizedBox.shrink();
            }
            return  CustomPostcustomCard(showLikeComment: true,);
      
          },
        ),
      ),
    );
  }
}
