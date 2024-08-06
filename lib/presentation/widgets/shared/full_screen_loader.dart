import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});


  Stream<String> getLoadingMessages(){
  final messages = <String>[
    'Loading...',
    'Please wait...',
    'Just a moment...',
    'Almost there...',
    'Just a sec...',
  ];
    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          const Text('Loading...'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(),
          const SizedBox(height: 10),
          StreamBuilder(
            stream: getLoadingMessages(),
             builder: (context, snapshot) {
               if(!snapshot.hasData) return const SizedBox();
               return Text(snapshot.data!);
             },)
        ],
      ),
    );
  }
}