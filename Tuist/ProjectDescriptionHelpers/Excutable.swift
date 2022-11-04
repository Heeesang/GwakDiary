import ProjectDescription

extension Project{
    public static func excutable(
        name: String,
        platform: Platform,
        packages: [Package] = [],
        product: Product = .app,
        deploymentTarget: DeploymentTarget = .iOS(targetVersion: "14.0", devices: [.iphone, .iphone]),
        dependencies: [TargetDependency]
    ) -> Project {
        return Project(
            name: name,
            organizationName: publicOrganizationName,
            packages: packages,
            targets: [
                Target(
                    name: name,
                    platform: platform,
                    product: product,
                    bundleId: "\(publicOrganizationName).\(name)",
                    deploymentTarget: deploymentTarget,
                    infoPlist: .file(path: Path("Project/Support/Info.plist")),
                    sources: ["Project/Source/**"],
                    resources: ["Project/Resource/**"],
                    entitlements: Path("Project/Support/\(name).entitlements"),
                    dependencies: dependencies
                )
            ]
        )
    }
}
