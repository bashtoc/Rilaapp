// import 'package:flutter/material.dart';
//
//
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//
// import '../models/constants.dart';
//
//
// class Contents extends StatefulWidget {
//   const Contents({Key? key}) : super(key: key);
//
//   @override
//   _ContentsState createState() => _ContentsState();
// }
//
// late YoutubePlayerController controller;
//
//
//
//
// class _ContentsState extends State<Contents> {
//
//   late   YoutubePlayerController  ytController;
//   String url = 'https://www.youtube.com/watch?v=lhBHa8W_H94';
//
//   @override
//   void initState() {
//     ytController = YoutubePlayerController(initialVideoId: YoutubePlayer.convertUrlToId(url).toString());
//     const YoutubePlayerFlags(
//         autoPlay: false,
//         hideControls: true,
//         mute: false,
//         forceHD: false,
//         startAt: 00
//
//
//     );
//     super.initState();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back_ios,
//             color: Colors.black,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           ' videos',
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Wrap(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.only(left: 10, bottom: 10),
//                       child: const CircleAvatar(
//
//                         radius: 15,
//
//                         child: CircleAvatar(
//                           backgroundColor: buttonColor,
//                           backgroundImage: NetworkImage(''),
//                           radius: 43,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Container(
//                         margin: const EdgeInsets.only(bottom: 10),
//                         child: const Text(
//                           'michael adenu',
//                           style: TextStyle(fontSize: 16),
//                         )),
//                   ],
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => const Contents()));
//                   },
//                   child: Container(
//                       margin: const EdgeInsets.only(left: 10, right: 10),
//                       height: 210,
//                       child:   YoutubePlayer(controller: ytController,
//                         showVideoProgressIndicator: true,
//                       ),),
//                 ),
//                 Container(
//                     margin: const EdgeInsets.only(top: 10, left: 10),
//                     child: const Text(
//                       'Title:  Living in manger cause things fall apart',
//                       style: TextStyle(fontSize: 16, ),
//                     )),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }