import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 103, 57, 212),
        title: Text('My Profile', style: TextStyle(color: Colors.white)),
        // add title in app bar centered
        centerTitle: true,
        elevation: 1,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Column(
            children: [
              //Profile section
              Column(
                spacing: 5,
                mainAxisAlignment: .center,
                children: [
                  //profile picture
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.white, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 1,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),

                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://scontent.fdac169-1.fna.fbcdn.net/v/t39.30808-6/503745110_4228525247383185_2849423798390204576_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=53a332&_nc_eui2=AeELg8U4L-OH4YT6-yrskS4cDkJYJd_LaWsOQlgl38tpa_zDAXCGN1dgMZfa25QYgZzeU4ZIOi0onKoEGYEGoWPg&_nc_ohc=jtPh_ChYamMQ7kNvwF4MozV&_nc_oc=Adq7UwRETjZWaXKWsLh0PEg0h-WTDm64VpVcva7eUbxFY9Ilg1iNqF9ppx6T-OOkdIM&_nc_zt=23&_nc_ht=scontent.fdac169-1.fna&_nc_gid=1kmRAvLQJeq9MvMthDUtOQ&_nc_ss=7b2a8&oh=00_Af6-UOOQZOmSlh-ebMS1MwOIjFByS97GERPdLSnIOxyoQA&oe=6A014B9C',
                      ),
                    ),
                  ),
                  //profile name
                  Text(
                    'Sreerup Mojumder',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  //profile bio
                  Text(
                    'Flutter Beginner & Future App Developer',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 103, 57, 212),
                    ),
                  ),

                  //profile short description
                  Text(
                    'I love building mobile apps with Flutter.\nLearning new things every day and enjoying the journey!',
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: 20),
              //Information cards
              //Location
              InfoCard(
                BgColor: Colors.deepPurple.shade50,
                icon: Icons.location_on,
                title: 'Location',
                subtitle: 'Dhaka, Bangladesh',
                iconTitleColor: Colors.deepPurple,
              ),
              SizedBox(height: 8),
              //Education
              InfoCard(
                BgColor: Colors.lightGreen.shade50,
                icon: Icons.school,
                title: 'Education',
                subtitle: 'BSc in Computer Science',
                iconTitleColor: Colors.lightGreen,
              ),

              SizedBox(height: 8),
              //Skills
              InfoCard(
                BgColor: Colors.lightBlue.shade50,
                icon: Icons.code,
                iconTitleColor: Colors.lightBlue,
                title: 'Skill',
                subtitle: 'Flutter, Dart, Firebase, Git,\n REST API, HTML, CSS',
              ),

              //Social media links
              //facebook
              //github
              //email
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final Color BgColor;
  final IconData icon;
  final Color iconTitleColor;
  final String title;
  final String subtitle;

  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.BgColor,
    required this.iconTitleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: BgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: iconTitleColor,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(8),
              child: Icon(icon, color: Colors.white),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: iconTitleColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(subtitle, style: TextStyle(fontSize: 10)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
