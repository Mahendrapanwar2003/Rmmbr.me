import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_pro/app/routes/app_pages.dart';
import 'package:new_pro/common/theme_data.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.themeData(fontFamily: 'Poppins'),
    ),
  );
}


class FamilyMember {
  final String name;
  final String location;
  final String imageUrl;
  final List<FamilyMember> children;

  FamilyMember({
    required this.name,
    required this.location,
    required this.imageUrl,
    this.children = const [],
  });
}


class FamilyMemberCard extends StatelessWidget {
  final String name;
  final String location;
  final String imageUrl;

  const FamilyMemberCard({
    Key? key,
    required this.name,
    required this.location,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 30,
            ),
            SizedBox(height: 8),
            Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(location),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                // Add context menu or actions here if needed
              },
            ),
          ],
        ),
      ),
    );
  }
}



class FamilyTree extends StatelessWidget {
  final FamilyMember member;

  const FamilyTree({Key? key, required this.member}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FamilyMemberCard(
          name: member.name,
          location: member.location,
          imageUrl: member.imageUrl,
        ),
        if (member.children.isNotEmpty)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: member.children.map((child) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: FamilyTree(member: child),
            ))
                .toList(),
          ),
      ],
    );
  }
}



// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Family Tree',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FamilyTreePage(),
    );
  }
}

class FamilyTreePage extends StatelessWidget {
  final FamilyMember rootMember = FamilyMember(
    name: 'Eric Sinclair',
    location: '1970, Hamburg',
    imageUrl: 'https://example.com/image1.jpg', // Replace with actual image URLs
    children: [
      FamilyMember(
        name: 'Thomas Sinclair',
        location: '1970, Hamburg',
        imageUrl: 'https://example.com/image2.jpg',
      ),
      FamilyMember(
        name: 'Ryan Yamashita',
        location: '1970, Hamburg',
        imageUrl: 'https://example.com/image3.jpg',
        children: [
          FamilyMember(
            name: 'Erina Yamashita',
            location: '1970, Hamburg',
            imageUrl: 'https://example.com/image4.jpg',
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Family Tree'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: Column(children: [
                  Container(
                    height: 100,
                    color: Colors.red,
                  )
                  // remaining stuffs
                ]),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add logic to add new family members here
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
