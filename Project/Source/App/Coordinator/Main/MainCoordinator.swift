
final class MainCoordinator: baseCoordinator {
    
    override func start() {
        let vm = MainViewModel(coordinator: self)
        let vc = MainViewController(viewModel: vm)
        
        navigationController.pushViewController(vc, animated: true)
    }
    
    override func navigate(to step: GwakDiaryStep) {
        switch step {
        case .popVC:
            navigatePopVC()
        case .writeDiaryRequired:
            navigateToWriteDiary()
        case let .readDiaryRequired(diary):
            navigateToReadDiary(diary: diary)
        }
    }
}

private extension MainCoordinator {
    func navigatePopVC() {
        self.navigationController.popViewController(animated: true)
    }
    func navigateToReadDiary(diary: DiaryModel) {
        let vm = ReadDiaryViewModel(coordinator: self, diary: diary)
        let vc = ReadDiaryViewController(viewModel: vm)
        self.navigationController.pushViewController(vc, animated: true)
    }
    func navigateToWriteDiary() {
        let vm = WriteDiaryViewModel(coordinator: self)
        let vc = WriteDiaryViewController(viewModel: vm)
        self.navigationController.pushViewController(vc, animated: true)
    }
}
    
