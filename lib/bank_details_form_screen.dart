import 'package:flutter/material.dart';

import 'database_helper.dart';
import 'main.dart';

class BankDetailsForm extends StatefulWidget {
  const BankDetailsForm({Key? key}) : super(key: key);

  @override
  State<BankDetailsForm> createState() => _BankDetailsFormState();
}

class _BankDetailsFormState extends State<BankDetailsForm> {
  var _BankNameController = TextEditingController();
  var _BranchNameController = TextEditingController();
  var _AccountNoController = TextEditingController();
  var _IfscCodeController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bank Details Form"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(10)),
              TextFormField(
                  controller: _BankNameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: "Bank Name",
                      hintText: "Enter The Bank Name")),
              Padding(padding: EdgeInsets.all(10)),
              TextFormField(
                  controller: _BranchNameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: "Branch Name",
                      hintText: "Enter The Branch")),
              Padding(padding: EdgeInsets.all(10)),
              TextFormField(
                  controller: _AccountNoController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: "Account Number",
                      hintText: "Enter The Account Number")),
              Padding(padding: EdgeInsets.all(10)),
              TextFormField(
                  controller: _IfscCodeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: " IFSC CODE",
                    hintText: "Enter The IFSC Code",
                  )),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  _save();
                },
                child: Text('save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _save() async {
    print('-----------------> BankName:${_BankNameController.text}');
    print('-----------------> BranchName:${_BranchNameController.text}');
    print('-----------------> Account Number:${_AccountNoController.text}');
    print('-----------------> IFSC Code:${_IfscCodeController.text}');

    Map<String, dynamic> row = {
      DataBaseHelper.columnbankName: _BankNameController.text,
      DataBaseHelper.columnbranchName: _BranchNameController.text,
      DataBaseHelper.columnAccountNo: _AccountNoController.text,
      DataBaseHelper.columnIFSCCode: _IfscCodeController.text,
    };
    
    final result =await dbHelper.insert(row,DataBaseHelper.BankDetailsTable);
    print('---------->Insert Result:$result');
  }
}
