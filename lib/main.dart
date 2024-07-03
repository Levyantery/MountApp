import 'package:flutter/material.dart';
import 'package:mountapp/class_mount_model.dart';
import 'package:mountapp/details_rating_bar.dart';
import 'package:mountapp/app_header.dart';
import 'package:mountapp/app_mount_list_view.dart';
import 'package:mountapp/app_search.dart';
import 'package:mountapp/app_category_list.dart';
import 'package:mountapp/app_bottom_bar.dart';
import 'package:mountapp/details_bottom_actions.dart';

final Color maincolor = Color(0xFFFF5656);

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    ),
  );
}

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 7), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MountsApp()));
    });
    return Container(
      color: Colors.green,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Icon(Icons.terrain, color: Colors.white, size: 90),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class MountsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Icon(
            Icons.terrain,
            color: Colors.green,
            size: 40,
          ),
        ),
        actions: [
          SizedBox(width: 40, height: 40),
        ],
        iconTheme: IconThemeData(color: Colors.green),
      ),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(30),
          color: Colors.green,
          alignment: Alignment.bottomLeft,
          child: Icon(Icons.terrain, color: Colors.white, size: 80),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppHeader(),
          AppSearch(),
          Expanded(child: AppMountListView()),
          AppCategoryList(),
          AppBottomBar(),
        ],
      ),
    );
  }
}

class MountItem {
  final String path;
  final String name;
  final String location;
  final String description; 

  MountItem({
    required this.path,
    required this.name,
    required this.location,
    required this.description, 
   }
  );
}


class DetailsPage extends StatelessWidget {
 
 MountModel mount;

 DetailsPage(this.mount);
 
 
  @override
  Widget build(BuildContext context) {
    var selectedItem = mount;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(selectedItem.path),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 30,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          selectedItem.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          selectedItem.location,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    iconTheme: IconThemeData(color: Colors.green),
                    title: Center(
                      child: Icon(Icons.terrain, color: Colors.green, size: 40),
                    ),
                    actions: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Icon(Icons.pending, color: Colors.green, size: 30),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                DetailsRatingBar(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                        child: Text(
                          'About ${selectedItem.name}',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                        child: Text('${selectedItem.description}', style: TextStyle(fontSize: 12)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          DetailsBottomActions()
        ],
      ),
    );
  }
}
