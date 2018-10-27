import UIKit

final class StateViewController: UIViewController {
    // Subviews
    private let textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        return textField
    }()

    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add", for: [])
        return button
    }()

    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()

    private let resultsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.tableFooterView = UIView()
        return tableView
    }()

    // Data
    private var data: [String] = []

    override func loadView() {
        createView()
        addSubviews()
        createConstraints()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpResultsTableView()
        bind()
    }

    private func createView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
    }

    private func addSubviews() {
        view.addSubview(textField)
        view.addSubview(button)
        view.addSubview(separator)
        view.addSubview(resultsTableView)
    }

    private func createConstraints() {
        // Text field
        NSLayoutConstraint.activate([
            textField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8),
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        ])

        textField.translatesAutoresizingMaskIntoConstraints = false

        // Button
        NSLayoutConstraint.activate([
            button.leftAnchor.constraint(equalTo: textField.rightAnchor, constant: 16),
            button.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            button.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8)
        ])

        button.translatesAutoresizingMaskIntoConstraints = false

        // Separator
        NSLayoutConstraint.activate([
            separator.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            separator.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            separator.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 16),
            separator.heightAnchor.constraint(equalToConstant: 0.5)
        ])

        separator.translatesAutoresizingMaskIntoConstraints = false

        // Results table view
        NSLayoutConstraint.activate([
            resultsTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            resultsTableView.topAnchor.constraint(equalTo: separator.bottomAnchor),
            resultsTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            resultsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        resultsTableView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setUpResultsTableView() {
        resultsTableView.dataSource = self
        resultsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "DataCell")
    }
}

extension StateViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
}

private extension StateViewController {
    func bind() {
        button.addTarget(self, action: #selector(add(sender:)), for: .touchUpInside)
    }

    @objc func add(sender: UIButton) {
        if let data = textField.text, !data.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            self.data += [data]
            resultsTableView.reloadData()
        }

        textField.text = ""
    }
}
