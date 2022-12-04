import ProjectDescription

extension TargetDependency{
    public struct SPM {}
}

public extension TargetDependency.SPM{
    static let SnapKit = TargetDependency.package(product: "SnapKit")
    static let Then = TargetDependency.package(product: "Then")
    static let GoogleSignIn = TargetDependency.package(product: "GoogleSignIn")
    static let RealmSwift = TargetDependency.package(product: "RealmSwift")
    static let Lottie = TargetDependency.package(product: "Lottie")
}

public extension Package {
    static let SnapKit = Package.remote(
        url: "https://github.com/SnapKit/SnapKit.git",
        requirement: .upToNextMajor(from: "5.6.0")
    )
    static let Then = Package.remote(
        url: "https://github.com/devxoul/Then.git",
        requirement: .upToNextMajor(from: "3.0.0")
    )
    static let GoogleSignIn = Package.remote(
        url: "https://github.com/google/GoogleSignIn-iOS",
        requirement: .upToNextMajor(from: "6.2.2")
    )
    static let RealmSwift = Package.remote(
        url: "https://github.com/realm/realm-swift",
        requirement: .upToNextMajor(from: "10.32.2"))
    static let Lottie = Package.remote(
        url: "https://github.com/airbnb/lottie-ios",
        requirement: .upToNextMajor(from:"3.5.0"))
}
