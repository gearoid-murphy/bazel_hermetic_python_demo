load("//:pip.bzl", "pip_requirements")
py_binary(
    name = "pyrun",
    srcs = ["pyrun.py"],
    deps = pip_requirements(["tensorflow-gpu"])
)
