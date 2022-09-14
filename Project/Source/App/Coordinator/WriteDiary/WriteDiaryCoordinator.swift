
final class WriteDiaryCoordinator: baseCoordinator {
    
    override func start() {
        let vm = WriteDiaryViewModel(coordinator: self)
        let vc = WriteDiaryViewController(viewModel: vm)
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}

