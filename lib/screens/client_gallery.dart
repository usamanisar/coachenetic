/*
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Client_Gallery extends StatefulWidget {
  @override
  _Client_GalleryState createState() => _Client_GalleryState();
}

class _Client_GalleryState extends State<Client_Gallery> {
  // List<String> images = ["assets/gallery_pic_1.png","assets/gallery_pic_2.png","assets/gallery_pic_3.png","assets/gallery_pic_4.png","assets/gallery_pic_5.png","assets/gallery_pic_6.png","assets/gallery_pic_7.png","assets/gallery_pic_8.png",];
  List<File> _images =[];
  File _newImage ;
  _imgFromGallery() async {
    File image = await  ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );
    _images.add(_newImage);
    setState(() {
      // _image = image;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading:GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            //  color: Colors.white,
              child: Icon(Icons.arrow_back_ios_sharp, size: 20.0,)
          ),
        ),
        title: Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Text("Gallery", )),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 5.0),
                child: Text("Transformation", style: TextStyle(fontSize: 20, color: Colors.white70),)),
            Expanded(
              child: Container(
                child: GridView.builder(
                  itemCount: _images.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Image.file(_images[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 30.0, right: 30.0),
        child: FloatingActionButton(
          elevation: 5.0,
          backgroundColor: Colors.black,

          onPressed: () {
            _imgFromGallery();
          },
          child: const Icon(Icons.add),
          // backgroundColor: Colors.blueAccent,
        ),
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';

class Client_Gallery extends StatefulWidget {
  @override
  _Client_GalleryState createState() => _Client_GalleryState();
}

class _Client_GalleryState extends State<Client_Gallery> {
  List<String> images = ["assets/gallery_pic_1.png","assets/gallery_pic_2.png","assets/gallery_pic_3.png","assets/gallery_pic_4.png","assets/gallery_pic_5.png","assets/gallery_pic_6.png","assets/gallery_pic_7.png","assets/gallery_pic_8.png",];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading:GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            //  color: Colors.white,
              child: Icon(Icons.arrow_back_ios_sharp, size: 20.0,)
          ),
        ),
        title: Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Text("Gallery", )),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 5.0),
                child: Text("Transformation", style: TextStyle(fontSize: 20, color: Colors.white70),)),
            Expanded(
              child: Container(
                child: GridView.builder(
                  itemCount: images.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Image.asset(images[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 30.0, right: 30.0),
        child: FloatingActionButton(
          elevation: 5.0,
          backgroundColor: Colors.black,

          onPressed: () {

          },
          child: const Icon(Icons.add),
         // backgroundColor: Colors.blueAccent,
        ),
      ),
    );
  }
}
