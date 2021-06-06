import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;

class Note{
  String id;
  String body;
  Note({String id,String body}){
    this.id=id;
    this.body=body;
  }
}
class ShareThoughts extends StatefulWidget {
  @override
  _ShareThoughtsState createState() => _ShareThoughtsState();
}

class _ShareThoughtsState extends State<ShareThoughts> {

  List<Note> notes=[];
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getNotes();
  }

  void dispose(){
    super.dispose();
    notes=[];
  }

  Future getNotes() async{
    http.Response r=await http.get(Uri.parse("https://note-app-api-assignment.herokuapp.com/api"));
    List<dynamic> notesMap=jsonDecode(r.body)['data'];
    notesMap.forEach((e){
      notes.add(Note(id: e['_id'], body: e['note']));
    });
    setState(() {});
  }

  Future addNote() async{
  http.Response r =await http.post(
    Uri.parse("https://note-app-api-assignment.herokuapp.com/api"),
    headers: <String,String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String,String>{'note': _textEditingController.text}),
  );
  if(r.statusCode== 200){
    print('Success');
  }else{
    print('Failed!');
  }
  }

  void refresh(){
    setState(() {
      notes=[];
    });
    getNotes();
  }

  Future<void> showInformationDialog(BuildContext context) async{
    return await showDialog(context: context,
      builder:(context){
      return StatefulBuilder(builder: (context,setState){
        return AlertDialog(
          insetPadding: EdgeInsets.all(10),
          content: Form(
            key: _formKey,
            child: Container(
              width: 10,
              child: TextFormField(
                maxLines: null,
                autofocus: true,
                keyboardType: TextInputType.multiline,
                controller: _textEditingController,
                validator: (value){
                  return value.isNotEmpty?null:'Enter text';
                },
                decoration: InputDecoration(hintText:"Share"),
              ),
            ),
          ),
          title: Text('How you doin?'),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed:(){
                _textEditingController.text='';
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Post'),
              onPressed: () async{
                if(_formKey.currentState.validate()){
                  await addNote();
                  Navigator.of(context).pop();
                  refresh();
                  _textEditingController.text='';
                }
              },
            )
          ]
        );
      },
      );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showInformationDialog(context);
        },
        tooltip: 'Increment',
        backgroundColor: Colors.white70,
        child:Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('images/bground.jpg'),
            ),
          ),
          child: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2,sigmaY: 2),
                    child: Container(
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 30, 30, 20),
                  child: Center(
                    child: notes.isEmpty
                        ? Container(child:Text('No data!'))
                        : GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal:10, vertical: 10),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 1000,
                          childAspectRatio: 6/2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing:  20,
                          ),
                        itemCount: notes.length,
                        itemBuilder: (BuildContext ctx,index){
                          return InkWell(
                            onTap: () async{
                              final result=await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context)=> NoteWidget()),
                              );
                              if(result){
                                refresh();
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.topLeft,
                              child: Text(
                                notes[index].body,
                                maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 20, color:Colors.white),
                              ),
                              decoration: BoxDecoration(
                                color:Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                            ),
                          );
                        })
                  ),
              ),
          ]
        ),
        )
      )
    );
  }
}

class NoteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'Thanks for sharing!'
      ),
    );
  }
}
