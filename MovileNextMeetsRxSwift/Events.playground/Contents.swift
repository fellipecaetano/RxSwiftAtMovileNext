//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class EventsViewController : UIViewController {
    // Text field
    private let textFieldLabel: UILabel = {
        let label = UILabel()
        label.text = "Text field"
        return label
    }()

    private let textField = UITextField()

    // Button
    private let buttonLabel: UILabel = {
        let label = UILabel()
        label.text = "Button"
        return label
    }()

    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Button", for: [])
        return button
    }()

    // Slider
    private let sliderLabel: UILabel = {
        let label = UILabel()
        label.text = "Slider"
        return label
    }()

    private let slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 1000
        return slider
    }()

    override func loadView() {
        createView()
    }

    private func createView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = EventsViewController()
