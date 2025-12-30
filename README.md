
# 📂 Dart Directory Navigator CLI

A lightweight **Dart command-line tool** designed for **fast, distraction-free directory navigation**.  
It intentionally displays **only folders**, keeping the interface clean and focused while working with project structures.

---

## ✨ Overview

This tool allows you to navigate directories directly from your terminal using a simple, interactive menu.  
By showing **folders only**, it reduces noise and speeds up navigation—ideal for developers working in deeply nested project trees.

The starting directory is configurable, and the tool integrates seamlessly with **VS Code** and the **native file explorer** across major operating systems.

---

## 🚀 Features

- 📁 **Folders-only navigation** (intentional design choice, not a limitation)
    
- 🔢 Enter directories by selecting numbered options
    
- ⬆️ Move to the parent directory
    
- 🖥️ Open the current directory in:
    
    - **VS Code**
        
    - **System file explorer**
        
- 🌈 Color-coded terminal output for clarity and usability
    
- Cross-platform support (Windows, macOS, Linux)
    
- ⚙️ Configurable start path via `config.txt`
    

---

## 🎯 Why Folders Only?

This tool is designed for **navigation**, not file inspection.

By hiding files:

- Navigation is faster
    
- Visual clutter is reduced
    
- Large directories remain readable
    
- Project structure becomes the focus
    

This makes it especially useful for developers browsing codebases or organizing projects.

---

## 🛠 Requirements
    
- **VS Code** installed and available via the `code` command (optional but recommended)
    
- A terminal that supports ANSI colors
    

---

## 📄 Configuration

The tool reads its starting directory from a configuration file.

### Steps:

1. Create a file named **`config.txt`**
    
2. Place it in the **same directory as the Executable File**
    
3. Add the **absolute path** of the starting directory
    

### Example

**Windows**

```
C:\Users\YourName\Projects
```

**macOS / Linux**

```
/home/yourname/projects
```

---



## 🎮 Controls

Once running, the interface displays available subdirectories and command options.

|Input|Action|
|---|---|
|`e`|Exit the program|
|`u`|Go to the parent directory|
|`o`|Open current directory in VS Code|
|`f`|Open current directory in the system file explorer|
|`1, 2, 3, ...`|Enter the selected subdirectory|

---

## 🧠 How It Works

- Reads the start path from `config.txt`
    
- Lists only subdirectories in the current location
    
- Uses a loop-driven menu for navigation
    
- Executes OS-specific commands using Dart’s `Platform` and `Process` APIs
    
- Updates the working directory based on user input
    

---

## ⚠️ Notes

- Files are intentionally hidden to maintain a clean navigation experience
    
- If `config.txt` is missing or the path is invalid, the program exits with an error
    
- VS Code integration requires the `code` command to be available in your PATH