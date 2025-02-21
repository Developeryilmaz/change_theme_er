## 🌓  change_theme_er - Theme Changer for Flutter

---

[![GitHub Repo stars](https://img.shields.io/github/stars/Developeryilmaz/change_theme_er?style=social)](https://github.com/Developeryilmaz/change_theme_er)
[![Pub Version](https://img.shields.io/pub/v/change_theme_er)](https://pub.dev/packages/change_theme_er)
[![GitHub issues](https://img.shields.io/github/issues/Developeryilmaz/change_theme_er)](https://github.com/Developeryilmaz/change_theme_er/issues)
[![License: MIT](https://img.shields.io/github/license/Developeryilmaz/change_theme_er)](LICENSE)
[![Contributors](https://img.shields.io/github/contributors/Developeryilmaz/change_theme_er)](https://github.com/Developeryilmaz/change_theme_er/graphs/contributors)
[![Forks](https://img.shields.io/github/forks/Developeryilmaz/change_theme_er)](https://github.com/Developeryilmaz/change_theme_er/network/members)
[![Last Commit](https://img.shields.io/github/last-commit/Developeryilmaz/change_theme_er)](https://github.com/Developeryilmaz/change_theme_er)
[![Open PRs](https://img.shields.io/github/issues-pr/Developeryilmaz/change_theme_er)](https://github.com/Developeryilmaz/change_theme_er/pulls)
[![Closed PRs](https://img.shields.io/github/issues-pr-closed/Developeryilmaz/change_theme_er)](https://github.com/Developeryilmaz/change_theme_er/pulls?q=is%3Apr+is%3Aclosed)
[![GitHub Discussions](https://img.shields.io/github/discussions/Developeryilmaz/change_theme_er)](https://github.com/Developeryilmaz/change_theme_er/discussions)
[![GitHub Releases](https://img.shields.io/github/v/release/Developeryilmaz/change_theme_er)](https://github.com/Developeryilmaz/change_theme_er/releases)
[![GitHub Repo Size](https://img.shields.io/github/repo-size/Developeryilmaz/change_theme_er)](https://github.com/Developeryilmaz/change_theme_er)
[![GitHub Code Size](https://img.shields.io/github/languages/code-size/Developeryilmaz/change_theme_er)](https://github.com/Developeryilmaz/change_theme_er)
[![GitHub Top Language](https://img.shields.io/github/languages/top/Developeryilmaz/change_theme_er)](https://github.com/Developeryilmaz/change_theme_er)
[![GitHub Language Count](https://img.shields.io/github/languages/count/Developeryilmaz/change_theme_er)](https://github.com/Developeryilmaz/change_theme_er)
[![GitHub Commit Activity](https://img.shields.io/github/commit-activity/m/Developeryilmaz/change_theme_er)](https://github.com/Developeryilmaz/change_theme_er)
[![Issues Closed](https://img.shields.io/github/issues-closed/Developeryilmaz/change_theme_er)](https://github.com/Developeryilmaz/change_theme_er/issues?q=is%3Aissue+is%3Aclosed)
[![GitHub Watchers](https://img.shields.io/github/watchers/Developeryilmaz/change_theme_er?style=social)](https://github.com/Developeryilmaz/change_theme_er)
[![GitHub Sponsors](https://img.shields.io/github/sponsors/Developeryilmaz)](https://github.com/sponsors/Developeryilmaz)
[![GitHub Repo Views](https://komarev.com/ghpvc/?username=Developeryilmaz&color=blue)](https://github.com/Developeryilmaz/change_theme_er)
[![GitHub Stars](https://img.shields.io/github/stars/Developeryilmaz/change_theme_er?label=Stars&style=plastic)](https://github.com/Developeryilmaz/change_theme_er/stargazers)
[![GitHub Followers](https://img.shields.io/github/followers/Developeryilmaz?style=social)](https://github.com/Developeryilmaz)
[![Twitter Follow](https://img.shields.io/twitter/follow/YILMAZE58?style=social)](https://x.com/YILMAZE58)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Developeryilmaz-blue?logo=linkedin)](https://www.linkedin.com/in/Developeryilmaz)
[![Reddit](https://img.shields.io/reddit/user-karma/combined/Fit-Contribution-731?label=Reddit)](https://www.reddit.com/user/Fit-Contribution-731)

---

## 🚀 **A high-performance, customizable theme changer package for Flutter.**  
🌟 **Smooth transitions, Bloc-powered state management, and GetIt dependency injection.**

---

## 📌 **📸 Demo & Screenshots**
| Light Mode | Dark Mode |
|------------|----------|
| <img src="https://github.com/Developeryilmaz/change_theme_er/blob/main/doc/light.jpeg?raw=true" width="300"> |  <img src="https://github.com/Developeryilmaz/change_theme_er/blob/main/doc/dark.jpeg?raw=true" width="300"> |

<!-- 🎥 **[Watch the Demo Video](https://youtu.be/demo_video_link)** -->

---

## 🌟 **Features**
✔ **Smooth theme transitions with animation**  
✔ **Bloc-powered for optimized performance**  
✔ **GetIt for dependency management**  
✔ **Hive for instant theme persistence**  
✔ **Supports Light/Dark mode with smooth transitions**  
✔ **Highly customizable UI**  

---

## 📌 **Installation**
```yaml
dependencies:
  change_theme_er: latest_version
```
Then run:
```sh
flutter pub get
```

---

## 📌 **Usage**
### **1️⃣ Initialize Dependencies**
```dart
import 'package:change_theme_er/change_theme_er.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
}
```

### **2️⃣ Use Bloc for Theme Management**
```dart
BlocProvider(
  create: (context) => sl<ThemeBloc>()..add(LoadTheme()),
  child: MyApp(),
);
```

### **3️⃣ Animated Theme Switch Button**
```dart
GestureDetector(
  onTap: () {
    context.read<ThemeBloc>().add(ToggleTheme());
  },
  child: CustomSwitchButton(),
);
```

---

## 📌 **API Reference**
| Method | Description |
|--------|------------|
| `setupLocator()` | Initializes Hive and GetIt dependencies |
| `ThemeBloc` | Manages theme state using Bloc |
| `ToggleTheme()` | Toggles between Light and Dark mode |

---

## 📌 **File Structure**
The `change_theme_er` package follows a **Clean Code architecture**:
```
change_theme_er/
│── lib/
│   │── change_theme_er.dart
│   ├── src/
│   │   ├── core/
│   │   │   ├── di/
│   │   │   │   └── service_locator.dart
│   │   │   ├── theme_repository.dart
│   │   ├── presentation/
│   │   │   ├── bloc/
│   │   │   │   ├── theme_bloc.dart
│   │   │   │   ├── theme_event.dart
│   │   │   │   ├── theme_state.dart
│── example/
│   │── lib/main.dart
│── pubspec.yaml
│── README.md
│── CHANGELOG.md
│── LICENSE
```

---

## 📌 **How It Works**
The package **uses Bloc for state management** and **Hive for persistent storage**.  
Here’s how the theme switching works under the hood:

1️⃣ **User taps the switch button.**  
2️⃣ **Bloc event `ToggleTheme()` is triggered.**  
3️⃣ **Bloc updates the state (`Light Mode ↔ Dark Mode`).**  
4️⃣ **Hive saves the user's theme preference for future sessions.**  

---

## 📌 **Roadmap**
🎯 **Upcoming Features:**  
- [ ] **Custom Animated Transitions**  
- [ ] **Adaptive Themes based on Time of Day**  
- [ ] **Material You Support (Dynamic Colors)**  

---

## 📌 **Contribution**
We welcome contributions!  

📌 For feature requests or bug reports, [open an issue](https://github.com/Developeryilmaz/change_theme_er/issues).

---

## 📌 **License & Contact**
This project is licensed under **Pharrax Software - YILMAZ ER**.  
For licensing information, please contact:  
📩 **Email:** [yilmazer@pharraxsoftware.com](mailto:yilmazer@pharraxsoftware.com)  

---

## 📌 **Support the Project**
If you like this package, please **give it a ⭐ on GitHub** and **[like it on pub.dev](https://pub.dev/packages/change_theme_er)**!  
🚀 **Your support helps us improve and add more features.**
"""


## Provide download link
https://github.com/Developeryilmaz/change_theme_er


## Languages Used
![Dil Dağılımı](https://github.com/Developeryilmaz/main/raw/main/doc/language.png)
