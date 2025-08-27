import 'package:flutter/material.dart';


class ChatScreen extends StatelessWidget {
  final List<Map<String, dynamic>> activeUsers = [
    {'name': 'Eliaz\nBobadi...', 'online': true, 'color': Colors.green},
    {'name': 'DavisDa\nvisDavis', 'online': true, 'color': Colors.pink},
    {'name': 'Moataz\nMoha...', 'online': true, 'color': Colors.blue},
    {'name': 'Phuong\nNguyen', 'online': true, 'color': Colors.grey},
    {'name': 'Abdulel\nah', 'online': true, 'color': Colors.orange},
  ];

  final List<Map<String, dynamic>> chats = [
    {
      'name': 'Amr Moustafa',
      'message': "what's up my bro , What are you doing now",
      'time': '02:55 pm',
      'unread': true,
      'avatar': Colors.green
    },
    {
      'name': 'Mohamed Said yemlahi',
      'message': 'What are you doing now?',
      'time': '09:12 pm',
      'unread': true,
      'avatar': Colors.grey
    },
    {
      'name': 'Andrey Esin',
      'message': 'HI',
      'time': '12:05 am',
      'unread': true,
      'avatar': Colors.brown
    },
    {
      'name': 'Moataz Mohammady',
      'message': '"Hello, World!"',
      'time': '02:55 pm',
      'unread': true,
      'avatar': Colors.blue
    },
    {
      'name': 'Iago Rocha',
      'message': '🔥',
      'time': '08:01 pm',
      'unread': false,
      'avatar': Colors.lightBlue
    },
    {
      'name': 'Gael',
      'message': 'Hi My broo',
      'time': '12:34 am',
      'unread': true,
      'avatar': Colors.white
    },
    {
      'name': 'Mohamed khalid',
      'message': 'Yee this is my page',
      'time': '02:55 pm',
      'unread': true,
      'avatar': Colors.purple
    },
    {
      'name': 'Anas Elgarhy',
      'message': "I'm Anas",
      'time': 'yesterday',
      'unread': false,
      'avatar': Colors.red
    },
    {
      'name': 'Ibrahim ALi',
      'message': '',
      'time': '',
      'unread': false,
      'avatar': Colors.teal
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            _buildStatusBar(),
            _buildHeader(),
            _buildSearchBar(),
            _buildActiveUsers(),
            Expanded(child: _buildChatList()),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBar() {
    return Container(
      height: 44,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text('12:17', style: TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(width: 5),
              Icon(Icons.signal_cellular_4_bar, size: 16),
              Icon(Icons.wifi, size: 16),
            ],
          ),
          Row(
            children: [
              Icon(Icons.signal_wifi_4_bar, size: 16),
              Icon(Icons.signal_cellular_4_bar, size: 16),
              Icon(Icons.battery_full, size: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Color(0xFF1C1C1E),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.red, Colors.teal],
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text('Chats', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            ],
          ),
          Row(
            children: [
              _buildHeaderButton(Icons.camera_alt),
              SizedBox(width: 15),
              _buildHeaderButton(Icons.edit),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderButton(IconData icon) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF2C2C2E),
      ),
      child: Icon(icon, size: 18, color: Colors.white),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Color(0xFF8E8E93)),
          SizedBox(width: 10),
          Text('Search', style: TextStyle(color: Color(0xFF8E8E93))),
        ],
      ),
    );
  }

  Widget _buildActiveUsers() {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: activeUsers.length,
        itemBuilder: (context, index) {
          final user = activeUsers[index];
          return Container(
            margin: EdgeInsets.only(right: 15),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: user['color'],
                      ),
                    ),
                    if (user['online'])
                      Positioned(
                        bottom: 2,
                        right: 2,
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  user['name'],
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildChatList() {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: chat['avatar'],
                    ),
                  ),
                  Positioned(
                    bottom: 2,
                    right: 2,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          chat['name'],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              chat['time'],
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF8E8E93),
                              ),
                            ),
                            if (chat['unread'])
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 3),
                    Text(
                      chat['message'],
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF8E8E93),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}