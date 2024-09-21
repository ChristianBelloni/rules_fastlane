load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# Skylib is a dependency, remove if you already have it.
http_archive(
    name = "bazel_skylib",
    sha256 = "74d544d96f4a5bb630d465ca8bbcfe231e3594e5aae57e1edbf17a6eb3ca2506",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.3.0/bazel-skylib-1.3.0.tar.gz",
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.3.0/bazel-skylib-1.3.0.tar.gz",
    ],
)

http_archive(
    name = "rules_ruby",
    sha256 = "9bcf239ef669b19b53e041827a3b5fb54439b3505e1d93680d6839cbdcc80d52",
    strip_prefix = "rules_ruby-0.12.1",
    url = "https://github.com/bazel-contrib/rules_ruby/releases/download/v0.12.1/rules_ruby-v0.12.1.tar.gz",
)

load("@rules_ruby//ruby:deps.bzl", "rb_bundle_fetch", "rb_register_toolchains")

rb_register_toolchains(
    version = "jruby-9.4.7.0",
    # alternatively, load version from .ruby-version file
    # version_file = "//:.ruby-version",
)

rb_bundle_fetch(
    name = "bundle",
    gemfile = "//:Gemfile",
    gemfile_lock = "//:Gemfile.lock",
)
