load("@rules_fastlane//fastlane:defs.bzl", "fastlane")

fastlane(
    name = "fastlane",
    apple_bundles = ["//ios:App"],
    fastfile = ":Fastfile",
    visibility = ["//visibility:public"],
)
