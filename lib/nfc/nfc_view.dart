import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';

/*
Created by Axmadjon Isaqov on 21:15:59 20.09.2023
&© 2023 @axiydev 
*/
class NFCView extends StatefulWidget {
  const NFCView({super.key});

  @override
  State<NFCView> createState() => _NFCViewState();
}

class _NFCViewState extends State<NFCView> {
  String text = 'nfc';
  bool isAvailable = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() async {
    await NfcManager.instance.stopSession();
    super.dispose();
  }

  void startSession() async {
    isAvailable = await NfcManager.instance.isAvailable();
    debugPrint(isAvailable.toString());
    if (isAvailable) {
      NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
        log('NFCSCCCCCCCC');
        debugPrint(tag.data.toString());
        setState(() {
          text = tag.data.toString();
        });
        await NfcManager.instance.stopSession();
      });
    }
  }

  void chackAvailability() async {
    isAvailable = await NfcManager.instance.isAvailable();
    setState(() {});
    debugPrint(isAvailable.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('NFC available - $isAvailable'),
        ),
        body: Center(
          child: Text(text),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton.extended(
                onPressed: () async {
                  text = 'nfc';
                  isAvailable = false;
                  await NfcManager.instance.stopSession();
                  setState(() {});
                },
                label: const Text('stop session')),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton.extended(
                onPressed: chackAvailability, label: const Text('isAvailable')),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton.extended(
                onPressed: startSession, label: const Text('start session'))
          ],
        ));
  }
}
