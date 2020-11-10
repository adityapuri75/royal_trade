import 'package:flutter/material.dart';
import 'package:royaltrade/bloc/binary_id.dart';
import 'package:royaltrade/model/signal_id.dart';
import 'package:royaltrade/widget/binary_signal_widget.dart';

class BinaryOpenSignal extends StatefulWidget {
  @override
  _BinaryOpenSignalState createState() => _BinaryOpenSignalState();
}

class _BinaryOpenSignalState extends State<BinaryOpenSignal> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SignalId>>(
        stream: binaryId.subject.stream,
        builder: (context, snapshot) {
          var id = snapshot.data;
          // getPips(id[0].id);
          return (snapshot.hasData)
              ? ListView.builder(
                  itemBuilder: (context, index) => BinarySignalWidget(id: id[index].id),
                  itemCount: 3,
                )
              /*  ListView(children: [
                  SignalWidget(id: id[0].id),
                  SignalWidget(id: id[1].id),
                  SignalWidget(id: id[2].id)
                ]) */
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}