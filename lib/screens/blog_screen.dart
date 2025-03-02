import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../providers/theme_provider.dart';
import '../widgets/common/screen_layout.dart';
import '../widgets/common/neu_card.dart';
import '../widgets/common/neu_button.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenLayout(
      currentRoute: '/blog',
      child: BlogContent(),
    );
  }
}

class BlogContent extends StatefulWidget {
  const BlogContent({super.key});

  @override
  State<BlogContent> createState() => _BlogContentState();
}

class _BlogContentState extends State<BlogContent> {
  final List<BlogPost> _blogPosts = [
    BlogPost(
      title: 'Getting Started with Flutter',
      date: 'May 15, 2024',
      excerpt: 'Learn how to set up your development environment and create your first Flutter app.',
      content: '''
# Getting Started with Flutter

Flutter is Google's UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase. In this blog post, we'll walk through setting up your development environment and creating your first Flutter app.

## Setting Up Your Development Environment

To get started with Flutter, you'll need to install the Flutter SDK and set up your development environment. Here's a step-by-step guide:

1. Download the Flutter SDK from the official website
2. Extract the downloaded file to a location on your computer
3. Add Flutter to your PATH
4. Run `flutter doctor` to verify your installation

## Creating Your First Flutter App

Once your development environment is set up, you can create your first Flutter app using the following steps:

1. Run `flutter create my_first_app` to create a new Flutter project
2. Navigate to the project directory: `cd my_first_app`
3. Open the project in your favorite IDE (VS Code, Android Studio, etc.)
4. Run the app using `flutter run`

## Understanding the Project Structure

A typical Flutter project has the following structure:

- `lib/`: Contains the Dart code for your app
- `android/`: Contains Android-specific code
- `ios/`: Contains iOS-specific code
- `web/`: Contains web-specific code
- `pubspec.yaml`: Contains project dependencies and configuration

## Next Steps

Now that you've created your first Flutter app, you can start exploring Flutter's rich set of widgets and features. Here are some resources to help you get started:

- [Flutter Documentation](https://flutter.dev/docs)
- [Flutter Cookbook](https://flutter.dev/docs/cookbook)
- [Flutter Community](https://flutter.dev/community)

Happy coding!
''',
      imageUrl: 'assets/images/blog1.jpg',
      tags: ['Flutter', 'Dart', 'Mobile Development'],
    ),
    BlogPost(
      title: 'State Management in Flutter',
      date: 'May 22, 2024',
      excerpt: 'Explore different state management solutions in Flutter and learn when to use each one.',
      content: '''
# State Management in Flutter

State management is a crucial aspect of Flutter app development. It determines how your app's data flows and how UI updates in response to user interactions. In this blog post, we'll explore different state management solutions in Flutter and learn when to use each one.

## What is State Management?

In Flutter, state refers to any data that can change over time and affects the UI of your app. State management is the process of managing this data and ensuring that your UI reflects the current state of your app.

## Popular State Management Solutions

### Provider

Provider is a simple yet powerful state management solution that uses the InheritedWidget under the hood. It's a great choice for small to medium-sized apps.

```dart
class CounterProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
```

### Bloc

Bloc (Business Logic Component) is a more advanced state management solution that separates business logic from UI. It's a great choice for large apps with complex state management needs.

```dart
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      yield CounterState(state.count + 1);
    }
  }
}
```

### GetX

GetX is a lightweight and powerful solution that provides state management, dependency injection, and route management. It's known for its simplicity and performance.

```dart
class CounterController extends GetxController {
  var count = 0.obs;

  void increment() {
    count++;
  }
}
```

## Choosing the Right Solution

The choice of state management solution depends on your app's complexity, team size, and personal preference. Here are some guidelines:

- For small apps: Provider or GetX
- For medium-sized apps: Provider, GetX, or Bloc
- For large apps: Bloc or GetX

## Conclusion

State management is a crucial aspect of Flutter app development. By choosing the right state management solution, you can make your app more maintainable, testable, and scalable.

Happy coding!
''',
      imageUrl: 'assets/images/blog2.jpg',
      tags: ['Flutter', 'State Management', 'Provider', 'Bloc', 'GetX'],
    ),
    BlogPost(
      title: 'Creating Beautiful UI with Flutter',
      date: 'May 29, 2024',
      excerpt: 'Learn how to create beautiful and responsive user interfaces in Flutter using widgets and themes.',
      content: '''
# Creating Beautiful UI with Flutter

Flutter provides a rich set of widgets and tools for creating beautiful and responsive user interfaces. In this blog post, we'll explore how to create stunning UIs in Flutter using widgets, themes, and animations.

## Understanding Flutter Widgets

Widgets are the building blocks of Flutter UIs. Everything in Flutter is a widget, from a simple button to a complex screen. Here are some commonly used widgets:

- **Text**: Displays text with various styles
- **Container**: A box that can be decorated
- **Row/Column**: Arranges children horizontally/vertically
- **Stack**: Overlays children on top of each other
- **ListView**: Displays a scrollable list of widgets

## Theming Your App

Flutter provides a powerful theming system that allows you to customize the look and feel of your app. You can define a theme for your entire app and override it for specific widgets.

```dart
ThemeData(
  primaryColor: Colors.blue,
  accentColor: Colors.blueAccent,
  fontFamily: 'Roboto',
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
  ),
)
```

## Creating Responsive UIs

Flutter makes it easy to create responsive UIs that adapt to different screen sizes. You can use the `MediaQuery` class to get the screen size and adjust your UI accordingly.

```dart
final screenWidth = MediaQuery.of(context).size.width;
final isTablet = screenWidth > 600;

return isTablet
    ? TabletLayout()
    : MobileLayout();
```

## Adding Animations

Animations can make your UI more engaging and intuitive. Flutter provides several ways to add animations to your app:

- **AnimatedContainer**: Animates changes to a container's properties
- **AnimatedOpacity**: Animates changes to a widget's opacity
- **Hero**: Creates a hero animation between screens
- **AnimationController**: Provides fine-grained control over animations

## Conclusion

Flutter provides a powerful set of tools for creating beautiful and responsive user interfaces. By mastering widgets, themes, responsive design, and animations, you can create stunning UIs that delight your users.

Happy coding!
''',
      imageUrl: 'assets/images/blog3.jpg',
      tags: ['Flutter', 'UI/UX', 'Widgets', 'Themes', 'Animations'],
    ),
  ];

