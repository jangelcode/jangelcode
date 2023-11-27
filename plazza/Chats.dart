import 'package:flutter/material.dart';
import 'data.dart';
import 'chat_item.dart';

// Define a stateful widget for the Chats screen
class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

// Define the state for the Chats widget
class _ChatsState extends State<Chats> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Initialize a TabController with two tabs (Message and Groups)
    _tabController = TabController(vsync: this, initialIndex: 0, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        // Leading icon button for navigation
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: () {},
        ),
        // Title with a search text field and filter icon
        title: TextField(
          decoration: InputDecoration.collapsed(
            hintText: 'Search',
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.filter_list,
            ),
            onPressed: () {},
          ),
        ],
        // Bottom TabBar with two tabs (Message and Groups)
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Theme.of(context).accentColor,
          labelColor: Theme.of(context).accentColor,
          unselectedLabelColor: Theme.of(context).textTheme.caption.color,
          isScrollable: false,
          tabs: <Widget>[
            Tab(
              text: "Message",
            ),
            Tab(
              text: "Groups",
            ),
          ],
        ),
      ),
      // Body with TabBarView to display different content for each tab
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          // First Tab (Message): Display a list of chats using ListView.separated
          ListView.separated(
            padding: EdgeInsets.all(10),
            separatorBuilder: (BuildContext context, int index) {
              // Divider between chat items
              return Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: Divider(),
                ),
              );
            },
            itemCount: chats.length,
            itemBuilder: (BuildContext context, int index) {
              // Create a ChatItem widget for each chat in the 'chats' list
              Map chat = chats[index];
              return ChatItem(
                dp: chat['dp'],
                name: chat['name'],
                isOnline: chat['isOnline'],
                counter: chat['counter'],
                msg: chat['msg'],
                time: chat['time'],
              );
            },
          ),
          // Second Tab (Groups): Display a list of groups using ListView.separated
          ListView.separated(
            padding: EdgeInsets.all(10),
            separatorBuilder: (BuildContext context, int index) {
              // Divider between group items
              return Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: Divider(),
                ),
              );
            },
            itemCount: groups.length,
            itemBuilder: (BuildContext context, int index) {
              // Create a ChatItem widget for each group in the 'groups' list
              Map chat = groups[index];
              return ChatItem(
                dp: chat['dp'],
                name: chat['name'],
                isOnline: chat['isOnline'],
                counter: chat['counter'],
                msg: chat['msg'],
                time: chat['time'],
              );
            },
          ),
        ],
      ),
      // Floating action button for adding new chats or groups
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {},
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
