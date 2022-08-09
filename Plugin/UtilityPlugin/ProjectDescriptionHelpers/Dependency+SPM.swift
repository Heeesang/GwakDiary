// swiftlint:disable all
import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let Lottie = TargetDependency.package(product: "Lottie")
    static let Inject = TargetDependency.package(product: "Inject")
}

public extension Package {
    static let Lottie = Package.remote(
        url: "https://github.com/airbnb/lottie-ios",
        requirement: .upToNextMajor(from: "3.4.0")
    )
    static let Inject = Package.remote(
        url: "https://github.com/krzysztofzablocki/Inject",
        requirement: .upToNextMajor(from: "1.2.1")
    )
}
