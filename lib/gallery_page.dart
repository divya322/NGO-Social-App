import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GalleryPage extends StatelessWidget {
  final List<String> images = [
    'assets/images/home-1.jpg',
    'assets/images/home-2.jpg',
    'assets/images/home-3.jpg',
    // Add more image paths as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Gallery'),
      ),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _showImagePopup(context, images[index]);
            },
            child: Card(
              elevation: 4.0,
              margin: EdgeInsets.all(8.0),
              child: Image.asset(
                images[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
      ),
    );
  }

  void _showImagePopup(BuildContext context, String imagePath) {
    Fluttertoast.showToast(
      msg: '',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.transparent,
      textColor: Colors.transparent,
      fontSize: 16.0,
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              width: double.infinity,
              child: Image.asset(imagePath),
            ),
          ),
        );
      },
    );
  }
}
