import ProjectDescription

public enum Environment {
    public static let appName = "GwakDiary"
    public static let targetName = "GwakDiary"
    public static let targetTestName = "\(targetName)Tests"
    public static let organizationName = "Heesang"
    public static let deploymentTarget: DeploymentTarget = .iOS(targetVersion: "13.0", devices: [.iphone, .ipad])
    public static let platform = Platform.iOS
    public static let baseSetting: SettingsDictionary = SettingsDictionary()
}
