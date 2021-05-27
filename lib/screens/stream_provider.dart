import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streamprovider_flutter_app/model/burger.dart';

class MyStreamProvider extends StatefulWidget {
  const MyStreamProvider({Key? key}) : super(key: key);

  @override
  _MyStreamProviderState createState() => _MyStreamProviderState();
}

class _MyStreamProviderState extends State<MyStreamProvider> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CheeseBurger>(
      initialData: CheeseBurger(orderABurger: 0),
      create: (context)=>getStreamOfMyModel(),
      child: Scaffold(
        appBar: AppBar(title: Text('StreamProvider Home Page'),centerTitle: true,),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(35),
                child: Consumer<CheeseBurger>(
                  builder: (context,burger,child){
                    return Text('You ordered ${burger.orderABurger} Cheeseburger.',style: TextStyle(fontSize: 24),);
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.red[200],
                child: Consumer<CheeseBurger>(
                  builder: (context,burger,child){
                    return RaisedButton(
                      child: Text('Check Cheeseburgers'),
                      onPressed: (){
                        burger.orderSomeCheeseburger();
                        ScaffoldMessenger.of(context)
                          ..removeCurrentSnackBar()
                          ..showSnackBar(SnackBar(content: Text('Your order ${burger.orderABurger} Cheeseburger.')));
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
}
Stream<CheeseBurger> getStreamOfMyModel() { //                        <--- Stream
  return Stream<CheeseBurger>.periodic(Duration(seconds: 1),
          (x) => CheeseBurger(orderABurger: x))
      .take(10);
}