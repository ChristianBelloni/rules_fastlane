load("@build_bazel_rules_apple//apple:providers.bzl", "AppleBundleInfo")
load("@rules_fastlane//fastlane/private:common.bzl", "RUNNER_ATTR")
load("@rules_fastlane//fastlane/private:providers.bzl", "FastlaneInfo")

def _pilot_upload_impl(ctx):
    bundle = ctx.attr.app[AppleBundleInfo]
    fastlaneinfo = ctx.attr.fastlane[FastlaneInfo]

    runfiles_relative_tool_path = ctx.attr._fastlane[DefaultInfo].files_to_run.executable.short_path

    ctx.actions.expand_template(
        output = ctx.outputs.executable,
        template = ctx.file._template,
        is_executable = True,
        substitutions = {
            "{FASTLANE}": runfiles_relative_tool_path,
            "{ARCHIVE}": bundle.archive.path,
        },
    )

    my_runfiles = ctx.runfiles(files = [ctx.files._runfiles_lib[0], bundle.archive, fastlaneinfo.fastfile])

    my_runfiles = my_runfiles.merge(ctx.attr._fastlane[DefaultInfo].default_runfiles)

    return DefaultInfo(
        runfiles = my_runfiles,
    )

def _pilot_builds_impl(ctx):
    pass

def _pilot_list_impl(ctx):
    pass

def _pilot_import_impl(ctx):
    pass

def _pilot_export_impl(ctx):
    pass

pilot_upload = rule(
    implementation = _pilot_upload_impl,
    attrs = {
        "app": attr.label(providers = [AppleBundleInfo]),
        "fastlane": attr.label(providers = [FastlaneInfo]),
        "_template": attr.label(default = Label("@rules_fastlane//fastlane/private/templates:pilot_upload.tpl"), allow_single_file = True),
        "_runfiles_lib": attr.label(default = Label("@bazel_tools//tools/bash/runfiles"), allow_single_file = True),
    } | RUNNER_ATTR,
    executable = True,
)
