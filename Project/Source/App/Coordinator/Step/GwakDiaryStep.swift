enum GwakDiaryStep {
    case writeDiaryRequired(() -> Void)
    case readDiaryRequired(() -> Void)
}
