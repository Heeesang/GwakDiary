import UIKit

class baseCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinatrs = [Coordinator]()
    var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    deinit {
        print("\(type(of: self)): \(#function)")
    }
    
    func start() {
        
    }
    
    func start(coordinator: Coordinator) {
        
    }
    
    func didFinish(coordinator: Coordinator) {
        
    }
    
    func removeChildCoordinatiors() {
        
    }
    
}
