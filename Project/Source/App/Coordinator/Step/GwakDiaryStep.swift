enum GwakDiaryStep {
    case dismiss(() -> Void)
    
    case writeDiaryRequired
    case readDiaryRequired
    
}
