# 🌓 change_theme_er - Animated Theme Changer for Flutter
[![GitHub Repo stars](https://img.shields.io/github/stars/Developeryilmaz/change_theme_er?style=social)](https://github.com/Developeryilmaz/change_theme_er)
[![Pub Version](https://img.shields.io/pub/v/change_theme_er)](https://pub.dev/packages/change_theme_er)
[![GitHub issues](https://img.shields.io/github/issues/Developeryilmaz/change_theme_er)](https://github.com/Developeryilmaz/change_theme_er/issues)
[![License](https://img.shields.io/github/license/Developeryilmaz/change_theme_er)](LICENSE)

🚀 **A high-performance, customizable theme changer package for Flutter.**  
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


# Provide download link
https://github.com/Developeryilmaz/change_theme_er
