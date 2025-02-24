import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NotificationPage extends StatefulWidget {
  final Function(bool) onScroll;
  NotificationPage({required this.onScroll});

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrollingDown = false;
  List<String> _items = List.generate(20, (index) => "Notification Item ${index + 1}");
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

    // Lazy Loading: Load more when reaching the bottom
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100) {
      _loadMoreItems();
    }
  }

  Future<void> _loadMoreItems() async {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });

      await Future.delayed(Duration(seconds: 1)); // Simulate network delay

      setState(() {
        _items.addAll(List.generate(10, (index) => "Notification Item ${_items.length + index + 1}"));
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
    return Scaffold(
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _items.length + 1,
        itemBuilder: (context, index) {
          if (index == _items.length) {
            return _isLoading
                ? Center(child: CircularProgressIndicator())
                : SizedBox.shrink();
          }
          return ListTile(
            title: Text(_items[index]),
          );
        },
      ),
    );
  }
}