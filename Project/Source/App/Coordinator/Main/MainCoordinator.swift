
final class MainCoordinator: baseCoordinator {
    
    override func start() {
        let vm = MainViewModel(coordinator: self)
        let vc = MainViewController(viewModel: vm)
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    override func navigate(to step: GwakDiaryStep) {
        switch step {
        case .writeDiaryRequired:
            navigateToWriteDiary()
        case let .readDiaryRequired(contents):
            navigateToReadDiary(contents: contents)
        }
    }
}

private extension MainCoordinator {
    func navigateToReadDiary(contents: String) {
        let vm = ReadDiaryViewModel(coordinator: self, contents: contents)
        let vc = ReadDiaryViewController(viewModel: vm)
        self.navigationController.pushViewController(vc, animated: true)
    }
    func navigateToWriteDiary() {
        let vm = WriteDiaryViewModel(coordinator: self)
        let vc = WriteDiaryViewController(viewModel: vm)
        self.navigationController.pushViewController(vc, animated: true)
    }
}
    
