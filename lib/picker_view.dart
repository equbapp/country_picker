import 'package:country_picker/country_code.dart';
import 'package:country_picker/country_codes.dart';
import 'package:flutter/material.dart';

class PickerView extends StatefulWidget {

  final BuildContext? context;
  final String? title;
  final Function? onClose;
  final Function(CountryCodeInfo)? onPicked;
  final Color backgroundColor = Colors.white;
  final Color foregroundColor = Colors.black;
  final double borderRadius = 10.0;

  const PickerView({this.context, this.title, this.onClose, this.onPicked});

  @override
  _PickerViewState createState() => _PickerViewState();
}

class _PickerViewState extends State<PickerView> {

  List<CountryCodeInfo> allCodes = [];
  List<CountryCodeInfo> searchedCodes = [];

  String searchText = '';

  @override
  void initState() {
    for(int i=0; i<countryCodes.length; i++){
      allCodes.add(CountryCodeInfo.fromJson(countryCodes[i]));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).viewInsets.bottom==0 ? MediaQuery.of(context).size.height/1.3 : MediaQuery.of(context).size.height*0.5,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15.0)),
          ),
          child: Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    width: 100,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.grey[500],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        onChanged: (val) {
                          setState(() {
                            searchText = val;
                          });
                          searchThis(val);
                        },
                        autofocus: false,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.grey[800],
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            fontSize: 17.0,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w300,
                          ),
                          contentPadding:
                          EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
                          filled: true,
                          fillColor: Colors.grey[200],
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide:
                            BorderSide(color: Colors.transparent, width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide:
                            BorderSide(color: Colors.transparent, width: 1.5),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: (){
                        if(searchText!=''){
                          searchThis(searchText);
                        }
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: allCodes.length==0 ? Container(width: 50, height: 50, child: CircularProgressIndicator(),) :
                searchText=='' ? ListView.builder(
                  itemCount: allCodes.length,
                  itemBuilder: (context, index) {
                    CountryCodeInfo code = allCodes[index];
                    return ListTile(
                      leading: Text(code.flag!),
                      title: Text(code.country!),
                      subtitle: Text(code.dialCode!),
                      onTap: (){
                        print(code.dialCode);
                        widget.onPicked!(code);
                        widget.onClose!(widget.context);
                      },
                    );
                  },
                ) : ListView.builder(
                  itemCount: searchedCodes.length,
                  itemBuilder: (context, index) {
                    CountryCodeInfo code = searchedCodes[index];
                    return ListTile(
                      leading: Text(code.flag!),
                      title: Text(code.country!),
                      subtitle: Text(code.dialCode!),
                      onTap: (){
                        print(code.dialCode);
                        widget.onPicked!(code);
                        widget.onClose!(widget.context);
                      },
                    );
                  },

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void searchThis(String val){
    setState(() {
      searchedCodes = [];
    });
    for(CountryCodeInfo code in allCodes){
      if(code.country!.toLowerCase().startsWith(val)){
        setState(() {
          searchedCodes.add(code);
        });
      }
    }
  }
}
