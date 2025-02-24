import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  final Function(bool) onScroll;
  final NotchBottomBarController? controller;

  const HomePage({Key? key, required this.onScroll, this.controller}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrollingDown = false;
  List<String> _items = List.generate(20, (index) => "Home Item \${index + 1}");
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
      if (!_isScrollingDown) {
        widget.onScroll(false);
        _isScrollingDown = true;
      }
    } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
      if (_isScrollingDown) {
        widget.onScroll(true);
        _isScrollingDown = false;
      }
    }

    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100) {
      _loadMoreItems();
    }
  }

  Future<void> _loadMoreItems() async {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });

      await Future.delayed(Duration(seconds: 1));

      setState(() {
        _items.addAll(List.generate(10, (index) => "Home Item \${_items.length + index + 1}"));
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _items.length + 1,
        itemBuilder: (context, index) {
          if (index == _items.length) {
            return _isLoading ? Center(child: CircularProgressIndicator()) : SizedBox.shrink();
          }
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              // Ensure controller is not disposed before using it
              if (widget.controller != null && widget.controller!.index != 2) {
                widget.controller!.jumpTo(2);
              }
            },
            child: ListTile(
              title: Text(_items[index]),
            ),
          );
        },
      ),
    );
  }
}
