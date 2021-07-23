import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:frienderr/blocs/user_bloc.dart';
import 'package:frienderr/state/user_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:frienderr/screens/broadcast/broadcast.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Live extends StatefulWidget {
  Live({Key? key}) : super(key: key);

  @override
  LiveState createState() => LiveState();
}

class LiveState extends State<Live> {
  @override
  Widget build(BuildContext context) {
    late UserState userState = context.read<UserBloc>().state;
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('lives')
                // .orderBy('dateCreated', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).secondaryHeaderColor),
                  ),
                );
              }
              List<DocumentSnapshot> items = snapshot.data?.docs ?? [];
              if (items.length == 0) {
                return Center(
                    child: Text('No livestreams available on your feed'));
              }
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.7,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: items.length,
                  itemBuilder: (BuildContext ctx, index) {
                    final username = items[index]['username'];

                    final profilePic = items[index]['profilePhoto'];

                    return GestureDetector(
                        child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              CachedNetworkImageProvider(profilePic),
                        ),
                        Text(username)
                      ]),
                    ));
                    /*   onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BroadcastPage(
                                    channelName: 'buzz',
                                    isBroadcaster: false,
                                    user: userState)))
                                    );*/
                  });
            }));
  }
}
