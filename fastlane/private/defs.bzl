load("@build_bazel_rules_apple//apple:providers.bzl", "AppleBundleInfo")
load(":common.bzl", "RUNNER_ATTR")
load(":providers.bzl", "FastlaneInfo")

def _fastlane(ctx):
    binaries = []
    bundles = ctx.attr.apple_bundles
    for b in bundles:
        b = b[AppleBundleInfo]
        binaries.append(b.archive)
    providers = []

    fastfile = ctx.actions.declare_file("Fastfile")
    ctx.actions.write(
        content = "",
        output = fastfile,
    )
    providers.append(
        FastlaneInfo(
            fastfile = fastfile,
            apple_targets = [ctx.attr.apple_bundles],
        ),
    )
    return providers

fastlane = rule(
    implementation = _fastlane,
    attrs = {
        "fastfile": attr.label(mandatory = True, allow_single_file = True),
        "apple_bundles": attr.label_list(providers = [AppleBundleInfo]),
    } | RUNNER_ATTR,
)
