# 🧮 Calculator App

A clean and intuitive Flutter-based calculator app that allows users to input, evaluate, and interact with mathematical expressions efficiently. It supports basic arithmetic operations, sign toggling, percentages, and provides real-time UI updates using the `Provider` state management package.

---

## ✅ Features

This app’s core logic is built using a `ChangeNotifier`-based `CalculationProvider` which handles:

- ✅ **Number input**: Input and append numbers dynamically
- ✅ **Operator input**: Support for `+`, `−`, `×`, `÷`, `%`, etc.
- ✅ **Decimal input**: Add decimal points intelligently (prevents duplicates)
- ✅ **Sign toggle (`+/-`)**: Convert current number to its negative or positive form
- ✅ **Percentage calculation**: Convert current number into percentage
- ✅ **Expression evaluation**: Evaluate full expressions using the `.interpret()` method from `function_tree`
- ✅ **Clear functionality**: Reset the calculator state using `'C'`
- ✅ **State tracking**: Tracks signs, results, and formatting for a smooth calculation flow

---

## 🚀 Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/RaviYadavO4/calculator_app.git
```
```bash
cd calculator_app
```


2. **Install dependencies:**
```bash
- function_tree: ^0.9.0
-  provider: ^6.1.5
```

3. **Run the app**
```bash
- flutter run
```


## 🛠️ Tech Stack

| Tool/Library   | Purpose                                        |
| -------------- | ---------------------------------------------- |
| Flutter        | UI toolkit for building natively compiled apps |
| Provider       | State management                               |
| function\_tree | Evaluates string-based math expressions        |

## 🧠 State Management Explanation

The app utilizes the Provider package for state management, following the ChangeNotifier pattern. The core logic is encapsulated in the CalculationProvider class, which manages the application's state and notifies listeners about changes.

## 📁 Folder Structure

```text
lib/
│
├── main.dart                    # App entry point
├── providers/
│   └── calculation_provider.dart # Business logic & state handling
├── screens/
│   └── calculator_screen.dart    # Main UI
└── widgets/
    └── calculator_button.dart    # Reusable calculator button widget

```



## 📸 Screenshots

![Calculator Screen](screenshots/calculator_screen.jpeg)


## 📌 Author

**Ravi Yadav**  
🔗 [GitHub Profile](https://github.com/RaviYadavO4)

