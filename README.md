# Whitehouse Petitions

An iOS application built with **UIKit** that downloads petitions from a JSON API, displays them in a table view, allows users to search and filter petitions, and shows petition details inside a WKWebView.

## Technologies

- Swift
- UIKit
- UITableViewController
- UINavigationController
- UITabBarController
- UIBarButtonItem
- UIAlertController
- WKWebView
- URLSession / Data(contentsOf:)
- JSON
- Codable
- JSONDecoder
- MVC Architecture
- Auto Layout
- Storyboards



## 📱 Features

- Download petition data from a remote JSON source
- Decode JSON using the Codable protocol
- Display petitions in a UITableView
- View petition details in a WKWebView
- Search and filter petitions by title or body
- Two-tab interface:
  - Recent Petitions
  - Top Rated Petitions
- Credits screen showing the data source
- Error handling with UIAlertController when loading fails


##  Project Structure

```
ViewController
│
├── Downloads JSON
├── Parses data
├── Displays petitions
├── Filters petitions
└── Navigates to DetailViewController

DetailViewController
│
└── Displays petition body using WKWebView
```

<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 16 Pro - 2026-07-24 at 15 06 04" src="https://github.com/user-attachments/assets/9a1b0051-bde8-49aa-89df-bad0967aba56" />
<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 16 Pro - 2026-07-24 at 15 06 22" src="https://github.com/user-attachments/assets/cebf8618-56e8-4d1c-91f1-7293347eddf5" />
<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 16 Pro - 2026-07-24 at 15 06 43" src="https://github.com/user-attachments/assets/76a1fac4-4332-42ad-a8c2-9a03b18e894e" />
<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 16 Pro - 2026-07-24 at 15 06 57" src="https://github.com/user-attachments/assets/fe3735b6-fb11-432d-8f74-bc3e31b98174" />
<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 16 Pro - 2026-07-24 at 15 08 44" src="https://github.com/user-attachments/assets/69de54d9-e66b-4ae1-ae58-41005c6521ac" />





