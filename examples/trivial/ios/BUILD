load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")
load("@rules_fastlane//fastlane:defs.bzl", "pilot_upload")

swift_library(
    name = "app_lib",
    srcs = ["App.swift"],
)

ios_application(
    name = "App",
    bundle_id = "com.example.app",
    families = ["iphone"],
    infoplists = [":Info.plist"],
    minimum_os_version = "16",
    visibility = ["//visibility:public"],
    deps = [":app_lib"],
)

pilot_upload(
    name = "upload_to_testflight",
    app = ":App",
    fastlane = "//:fastlane",
)
