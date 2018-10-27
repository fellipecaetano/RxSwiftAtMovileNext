import UIKit

class EventsViewController : UIViewController {
    // Output
    private let outputTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Output"
        return textField
    }()

    // Text field
    private let textFieldLabel: UILabel = {
        let label = UILabel()
        label.text = "Text field"
        return label
    }()

    private let textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        return textField
    }()

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
        addSubviews()
        createConstraints()
    }

    private func createView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
    }

    private func addSubviews() {
        // Output
        view.addSubview(outputTextField)

        // Text field
        view.addSubview(textFieldLabel)
        view.addSubview(textField)

        // Button
        view.addSubview(buttonLabel)
        view.addSubview(button)

        // Slider
        view.addSubview(sliderLabel)
        view.addSubview(slider)
    }

    private func createConstraints() {
        // Output text field
        NSLayoutConstraint.activate([
            outputTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8),
            outputTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            outputTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8)
        ])

        outputTextField.translatesAutoresizingMaskIntoConstraints = false

        // Text field label
        NSLayoutConstraint.activate([
            textFieldLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8),
            textFieldLabel.topAnchor.constraint(equalTo: outputTextField.bottomAnchor, constant: 48),
            textFieldLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8)
        ])

        textFieldLabel.translatesAutoresizingMaskIntoConstraints = false

        // Text field
        NSLayoutConstraint.activate([
            textField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8),
            textField.topAnchor.constraint(equalTo: textFieldLabel.bottomAnchor, constant: 4),
            textField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8)
        ])

        textField.translatesAutoresizingMaskIntoConstraints = false

        // Button label
        NSLayoutConstraint.activate([
            buttonLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8),
            buttonLabel.topAnchor.constraint(equalTo: textField.safeAreaLayoutGuide.bottomAnchor, constant: 32),
            buttonLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8)
        ])

        buttonLabel.translatesAutoresizingMaskIntoConstraints = false

        // Button
        NSLayoutConstraint.activate([
            button.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8),
            button.topAnchor.constraint(equalTo: buttonLabel.bottomAnchor, constant: 4),
            button.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8)
        ])

        button.translatesAutoresizingMaskIntoConstraints = false

        // Slider label
        NSLayoutConstraint.activate([
            sliderLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8),
            sliderLabel.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 32),
            sliderLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8)
        ])

        sliderLabel.translatesAutoresizingMaskIntoConstraints = false

        // Slider
        NSLayoutConstraint.activate([
            slider.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8),
            slider.topAnchor.constraint(equalTo: sliderLabel.bottomAnchor, constant: 4),
            slider.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8)
        ])

        slider.translatesAutoresizingMaskIntoConstraints = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
}

private extension EventsViewController {
    func bind() {}
}

