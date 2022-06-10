import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Term_Conditions extends StatefulWidget {
  @override
  _Term_ConditionsState createState() => _Term_ConditionsState();
}

class _Term_ConditionsState extends State<Term_Conditions> {
  final String policy = "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.1032 and 1.10.33 of -de Finibus Bonorum et Malorum- (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of \"Lorem Ipsum, Lorem ipsum dolor sit amet..\"comes from a line in section 1.1032.\n\n The standard chunk of Lorem Ipsum used since the 1 SOOs is reproduced below for those interested. Sections 1.10.32 and 1.1033 from -de Finibus Bonorum et Maknum- by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\n\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't" ;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: Hero(
            tag: 'program',
            child: AppBar(
              centerTitle: true,
              shadowColor: HexColor('#016BB8'),
              elevation: 1.5,
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
              title: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text('Terms & Conditions'),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.black,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(20.0),
            child: Text( policy , style: TextStyle(color: Colors.white54, fontSize: 16.0)),
          ),
        ),
      ),
    );
  }
}
