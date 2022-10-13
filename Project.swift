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
        .RealmSwift
    ],
    product: .app,
    deploymentTarget: .iOS(targetVersion: "13.5", devices: [.iphone, .ipad]),
    dependencies: [
        .SPM.Then,
        .SPM.SnapKit,
        .SPM.GoogleSignIn,
        .SPM.RealmSwift
    ]
)
