import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});
  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  //Variabel TextBox
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  var _outputName = '';
  var _outputDate = '';

   @override
  void dispose() {
    //Menghapus inputan yang sudah di isi
    _nameController.dispose();
    _dateController.dispose();
    //Mengeksekusi Method dispose
    super.dispose();
  }

  void _submitForm() {

    setState(() {
      _outputName = _nameController.text;
      _outputDate = _dateController.text;
    });

    print("Nama Lengkap : ${_nameController.text}");
    print("Tanggal Lahir: ${_dateController.text}");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Nama Lengkap : ${_nameController.text}, Tanggal Lahir : ${_dateController.text}")),
    );  
    //Memanggil Method Clear
    _clearInput();
  }
  void _clearInput() {
    //Membersihkan Isi text Box
    _nameController.clear();
    _dateController.clear(); 
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),   
      lastDate: DateTime(2100),    
    );

  
  if (picked != null) {
    setState(() {
        String formattedDate = "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
        _dateController.text = formattedDate;
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('My Form App')),
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Enter Your Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  controller: _dateController,
                  readOnly: true, 
                  onTap: () => _selectDate(context), 
                  decoration: const InputDecoration(
                    labelText: 'Pilih Tanggal',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today), 
                  ),
                ),
              ),
                SizedBox(height: 10,),

                OutlinedButton(
                  onPressed: () {
                    _submitForm();
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.green, width: 1),
                  ),
                  child: Text('simpan'),
                ),
                Text(
                  'Nama : ${_outputName.isEmpty ? "-" : _outputName}',
                  style: const TextStyle(fontSize: 14),
                ),

              Text(
                'Tanggal : ${_outputDate.isEmpty ? "-" : _outputDate}',
                style: const TextStyle(fontSize: 14),
              ),
              ],
              
            ),
          ),
        ),
      );
  }
}