import ProjectDescription
import ProjectDescriptionHelpers

let projectName = "GwakDiary"
let orginazationIden = "com.GwakDiary"

let project = Project.excutable(
    name: projectName,
    platform: .iOS,
    packages: [
        .Then,
        .SnapKit,
        .GoogleSignIn,
        .RealmSwift,
        .Lottie
    ],
    product: .app,
    deploymentTarget: .iOS(targetVersion: "14.0", devices: [.iphone, .ipad]),
    dependencies: [
        .SPM.Then,
        .SPM.SnapKit,
        .SPM.GoogleSignIn,
        .SPM.RealmSwift,
        .SPM.Lottie
    ]
)
