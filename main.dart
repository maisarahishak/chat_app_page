import 'package:chatapp_firebase/pages/chat_page.dart';
import 'package:chatapp_firebase/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyAXUAaFiGd0ncQLOZhoH73LIJE61NNMM8E',
          appId: '1:323306445180:android:fd5a2600407ad8b2da2cf9',
          messagingSenderId: '323306445180',
          projectId:
              'chatappflutter-581fd')); //when debugging in web mode, you need to pass this option in the initializer function
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CollectionReference _groups =
      FirebaseFirestore.instance.collection('groups');

  //List<String> id = ['maisarah'];
  // if(id.contains('maisarah')){}

  /*
  await _products.add({"name": name, "price": price});
  await _products.update({"name": name, "price": price});
  await _products.doc(productId).delete();
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _groups.snapshots(), //build connection
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length, //number of rows
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(documentSnapshot['groupName']),
                    subtitle: Text(documentSnapshot['recentMessageSender'] +
                        ": " +
                        documentSnapshot['recentMessage']),
                    onTap: () async {
                      nextScreenReplace(
                          context,
                          ChatPage(
                              groupId: '9gBQscm2QDBE0WTRFL8J',
                              groupName: 'Testing Group',
                              userName: 'Maisarah Ishak'));
                    },
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

/*void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyD9AxHRZ4AY7nFc9o0c5jEIAOhudv3TLCE',
          appId: '1:50922026629:android:5bbe7ed7096b17badc9bec',
          messagingSenderId: '50922026629',
          projectId:
              'flutter-demo-ed096')); //when debugging in web mode, you need to pass this option in the initializer function
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: Text("Cosary"),
        ),
        body: MyDynamicListView(),
      ),
    );
  }
}

class MyDynamicListView extends StatelessWidget {
  final CollectionReference _groupList =
      FirebaseFirestore.instance.collection('groupList');

  @override
  Widget build(BuildContext context) {
    /*final semester = [
      'Final Year Project',
      'Machine Learning',
      'ICT and Islam',
      'Technopreneurship',
      'Usrah in Action'
    ];

    List<Map<String, dynamic>> classDesc = [
      {"name": "Machine Learning", "section": 3},
      {"name": "Final Year Project", "section": 6},
      {"name": "ICT and Islam", "section": 1},
    ];*/

    return ListView.separated(
      //itemCount: semester.length,
      itemCount: classDesc.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: new Text(classDesc[index]["name"]),
          subtitle:
              new Text("Section: " + classDesc[index]["section"].toString()),
          onTap: () {
            print(semester[index]);
          },
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}*/
