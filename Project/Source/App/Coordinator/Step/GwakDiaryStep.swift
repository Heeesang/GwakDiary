enum GwakDiaryStep {
    case popVC
    
    case writeDiaryRequired
    case readDiaryRequired(diary: Observable<DiaryModel>)

}
