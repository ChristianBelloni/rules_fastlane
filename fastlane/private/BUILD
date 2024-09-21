load("@bazel_skylib//:bzl_library.bzl", "bzl_library")

bzl_library(
    name = "private",
    srcs = glob(["*.bzl"]),
    visibility = ["//fastlane:__subpackages__"],
    deps = ["@build_bazel_rules_apple//apple:providers"],
)
