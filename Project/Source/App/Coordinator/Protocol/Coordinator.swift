import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var parentCoordinator: Coordinator? { get set }
    
    func start()
    func start(coordinator: Coordinator)
    func navigate(to step: GwakDiaryStep)
    func didFinish(coordinator: Coordinator)
    func removeChildCoordinatiors()
}
