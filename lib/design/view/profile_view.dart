import 'package:flutter/material.dart';
import 'package:project_app/constants/icon_broken.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: SizedBox(
                height: 200,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        const CircleAvatar(
                          radius: 68,
                          backgroundColor: Colors.grey,
                          child: CircleAvatar(
                            radius: 67,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 63,
                              backgroundColor: Colors.grey,
                              child: CircleAvatar(
                                  radius: 62,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 59,
                                    backgroundImage: AssetImage(
                                        'assets/images/WhatsApp Image 2024-03-14 at 23.00.08_d294abd2.jpg'),
                                  )),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 14,
                              child: Icon(
                                IconBroken.Camera,
                                color: Colors.white,
                                size: 18,
                              ),
                            )),
                      ],
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Ahmed Magdy',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'bebo332002@gmail.com',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

  // Stack(
  //                           alignment: Alignment.bottomRight,
  //                           children: [
  //                             CircleAvatar(
  //                               backgroundColor: Colors.white,
  //                               radius: 64,
  //                               child: customCircleAvatar(
  //                                 radius: 60,
  //                                 backgroundImage: profileImage == null
  //                                     ? NetworkImage(
  //                                         userModel.image,
  //                                       )
  //                                     : FileImage(profileImage),
  //                               ),
  //                             ),
  //                             IconButton(
  //                                 onPressed: () {
  //                                   BlocProvider.of<MainSocialCubit>(context)
  //                                       .getProfileImage();
  //                                 },
  //                                 icon: const CircleAvatar(
  //                                   backgroundColor: Colors.blue,
  //                                   radius: 20,
  //                                   child: Icon(
  //                                     IconBroken.Camera,
  //                                     size: 20,
  //                                   ),
  //                                 )),
  //                           ],