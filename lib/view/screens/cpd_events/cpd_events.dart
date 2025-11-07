import 'package:flutter/material.dart';

class CpdEvents extends StatelessWidget {
  const CpdEvents({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
       
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                physics: const BouncingScrollPhysics(),
                children: [],
              ),
            ),
          ],
        ));
  }
}