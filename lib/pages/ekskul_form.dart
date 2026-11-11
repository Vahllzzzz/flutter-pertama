import 'package:flutter/material.dart';
import 'package:project_pertama/helpers/size_helper.dart';
import 'package:project_pertama/pages/ekskul_output.dart';
import 'package:intl/intl.dart';

class EkskulForm extends StatefulWidget {
  const EkskulForm({super.key});

  @override
  State<EkskulForm> createState() => _EkskulFormState();
}

class _EkskulFormState extends State<EkskulForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController namaController = TextEditingController();
  TextEditingController noTelpController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController tglLahirController = TextEditingController();

  String _pileks = "";
  String? _pileksError;
  String _pilihKelas = "";

  final List<String> kelas = [
    "X",
    "XI",
    "XII",
  ];
  final List<String> pileks = [
    "Basket",
    "Futsal",
    "Paskibra",
    "Pramuka"
  ];
  @override
  void initState() {
    super.initState();
    tglLahirController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        color: Colors.blueGrey,
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Formulir Biodata",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 18),

                      TextFormField(
                        controller: namaController,
                        decoration: InputDecoration(
                          hintText: "Nama Lengkap",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) return 'Input Nama';
                          return null;
                        },
                      ),
                      
                      const SizedBox(height: 18),

                      TextFormField(
                        keyboardType: TextInputType.numberWithOptions(),
                        controller: noTelpController,
                        decoration: InputDecoration(
                          hintText: "No Telepon",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) return 'Input No Telepon';
                          return null;
                        },
                      ),

                      const SizedBox(height: 18),

                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Email",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                          { return 'Input Email';
                          } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return 'Input Email yang valid';
                          }
                          
                          return null;
                        },
                      ),

                      const SizedBox(height: 18),

                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: "Pilih Kelas",
                          border: OutlineInputBorder(),
                        ),
                        items: kelas
                            .map(
                              (item) => DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _pilihKelas = value!;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Pilih kelas';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 18),
                      
                      // Ekskul Selection
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Ekskul",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      ...pileks.map((item) {
                          final isSelected = _pileks.contains(item);

                          return CheckboxListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(item),
                            value: isSelected,
                            controlAffinity: ListTileControlAffinity.leading,
                            onChanged: (value) {
                              setState(() {
                                if (value == true) {
                                  if (_pileks.length < 2) {
                                    _pileks += item + ", ";
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Pilih maksimal 2 ekstrakurikuler"),
                                      ),
                                    );
                                  }
                                } else {
                                  _pileks = _pileks.replaceAll(item + ", ", "");
                                }
                              });
                            },
                          );
                        }),

                        if (_pileks.isEmpty)
                          const Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              "Pilih minimal 1 ekstrakurikuler",
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            ),
                          ),

                      const SizedBox(height: 18),

                      TextFormField(
                        controller: tglLahirController,
                        decoration: InputDecoration(
                          hintText: "Tanggal Daftar",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Input Tanggal Daftar';
                          }
                          return null;
                        },
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );

                          if (pickedDate != null) {
                            setState(() {
                              tglLahirController.text = DateFormat('yyyy-MM-dd')
                                  .format(pickedDate);
                            });
                          }
                        },
                      ),

                      const SizedBox(height: 24),

                      SizedBox(
                        width: displayWidth(context) * 0.8,
                        height: displayHeight(context) * 0.075,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                              side: BorderSide(color: Colors.black),
                            ),
                          ),
                          child: Text(
                            "Simpan",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: _submit,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate();

    if (_pileks.isEmpty) {
      setState(() => _pileksError = 'Pilih Kelas');
    }

    if (!isValid || _pileks.isEmpty) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OutputEkskulScreen(
          nama: namaController.text,
          pileks: _pileks,
          tgllahir: tglLahirController.text,
          kelas: _pilihKelas,
          notelp: noTelpController.text,
        ),
      ),
    );
  }
}