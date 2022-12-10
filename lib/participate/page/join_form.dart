import 'package:ecoist/participate/page/tes_participants.dart';
import 'package:flutter/material.dart';
import 'package:ecoist/main.dart';
import 'package:ecoist/landing/components/drawer_user.dart';
import 'package:ecoist/participate/page/participants.dart';

class ParticipatePage extends StatefulWidget {
  const ParticipatePage({super.key});

  @override
  State<ParticipatePage> createState() => _ParticipateFormPageState();
}

class _ParticipateFormPageState extends State<ParticipatePage> {

  final _formKey = GlobalKey<FormState>();
  String _namaPendaftar = "";
  String _emailPendaftar = "";
  int _phoneNumber = 0;
  String _whatCanYouHelpWith = 'Delivering flyers';
  String _reasonToParticipate = "";

  void clearText() {
    _namaPendaftar = "";
    _emailPendaftar = "";
     _phoneNumber = 0;
     _whatCanYouHelpWith = 'Delivering flyers';
     _reasonToParticipate = "";
  }

  bool isNumeric(String value){
    return int.tryParse(value) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Partisipan'),
      ),
      drawer: const DrawerUser(),

      // Form
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Nama Pendaftar",
                      icon: const Icon(Icons.edit_note),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _namaPendaftar = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _namaPendaftar = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama pendaftar tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "E-mail Pendaftar",
                      icon: const Icon(Icons.edit_note),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _emailPendaftar = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _emailPendaftar = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'E-mail pendaftar tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Phone Number",
                      icon: const Icon(Icons.monetization_on_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),

                    keyboardType: TextInputType.number,

                    onChanged: (String? value) {
                      setState(() {
                        _phoneNumber = int.parse(value!);
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _phoneNumber = value! as int;
                      });
                    },
                    // Validator
                    validator: (String? value) {

                      if (value == null || value.isEmpty) {
                        return 'Nomor telepon tidak boleh kosong!';
                      }
                      if (!isNumeric(value)) {
                        return 'Nomor telepon harus berupa angka!';
                      }
                      return null;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    // controller: textarea,
                    maxLines: 4,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      labelText: "Reason",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _reasonToParticipate = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _reasonToParticipate = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Reason to participate';
                      }
                      return null;
                    },
                  ),
                ),

                // Buat Dropdown
                ListTile(
                  leading: const Icon(Icons.class_),
                  title: const Text(
                    'Pilih Jenis ',
                  ),
                  trailing: DropdownButton(
                    value: _whatCanYouHelpWith,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: const <DropdownMenuItem<String>>[
                      DropdownMenuItem<String>(
                        value: 'Delivering flyers',
                        child: Text('Delivering flyers'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Door-to-Door',
                        child: Text('Door-to-Door'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Clerical work',
                        child: Text('Clerical work'),
                      ),
                    ],

                    onChanged: (String? newValue) {
                      setState(() {
                        _whatCanYouHelpWith = newValue!;
                      });
                    },
                  ),
                ),

                // Tombol "Simpan"
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      inputDataBudget(_namaPendaftar, _emailPendaftar, _phoneNumber, _whatCanYouHelpWith, _reasonToParticipate);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ParticipatePage()),
                      );
                      clearText();
                    }
                  },
                  child: const Text(
                    "Daftar",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const InputParticipants()),
                      );
                      clearText();
                  },
                  child: const Text(
                    "Info Partisipan",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TesParticipants()),
                    );
                    clearText();
                  },
                  child: const Text(
                    "Daftar Partisipan",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}