  BlogPost? _selectedPost;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return _selectedPost == null
        ? _buildBlogList(themeProvider, isMobile)
        : _buildBlogDetail(themeProvider, isMobile);
  }

  Widget _buildBlogList(ThemeProvider themeProvider, bool isMobile) {
    return Column(
      children: [
        Center(
          child: Text(
            'Blog',
            style: TextStyle(
              color: themeProvider.textColor,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: Text(
            'Thoughts, stories and ideas about Flutter development',
            style: TextStyle(
              color: themeProvider.textColor.withOpacity(0.8),
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 40),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _blogPosts.length,
          itemBuilder: (context, index) {
            final post = _blogPosts[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: _buildBlogCard(themeProvider, post, isMobile),
            );
          },
        ),
      ],
    );
  }

  Widget _buildBlogCard(ThemeProvider themeProvider, BlogPost post, bool isMobile) {
    return NeuCard(
      height: isMobile ? 0.0 : 240.0,
      onTap: () {
        setState(() {
          _selectedPost = post;
        });
      },
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: themeProvider.accentColor.withOpacity(0.1),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.article,
                      size: 80,
                      color: themeProvider.accentColor.withOpacity(0.5),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.date,
                        style: TextStyle(
                          color: themeProvider.textColor.withOpacity(0.6),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        post.title,
                        style: TextStyle(
                          color: themeProvider.textColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        post.excerpt,
                        style: TextStyle(
                          color: themeProvider.textColor.withOpacity(0.8),
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: post.tags.map((tag) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: themeProvider.accentColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              tag,
                              style: TextStyle(
                                color: themeProvider.accentColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 16),
                      NeuButton(
                        onPressed: () {
                          setState(() {
                            _selectedPost = post;
                          });
                        },
                        child: Text(
                          'Read More',
                          style: TextStyle(
                            color: themeProvider.textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: themeProvider.accentColor.withOpacity(0.1),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.article,
                        size: 80,
                        color: themeProvider.accentColor.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.date,
                          style: TextStyle(
                            color: themeProvider.textColor.withOpacity(0.6),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          post.title,
                          style: TextStyle(
                            color: themeProvider.textColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          post.excerpt,
                          style: TextStyle(
                            color: themeProvider.textColor.withOpacity(0.8),
                            fontSize: 16,
                            height: 1.5,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: post.tags.map((tag) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: themeProvider.accentColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text(
                                      tag,
                                      style: TextStyle(
                                        color: themeProvider.accentColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            const SizedBox(width: 16),
                            NeuButton(
                              onPressed: () {
                                setState(() {
                                  _selectedPost = post;
                                });
                              },
                              child: Text(
                                'Read More',
                                style: TextStyle(
                                  color: themeProvider.textColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildBlogDetail(ThemeProvider themeProvider, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NeuButton(
          onPressed: () {
            setState(() {
              _selectedPost = null;
            });
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.arrow_back,
                color: themeProvider.textColor,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                'Back to Blog',
                style: TextStyle(
                  color: themeProvider.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        Center(
          child: Text(
            _selectedPost!.title,
            style: TextStyle(
              color: themeProvider.textColor,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: Text(
            _selectedPost!.date,
            style: TextStyle(
              color: themeProvider.textColor.withOpacity(0.6),
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Center(
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: _selectedPost!.tags.map((tag) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: themeProvider.accentColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  tag,
                  style: TextStyle(
                    color: themeProvider.accentColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 40),
        Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
            color: themeProvider.accentColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Icon(
              Icons.article,
              size: 120,
              color: themeProvider.accentColor.withOpacity(0.5),
            ),
          ),
        ),
        const SizedBox(height: 40),
        NeuCard(
          padding: const EdgeInsets.all(24),
          child: MarkdownBody(
            data: _selectedPost!.content,
            styleSheet: MarkdownStyleSheet(
              h1: TextStyle(
                color: themeProvider.textColor,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
              h2: TextStyle(
                color: themeProvider.textColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
              h3: TextStyle(
                color: themeProvider.textColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
              p: TextStyle(
                color: themeProvider.textColor.withOpacity(0.8),
                fontSize: 16,
                height: 1.7,
              ),
              listBullet: TextStyle(
                color: themeProvider.accentColor,
                fontSize: 16,
              ),
              code: TextStyle(
                color: themeProvider.accentColor,
                fontSize: 14,
                fontFamily: 'monospace',
                backgroundColor: themeProvider.accentColor.withOpacity(0.1),
              ),
              blockSpacing: 16.0,
              blockquote: TextStyle(
                color: themeProvider.textColor.withOpacity(0.7),
                fontSize: 16,
                height: 1.7,
                fontStyle: FontStyle.italic,
              ),
              blockquoteDecoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: themeProvider.accentColor,
                    width: 4,
                  ),
                ),
              ),
              blockquotePadding: const EdgeInsets.only(left: 16),
            ),
          ),
        ),
        const SizedBox(height: 40),
        Center(
          child: NeuButton(
            onPressed: () {
              setState(() {
                _selectedPost = null;
              });
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.arrow_back,
                  color: themeProvider.textColor,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Text(
                  'Back to Blog',
                  style: TextStyle(
                    color: themeProvider.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BlogPost {
  final String title;
  final String date;
  final String excerpt;
  final String content;
  final String imageUrl;
  final List<String> tags;

  BlogPost({
    required this.title,
    required this.date,
    required this.excerpt,
    required this.content,
    required this.imageUrl,
    required this.tags,
  });
} 