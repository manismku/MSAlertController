# MSAlertController
[![Language](https://img.shields.io/badge/Swift-4-orange.svg)]()
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)


MSAlertController is a light alert controller which is inspired by Apple own message and notfication alert view.

<img src="https://user-images.githubusercontent.com/757725/38765448-45346482-3fdf-11e8-8166-809cec40dfd3.gif" width="320" height="568"> <img src="https://user-images.githubusercontent.com/757725/38771061-d990ef74-4039-11e8-806f-6c22bdc2b35d.gif" >

# Features
  - [x] Create simple alert/reminder to inform user with side-view configured
  - [x] Use side view as second view for extra information
  - [x] Add your own view inside side view (see API)
  - [x] Create actionable alert and attach closure based action buttons
  - [x] Attach upto three buttons in action sheet for action
  - [x] Title
  - [x] Description message
  - [x] Customizations: Create your own theme - title font, title font color, body font & color - to change appearance
  - [x] UIKit interactive animation
  - [x] Carthage
 
  

And of course MSAlertController itself is open source.

## Requirements

- iOS 9.0+
- Xcode 9+
- Swift 4.0+

## Installation
### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate MSAlertController into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "manismku/MSAlertController" ~> 1.0
```

Run `carthage update` to build the framework and drag the built `MSAlertController.framework` into your Xcode project.

## Manually
----------------
1. Download and drop ```/Library``` folder in your project.  
2. Congratulations!

## Usage
----------------
The usage is very similar to `UIAlertController`.
`MSAlertController` has currently two styles: Default & NoAction.

**Default:** with this style, alert view gives upto 3 action to submit when user side(left) scrolls

**NoAction:** with Noaction, in this mode it will act as simple informative alert and side view can hold extra information 

#### Show a simple default alert with two action associated

```swift
        let alertVC = MSAlertController(title: "NEARME", message: "You are near Fisherman's Wharf.")
        let viewAction = MSAlertAction(title: "Open Map") {
            [weak self] in
            self?.dismiss(animated: true, completion: nil)
        }
        let cameraAction = MSAlertAction(title: "Take Photo") {
            [weak self] in            
            self?.actionLaunchCamera()
        }
        alertVC.addAction(action: viewAction)
        alertVC.addAction(action: cameraAction)
        self.present(alertVC, animated: false, completion: nil)
```
#### Show alert with custom style
```swift
         let alertVC = MSAlertController(title: "NEARME", message: "You are near Fisherman's Wharf.", 
                                         theme: { () -> Appearance in
                                                  let theme = Appearance.createTheme(theme: .grey)
                                                  return theme 
                                          })
        let viewAction = MSAlertAction(title: "Open Map") {
            [weak self] in
            self?.dismiss(animated: true, completion: nil)
        }
        let cameraAction = MSAlertAction(title: "Take Photo") {
            [weak self] in            
            self?.actionLaunchCamera()
        }
        alertVC.addAction(action: viewAction)
        alertVC.addAction(action: cameraAction)
        self.present(alertVC, animated: false, completion: nil)
```
#### Show a NoAction alert with side view as an image
```swift
        let alertVC = MSAlertController(title: "MESSAGE", message: "Hey!! Let's meet at Market-Square.",
                                        sideView: UIImageView.init(image: UIImage(named: "avatar")), 
                                        style: .NoAction)
        self.present(alertVC, animated: false, completion: nil)
```
### Todos

 - More styles
 - More themes

## Contributing

- If you **need help** or you'd like to **ask a general question**, open an issue.
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## Acknowledgements
Made with ❤️ by [Manish Kumar](https://medium.com/@manismku)
The design is inspired by Apple own message and notfication.

## MIT License
----------------
MSAlertController is available under the MIT license. See the [LICENSE](https://github.com/manismku/MSAlertController/blob/master/LICENSE) file for more info.


