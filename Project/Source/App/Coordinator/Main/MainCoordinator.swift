
final class MainCoordinator: baseCoordinator {
    
    override func start() {
        let vm = ReadDiaryViewModel(coordinator: self)
        let vc = ReadDiaryViewController(viewModel: vm)
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}
