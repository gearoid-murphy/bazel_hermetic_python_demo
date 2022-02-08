load("@pip_parsed_deps//:requirements.bzl", "requirement")

def pip_requirements(names):
    requirements = []
    for name in names:
        requirements.append(requirement(name))
    return requirements

