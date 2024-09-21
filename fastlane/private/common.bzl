"""
Common definitions used by rules_fastlane
"""

RUNNER_ATTR = {
    "_fastlane": attr.label(default = "@rules_fastlane//tools:fastlane", allow_files = True),
}
