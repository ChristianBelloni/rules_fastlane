load("@bazel_skylib//:bzl_library.bzl", "bzl_library")

bzl_library(
    name = "fastlane",
    visibility = ["//visibility:public"],
    deps = ["//fastlane/private"],
)

exports_files(
    srcs = ["defs.bzl"],
    visibility = ["//visibility:public"],
)
