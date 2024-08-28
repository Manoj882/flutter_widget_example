

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MyWebSite extends StatefulWidget {
  const MyWebSite({super.key});

  @override
  State<MyWebSite> createState() => _MyWebSiteState();
}

class _MyWebSiteState extends State<MyWebSite> {
  double _progress = 0;
  late InAppWebViewController _inAppWebViewController;




@override
  void dispose() {
    _inAppWebViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
  
      onPopInvoked: (didPop) async{
        final isLastPage = await _inAppWebViewController.canGoBack();

        if(didPop){
          return;
        }


        if(isLastPage){
          await _inAppWebViewController.goBack();
          return;
      
        } 

        if(context.mounted){
          Navigator.pop(context);
        }
        
    
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('In App Website'),
          ),
        
          body: Stack(
            children: [
              InAppWebView(
                initialUrlRequest: URLRequest(
                  url: WebUri('https://protocoderspoint.com'),
                ),

                initialSettings: InAppWebViewSettings(
                  allowsBackForwardNavigationGestures: false,
                ),
                onWebViewCreated: (controller){
                  _inAppWebViewController = controller;
                },
                onProgressChanged: (controller, progess){
                  setState(() {
                    _progress = progess / 100;
                  });
                },
              ),
        
              _progress < 1 ? const LinearProgressIndicator()
              : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}