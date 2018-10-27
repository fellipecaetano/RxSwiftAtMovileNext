import UIKit

final class MenuViewController: UITableViewController {
    private let data = DemoKind.all
    private weak var delegate: MenuViewControllerDelegate?

    init (delegate: MenuViewControllerDelegate?) {
        super.init(style: .plain)
        self.delegate = delegate
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MenuCell")
        tableView.tableFooterView = UIView()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].title
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.menuViewController(self, didSelectDemoKind: data[indexPath.row])
    }
}

protocol MenuViewControllerDelegate: class {
    func menuViewController(_ menuViewController: MenuViewController, didSelectDemoKind demoKind: DemoKind)
}
