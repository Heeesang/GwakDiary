
final class MainCoordinator: baseCoordinator {
    
    override func start() {
        let vm = MainViewModel(coordinator: self)
        let vc = MainViewController(viewModel: vm)
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    func pushSecondVC() {
        let secondViewCoordinator = WriteDiaryCoordinator(navigationController: navigationController)
        secondViewCoordinator.parentCoordinator = self
        childCoordinatrs.append(secondViewCoordinator)
        secondViewCoordinator.start()
    }
}
