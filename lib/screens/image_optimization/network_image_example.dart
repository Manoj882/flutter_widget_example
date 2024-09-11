import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_example/screens/image_optimization/image_example.dart';

class NetworkImageExample extends StatelessWidget {
  const NetworkImageExample({super.key});

  @override
  Widget build(BuildContext context) {
    final  displayWidth = MediaQuery.of(context).size.width;
    final displayHeight = MediaQuery.of(context).size.height- MediaQuery.of(context).padding.top - kToolbarHeight - MediaQuery.of(context).padding.bottom;

    print('display heightL $displayHeight');


    bool isFullScreen = true;


    //  const imageUrl =
    //     'https://www.themoviedb.org/t/p/original/rZy9EJaRmESKjEMz5XgG81jZloS.jpg';

  //const imageUrl = 'https://cdn.pixabay.com/photo/2021/08/02/00/10/flowers-6515538_640.jpg';

   // const imageUrl = 'https://unblast.com/wp-content/uploads/2021/01/Space-Background-Images.jpg';

  //const imageUrl = 'https://suzukimotorcycle.com.np/wp-content/uploads/2021/09/Suzuki-Dashain-Offer-1.jpeg';

//const imageUrl = 'https://honda.com.np/wp-content/uploads/2022/09/honda-dashain-tihar-2079-1024x485.jpg';

 const imageUrl = 'https://staging4.mypay.com.np/Images/BannerImages/dashaincampaign.png';

   

    return Scaffold(
      appBar: AppBar(
        title: const Text('Network Image Example'),
      ),
      // body: Center(
      

      //   child:  isFullScreen
      //   ? CachedNetworkImage(imageUrl: imageUrl, 
      //   width: displayWidth,
      //   height: displayHeight,
      //   memCacheWidth: displayWidth.cacheSize(context),
      //   memCacheHeight: displayHeight.cacheSize(context),
      //   fit: BoxFit.cover,
               
        
      //   )

      //  :  CachedNetworkImage(
      //     imageUrl: imageUrl,
      //     width: displayWidth,
      //     height: displayHeight,
      //    memCacheWidth: displayWidth.cacheSize(context),
      //    fit: BoxFit.scaleDown,
      //  //memCacheHeight: displayHeight.cacheSize(context),
      //    //fit: BoxFit.contain,
      //     // memCacheHeight: ,
      //   ),
      // ),
    
    

    body: SvgPicture.network(
      imageUrl,
      width: displayWidth,
      height: displayHeight,

    ),
    
    );
  }
}
