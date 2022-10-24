
final class MainCoordinator: baseCoordinator {
    
    override func start() {
        let vm = MainViewModel(coordinator: self)
        let vc = MainViewController(viewModel: vm)
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    override func navigate(to step: GwakDiaryStep) {
        switch step {
        case let .writeDiaryRequired(closure):
            navigateToWriteDiary(closure: closure)
        case let .readDiaryRequired(closure):
            navigateToReadDiary(closure: closure)   
        }
    }
}

private extension MainCoordinator {
    func navigateToReadDiary(closure: () -> Void) {
        let vm = ReadDiaryViewModel(coordinator: self)
        let vc = ReadDiaryViewController(viewModel: vm)
        self.navigationController.pushViewController(vc, animated: true)
    }
    func navigateToWriteDiary(closure: () -> Void) {
        let vm = WriteDiaryViewModel(coordinator: self)
        let vc = WriteDiaryViewController(viewModel: vm)
        self.navigationController.pushViewController(vc, animated: true)
    }
}
    
