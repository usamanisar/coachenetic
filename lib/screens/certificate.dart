import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Certificate extends StatefulWidget {
  @override
  _CertificateState createState() => _CertificateState();
}

class _CertificateState extends State<Certificate> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            centerTitle: true,
            shadowColor: Colors.deepPurple,
            elevation: 8.0,
            backgroundColor: HexColor('#10101E'),
            leading: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                child: Container(
                //  color: Colors.white,
                    child: Icon(Icons.arrow_back_ios_sharp, size: 20.0,)
                ),
                  ),
            ),
            title: Text('Certificate', ),
          ),
        ),
        body:  Container(
          margin: EdgeInsets.only(top: 20.0),
          child: Image.asset("assets/certificate.jpeg")
        ),
      ),
    );
  }
}
