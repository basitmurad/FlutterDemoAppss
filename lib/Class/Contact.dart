import 'package:flutter/cupertino.dart';

class ContactDetails
{

  String? email;
  String? name ;

  bool isfavorite ;




  //constructor
  ContactDetails({


    @required this.name,
    @required this.email,
    this.isfavorite = false
});




}