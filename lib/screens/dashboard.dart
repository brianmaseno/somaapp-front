import 'package:flutter/material.dart';

import 'package:somaapp/widget/category.dart';
import 'package:somaapp/widget/video_widget.dart';



class ChooseCategoryScreen extends StatelessWidget {
  final List<Category> categories = [
    Category(
        name: 'Material',
        iconPath: 'assets/pic1.png',
        quizCount: 21,
        color: Colors.green),
    Category(
        name: 'Sports',
        iconPath: 'assets/pic2.png',
        quizCount: 16,
        color: Colors.blueAccent),
    Category(
        name: 'Music',
        iconPath: 'assets/pic3.png',
        quizCount: 15,
        color: Colors.purpleAccent),
    Category(
        name: 'Science',
        iconPath: 'assets/pic4.png',
        quizCount: 12,
        color: Colors.greenAccent),
    Category(
        name: 'Art',
        iconPath: 'assets/pic5.png',
        quizCount: 18,
        color: Colors.orangeAccent),
    Category(
        name: 'Travel',
        iconPath: 'assets/pic1.png',
        quizCount: 14,
        color: Colors.tealAccent),
    Category(
        name: 'History',
        iconPath: 'assets/pic2.png',
        quizCount: 7,
        color: Colors.brown),
    Category(
        name: 'Tech',
        iconPath: 'assets/pic3.png',
        quizCount: 8,
        color: Colors.cyanAccent),
    Category(
        name: 'Math',
        iconPath: 'assets/pic1.png',
        quizCount: 21,
        color: Colors.green),
    Category(
        name: 'Sports',
        iconPath: 'assets/pic2.png',
        quizCount: 16,
        color: Colors.blueAccent),
    Category(
        name: 'Music',
        iconPath: 'assets/pic3.png',
        quizCount: 15,
        color: Colors.purpleAccent),
    Category(
        name: 'Science',
        iconPath: 'assets/pic4.png',
        quizCount: 12,
        color: Colors.greenAccent),
    Category(
        name: 'Art',
        iconPath: 'assets/pic5.png',
        quizCount: 18,
        color: Colors.orangeAccent),
    Category(
        name: 'Travel',
        iconPath: 'assets/pic1.png',
        quizCount: 14,
        color: Colors.tealAccent),
    Category(
        name: 'History',
        iconPath: 'assets/pic2.png',
        quizCount: 7,
        color: Colors.brown),
    Category(
        name: 'Tech',
        iconPath: 'assets/pic3.png',
        quizCount: 8,
        color: Colors.cyanAccent),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Choose Category'),
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back),
      //     onPressed: () {
      //       // Handle back button press
      //     },
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  "Welcome back, Janey",
                  style: TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontFamily:'Bubblegum'),
                ),
                Spacer(), // Add a spacer to push the avatar to the right
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person),
                ),
              ],
            ),
            SizedBox(height: 12),

            TextField(
              decoration: InputDecoration(
                hintText: 'Search subjects',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey.shade200,
              ),
            ),
            const SizedBox(height: 5),
            // Explore by Categories
            
            Container(
              height: 150,
              child: VideoPlayerScreen(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Explore all your favourite subjects',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily:'Bubblegum'
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('See All'),
                ),
              ],
            ),
            
            const SizedBox(height: 5),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4 / 4,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Add your logic here for when the card is tapped
                    },
                    child: CategoryCard(
                      category: categories[index],
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle next button press
              },
              child: const Text(
                'Next page ',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                backgroundColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
  items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.book),
      label: "Courses",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: "Settings",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_2_rounded),
      label: "Profile",
    ),
  ],
  selectedItemColor: Colors.blue,
  unselectedItemColor: Colors.grey,
  backgroundColor: Colors.white,
  elevation: 5,
  selectedFontSize: 14,
  unselectedFontSize: 12,
  showSelectedLabels: true,
  showUnselectedLabels: true,
  type: BottomNavigationBarType.fixed,
),

    );
  }
}

class CategoryCard extends StatelessWidget {
  final Category category;

  CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle category selection
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 5, 119, 14),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: category.color,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                category.iconPath,
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              category.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${category.quizCount} Quizzes',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
