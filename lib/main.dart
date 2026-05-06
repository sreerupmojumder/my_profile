import 'package:flutter/material.dart';
import 'package:habit_tracker/my_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker',
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: const Color.fromARGB(255, 58, 121, 183),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Habit'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final isProtrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    List<Widget> habitCards = [
      HabitCard(
        icon: Icons.water_drop,
        title: 'Drink Water',
        subtitle: 'Drink 8 glasses of water',
        streakCount: 3,
      ),
      //meditation
      HabitCard(
        icon: Icons.self_improvement,
        title: 'Meditation',
        subtitle: '10 minutes',
        streakCount: 5,
      ),

      //sleep
      HabitCard(
        icon: Icons.bedtime,
        title: 'Sleep',
        subtitle: '7-8 hours',
        streakCount: 2,
      ),

      //exercise
      HabitCard(
        icon: Icons.fitness_center,
        title: 'Exercise',
        subtitle: '30 minutes',
        streakCount: 4,
      ),

      //reading
      HabitCard(
        icon: Icons.book,
        title: 'Reading',
        subtitle: 'Read 20 pages',
        streakCount: 6,
      ),

      //journaling
      HabitCard(
        icon: Icons.edit,
        title: 'Journaling',
        subtitle: 'Write for 10 minutes',
        streakCount: 1,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // add trailing settings icon
        actions: [
          IconButton(
            onPressed: () {
              // Open Profile Page
             Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyProfile()),
              );

            },
            icon: Icon(Icons.person),
          ),
        ],
        title: Text(title),
        elevation: 1,
      ),
      //Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new habit
        },
        shape: CircleBorder(),
        backgroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              if (isProtrait) ...[Column(spacing: 16, children: habitCards)],
              if (!isProtrait) ...[
                for (var i = 0; i < habitCards.length; i += 2)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),

                    child: Row(
                      children: [
                        Expanded(child: habitCards[i]),

                        const SizedBox(width: 16),

                        if (i + 1 < habitCards.length)
                          Expanded(child: habitCards[i + 1])
                        else
                          const Expanded(child: SizedBox()),
                      ],
                    ),
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class HabitCard extends StatelessWidget {
  HabitCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.streakCount,
  });
  IconData icon;
  final String title;
  final String subtitle;
  final int streakCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Add logo
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: Icon(icon, color: Colors.black, size: 40),
              ),

              SizedBox(width: 16),
              // Add title & subtitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          // Streak Counter
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                streakCount.toString(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 4),
              Text('Streak', style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ],
      ),
    );
  }
}
