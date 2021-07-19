import 'package:flutter/material.dart';
import './ticket.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'TAMBOLA GAME SCREEN'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
} 

class _MyHomePageState extends State<MyHomePage> {
   
   List<List<String>> tamBoard = List<List<String>>.generate(
      3, (i) => List<String>.generate(9, (i) => " "),
      growable: false);
  void gen() {
    setState(() {
      TambolaTicketGenerator t = new TambolaTicketGenerator();
      tamBoard = t.Generate();
    });
  }


  @override

  void initState() {
    gen();
  }

  bool _hasBeenPressed = false;

  Widget build(BuildContext context) {
    List<Widget> myRowChildren = [];
    List<List<Widget>> numbers = [];
    List<Widget> columnNumbers = [];
    int z = 0;
    for (int i = 1; i <= 9; i++) {
      int maxColNr = 10;
      for (int y = 1; y <= maxColNr; y++) {
        int currentNumber = z + y; // 0,1,2,3,4,5,6,7,8,9,10, 10,11, 12, 13,14
        columnNumbers.add(Container(
          height: 40,
          width: 35,
          //color: _hasBeenPressed ? Colors.black : Colors.greenAccent,
          child: TextButton(
              child: Text('$currentNumber'),
              style: TextButton.styleFrom(
                primary: _hasBeenPressed ? Colors.black : Colors.blue,
              ),
              onPressed: () {
                setState(() {
                  _hasBeenPressed = !_hasBeenPressed;
                  // _hasBeenPressed = false;
                });
              }),
        ));
      }
      z += maxColNr;
      numbers.add(columnNumbers);
      columnNumbers = [];
    }

    myRowChildren = numbers
        .map(
          (columns) => Card(
            child: Wrap(
              // mainAxisAlignment: MainAxisAlignment.center,
              direction: Axis.vertical,

              children: columns.map((n) {
                return Container(
                  child: n,
                );
              }).toList(),
            ),
          ),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: myRowChildren,
            ),
          ),
          //SizedBox(height: 100.0,),
          Container(
            child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Container(
             margin: EdgeInsets.fromLTRB(10, 0, 10, 0),

              child: Table(border: TableBorder.all(color:Colors.black,style: BorderStyle.solid,width: 1,),
              children: [
                for(int i=0; i<=2;i++)
                   TableRow(
                      decoration: BoxDecoration(color: Colors.lightBlueAccent,),
                     children: [
                       for(int j=0; j<=8;j++)
                          Column(children: [
                            Text(tamBoard[i][j], style: TextStyle(fontSize: 20.0)),]) 
                          ],)
                     ]
                   )
                // TableRow(
                //   decoration: BoxDecoration(color: Colors.lightBlueAccent,),
              
                //   children: [
                //   Column(children: [Text(tamBoard[0][0], style: TextStyle(fontSize: 20.0)),]),
                //   Column(children: [Text(tamBoard[0][1], style: TextStyle(fontSize: 20.0))]),
                //   Column(children: [Text(tamBoard[0][2], style: TextStyle(fontSize: 20.0))]),
                //   Column(children: [Text(tamBoard[0][3], style: TextStyle(fontSize: 20.0))]),
                //   Column(children: [Text(tamBoard[0][4], style: TextStyle(fontSize: 20.0))]),
                //   Column(children: [Text(tamBoard[0][5], style: TextStyle(fontSize: 20.0))]),
                //   Column(children: [Text(tamBoard[0][6], style: TextStyle(fontSize: 20.0))]),
                //   Column(children: [Text(tamBoard[0][7], style: TextStyle(fontSize: 20.0))]),
                //   Column(children: [Text(tamBoard[0][8], style: TextStyle(fontSize: 20.0))]),
                // ]),
                // TableRow(
                //   decoration: BoxDecoration(color: Colors.lightBlueAccent,),
                //   children: [
                //   Column(children: [Text(tamBoard[1][0], style: TextStyle(fontSize: 20.0))]),
                //   Column(children: [Text(tamBoard[1][1], style: TextStyle(fontSize: 20.0))]),
                //   Column(children: [Text(tamBoard[1][2], style: TextStyle(fontSize: 20.0))]),
                //   Column(children: [Text(tamBoard[1][3], style: TextStyle(fontSize: 20.0))]),
                //   Column(children: [Text(tamBoard[1][4], style: TextStyle(fontSize: 20.0))]),
                //   Column(children: [Text(tamBoard[1][5], style: TextStyle(fontSize: 20.0))]),
                //   Column(children: [Text(tamBoard[1][6], style: TextStyle(fontSize: 20.0))]),
                //   Column(children: [Text(tamBoard[1][7], style: TextStyle(fontSize: 20.0))]),
                //   Column(children: [Text(tamBoard[1][8], style: TextStyle(fontSize: 20.0))]),
                // ]),
                // TableRow(
                //   decoration: BoxDecoration(color: Colors.lightBlueAccent,),
                //   children: [
                //   Column(children: [Text(tamBoard[2][0], style: TextStyle(fontSize: 20.0))]),
                //   Column(children: [Text(tamBoard[2][1], style: TextStyle(fontSize: 20.0))]),
                //   Column(children: [Text(tamBoard[2][2], style: TextStyle(fontSize: 20.0))]),
                //   Column(children: [Text(tamBoard[2][3], style: TextStyle(fontSize: 20.0))]),
                //   Column(children: [Text(tamBoard[2][4], style: TextStyle(fontSize: 20.0))]),
                //   Column(children: [Text(tamBoard[2][5], style: TextStyle(fontSize: 20.0))]),
                //   Column(children: [Text(tamBoard[2][6], style: TextStyle(fontSize: 20.0))]),
                //   Column(children: [Text(tamBoard[2][7], style: TextStyle(fontSize: 20.0))]),
                //   Column(children: [Text(tamBoard[2][8], style: TextStyle(fontSize: 20.0))]),
                // ]
                // ),
            )],
              ),
            ),
            Container(
              child: OutlinedButton(  
                child: Text('New', style: TextStyle(fontSize: 20.0),),  
                onPressed: () {gen();},  
              ),  

            ),
          ],
          ),
          );
  }
}
