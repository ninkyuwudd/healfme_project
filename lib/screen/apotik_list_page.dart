import 'package:flutter/material.dart';
import 'package:healthproject/provider/apotik_provider.dart';
import 'package:provider/provider.dart';

class ApotekList extends StatefulWidget {
  const ApotekList({super.key});

  @override
  State<ApotekList> createState() => _ApotekListState();
}

class _ApotekListState extends State<ApotekList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) { 
        final loaddata = Provider.of<ApotekProvider>(context,listen: false);
        loaddata.fetchdataapotek();
    });
  }

  bool display = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("apotek list"),
      ),
      body: display == true
          ? Container(
            height: MediaQuery.of(context).size.height,
            child:  Consumer<ApotekProvider>(
              builder: (context, apotekprovider,_) {
                final showdata = apotekprovider.apotek;
                return ListView.builder(
                  itemCount: showdata.length,
                  itemBuilder: (context, index) {
                    final idxapotik = showdata[index];
                    return ListTile(
                        leading: Text(idxapotik["id"]),
                        title: Text(idxapotik["nama"]),
                      
                    );
                  });
              }
            ),
          )
          : Center(
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      display = true;
                    });
                  },
                  child: Text("load apotek")),
            ),
    );
  }
}
