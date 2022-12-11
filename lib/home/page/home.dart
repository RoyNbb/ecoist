import 'dart:html';
import 'dart:js_util';
// import 'dart:html';

import 'package:ecoist/donate/page/donate-list.dart';
import 'package:ecoist/landing/components/drawer_user.dart';
import 'package:ecoist/donate/model/donation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  int nominal = 1000;
  String namaPohon = "";
  int jumlahPohon = 1;
  String pesan = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: Scaffold(
        appBar: AppBar(
        title: const Text('Home'),
        ),
        drawer: const DrawerUser(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

            ],)
        ),
      ),
      
      
    ); 
  }
}
