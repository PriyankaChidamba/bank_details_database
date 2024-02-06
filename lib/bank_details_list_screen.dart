import 'package:bank_details_priyanka/bank_details_form_screen.dart';
import 'package:bank_details_priyanka/database_helper.dart';
import 'package:bank_details_priyanka/main.dart';
import 'package:bank_details_priyanka/module.dart';
import 'package:flutter/material.dart';

import 'module.dart';
class BankDetailsScreen extends StatefulWidget {
  const BankDetailsScreen({Key? key}) : super(key: key);

  @override
  State<BankDetailsScreen> createState() => _BankDetailsScreenState();
}

class _BankDetailsScreenState extends State<BankDetailsScreen>{
  late List<BankDetails>_bankDetailsList;
  @override
  void initstate(){
    super.initState();
    getAllBankDetails();
  }
  getAllBankDetails() async{
    _bankDetailsList=<BankDetails>[];
    var bankDetails=await dbHelper.queryAllRows(DataBaseHelper.BankDetailsTable);
    bankDetails.forEach(
        (bankDetails){
          setState(() {
            // display in log
            print(bankDetails['_id']);
            print(bankDetails['_BankName']);
            print(bankDetails['_BranchName']);
            print(bankDetails['_AccountNo']);
            print(bankDetails['_IFSCcode']);
     //data model
            var bankDetailsModel =BankDetails(
             bankDetails['_id'] ,
                bankDetails['_BankName'],
                bankDetails['_BranchName'],
                bankDetails['_AccountNo'] ,
                bankDetails['_IFSCcode']
            );
            //add in list
            _bankDetailsList.add(bankDetailsModel);
          });
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Bank Details"),
      ),
       body: Container(
         width: double.infinity,
         height: double.infinity,
         child: Column(
           children: [
             new Expanded(child:new ListView.builder(itemCount: _bankDetailsList.length,
             itemBuilder: (BuildContext context,int index){
               return new InkWell(
                // onTap: (){
                  // print('-------------> List view Clicked $index');
                  // print(_bankDetailsList[index].id);
                //   print(_bankDetailsList[index].BankName);
                 //  print(_bankDetailsList[index].Branch);
                //   print(_bankDetailsList[index].AccountNo);
                //   print(_bankDetailsList[index].IFSCcode);

                // },
                 child: Text(
                   _bankDetailsList[index].BankName +
                       '\n' +
                       _bankDetailsList[index].Branch +
                       '\n' +

                       _bankDetailsList[index].AccountNo +
                       '\n' +
                       _bankDetailsList[index].IFSCcode +
                       '\n'),
                 );

             }
             )
             )
           ],
         ),
       ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> BankDetailsForm()));

        },
        child: Icon(Icons.add),
      ),
    );
  }
}

