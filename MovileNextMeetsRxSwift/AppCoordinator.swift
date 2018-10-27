import UIKit

final class AppCoordinator {
    private unowned let window: UIWindow
    private let masterViewController = UINavigationController()
    private let splitViewController = UISplitViewController()

    init (window: UIWindow) {
        self.window = window
    }

    func start() {
        splitViewController.viewControllers = [masterViewController, eventsViewController()]
        masterViewController.viewControllers = [menuViewController(delegate: self)]
        window.rootViewController = splitViewController
    }
}

extension AppCoordinator: MenuViewControllerDelegate {
    func menuViewController(_ menuViewController: MenuViewController, didSelectDemoKind demoKind: DemoKind) {
        switch demoKind {
        case .events:
            splitViewController.showDetailViewController(eventsViewController(), sender: nil)
        case .state:
            splitViewController.showDetailViewController(stateViewController(), sender: nil)
        default:
            return
        }
    }
}

private extension AppCoordinator {
    func menuViewController(delegate: MenuViewControllerDelegate?) -> MenuViewController {
        let menuViewController = MenuViewController(delegate: delegate)
        menuViewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        return menuViewController
    }

    func eventsViewController() -> EventsViewController {
        let detailViewController = EventsViewController()
        detailViewController.title = DemoKind.events.title
        return detailViewController
    }

    func stateViewController() -> StateViewController {
        let detailViewController = StateViewController()
        detailViewController.title = DemoKind.state.title
        return detailViewController
    }
}
