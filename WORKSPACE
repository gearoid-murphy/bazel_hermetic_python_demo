workspace(name = "bazel-hermetic-python-test")

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

git_repository(
    name = "bazel_hermetic_python",
    commit = "ac97d03f8881f6f087544c26145a1dd6133ede20",
    remote = "https://github.com/gearoid-murphy/bazel_hermetic_python.git"
)

load("@bazel_hermetic_python//:repositories.bzl", "setup_hermetic_python_dependencies")
setup_hermetic_python_dependencies()
load("@bazel_hermetic_python//:initialization.bzl", "register_hermetic_python_subsystems")
register_hermetic_python_subsystems()

register_toolchains("@bazel_hermetic_python//:hermetic_py_toolchain")

http_archive(
    name = "rules_python",
    sha256 = "934c9ceb552e84577b0faf1e5a2f0450314985b4d8712b2b70717dc679fdc01b",
    url = "https://github.com/bazelbuild/rules_python/releases/download/0.3.0/rules_python-0.3.0.tar.gz",
)
load("@rules_python//python:pip.bzl", "pip_parse")
pip_parse(
    name = "pip_parsed_deps",
    enable_implicit_namespace_pkgs = True,
    extra_pip_args = ["--no-cache-dir"],
    requirements_lock = "//:bazel_pip_requirements.txt",
)
load("@pip_parsed_deps//:requirements.bzl", install_parsed_pip_deps="install_deps")
install_parsed_pip_deps()

