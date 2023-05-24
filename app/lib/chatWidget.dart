import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatefulWidget {
  final String chatId;

  ChatPage({required this.chatId});

  @override
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {
  final UserUID = FirebaseAuth.instance.currentUser?.uid;
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 74, 173, 0.3),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, color: Color.fromRGBO(0, 74, 173, 1)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Chat Page',
          style: TextStyle(
            color: Color.fromRGBO(0, 74, 173, 1),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('chat')
                  .doc(widget.chatId)
                  .collection('messages')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(
                        Color.fromRGBO(0, 74, 173, 1),
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  reverse: true,
                  padding: EdgeInsets.all(16.0),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot document = snapshot.data!.docs[index];
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;

                    final String sentBy = data['sentBy'];
                    final String message = data['message'];
                    final Timestamp timestamp = data['timestamp'];
                    final formattedTime =
                        DateFormat.Hm().format(timestamp.toDate());
                    bool isCurrentUser = sentBy == UserUID;
                    bool isSenderOnRight = isCurrentUser;

                    return Align(
                      alignment: isSenderOnRight
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 4.0),
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: isCurrentUser
                              ? Color.fromRGBO(0, 74, 173, 1)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              message,
                              style: TextStyle(
                                fontWeight: isCurrentUser
                                    ? FontWeight.normal
                                    : FontWeight.normal,
                                color: isCurrentUser
                                    ? Colors.white
                                    : Color.fromRGBO(0, 74, 173, 1),
                              ),
                            ),
                            Text(
                              formattedTime,
                              style: TextStyle(
                                fontSize: 12,
                                color: isCurrentUser
                                    ? Colors.white
                                    : Color.fromRGBO(0, 74, 173, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    final String message = _messageController.text.trim();

                    if (message.isNotEmpty && UserUID != null) {
                      FirebaseFirestore.instance
                          .collection('chat')
                          .doc(widget.chatId)
                          .collection('messages')
                          .add({
                        'sentBy': UserUID,
                        'message': message,
                        'timestamp': Timestamp.now(),
                      });

                      _messageController.clear();
                    }
                  },
                  icon: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
