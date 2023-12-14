import 'package:flutter/material.dart';

import 'package:faker/faker.dart' as faker;

import 'Class/Contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<ContactDetails> _list12;

  //run when the widget in initialize
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _list12= List.generate(
      50,
      (index) {
        return ContactDetails(
            name: ' $index  ' +
                faker.Faker().person.firstName() +
                faker.Faker().person.lastName(),
            email: faker.Faker().internet.freeEmail());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Flutter Demo App",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blueAccent,
          // Set the elevation (shadow) of the AppBar

          titleTextStyle: TextStyle(color: Colors.black),
          toolbarTextStyle: TextStyle(fontSize: 25.0), // Set title text color
        ),

        body: ListView.builder(



          itemCount: _list12.length,
          itemBuilder: (context, index) {

            return ListTile(
              title: Text('${_list12[index].name ?? "Unknown"}'),
              subtitle: Text( "       ${_list12[index].email}" ?? "No email"),
              trailing: IconButton(icon: Icon(_list12[index] .isfavorite? Icons.star:  Icons.star_border),
                color: _list12[index].isfavorite? Colors.deepOrange :Colors.amber, onPressed: () {

                setState(() {
                  _list12[index].isfavorite =! _list12[index].isfavorite;
                  _list12.sort((a, b) {

                    if(a.isfavorite)
                      {
                        return -1;
                      }
                    else if(b.isfavorite)
                      {
                        return 1;
                      }
                    else{
                      return 0;
                    }
                  });

                });

                 },),
            );

            //
            // return Padding(padding: const EdgeInsets.all(1.0),
            // child: ListTile (
            //   title: Text('name${list12[index].name}')
            //   ));

            // return ListTile(
            //  title:  Text("Item $index")
            // );
          },
        ),
      ),
    );
  }
}
