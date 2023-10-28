import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_store/api/controller_template.dart';
import 'package:music_store/constants/colors.dart';
import 'package:music_store/constants/pages.dart';
import 'package:music_store/global_data/global_data.dart';
import 'package:music_store/widgets/alert.dart';
import 'package:music_store/widgets/input.dart';

class EndPoint extends StatefulWidget {
  const EndPoint({super.key});

  @override
  State<EndPoint> createState() => _EndPointState();
}

class _EndPointState extends State<EndPoint> {
  var addressController = TextEditingController(text: "");
  var portController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 200,
          width: 270,
          child: Column(
            children: [
              Expanded(child: Input(maxLines: 1, hintText: 'address', keyboardType: TextInputType.text, controller: addressController)),
              SizedBox(height: 20,),
              Expanded(child: Input(maxLines: 1, hintText: 'port number', keyboardType: TextInputType.text, controller: portController)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () async
                  {
                    var port = portController.text;
                    var address = addressController.text;
                    var statusCode = await BaseClient().testApi(address+":"+port);
                    if(statusCode==200)
                    {
                      GlobalData data = GlobalData(entry: {"port": port, "address": address});
                      Navigator.pushReplacementNamed(context, HOME);
                    }
                    else if(statusCode != 200)
                    {
                      AlertBox(context: context, child: Container(height: 90, width: 200, child: Center(child: Text("The server is unreacheable !")),));
                    }
                  }, child: Text("Continue", style: TextStyle(color: green),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}