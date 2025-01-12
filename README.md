# Readme Dependency Updater

This is a quick script to easily update versions of your system dependencies in your README, or some docs file where they are listed. An example in this README is below:

#### Example Dependencies

- Python version >= <!-- python-v -->3.13.1<!-- /python-v -->
- Docker version >= <!-- docker-v -->27.4.0<!-- /docker-v -->
- FFmpeg version >= <!-- ffmpeg-v -->7.1<!-- /ffmpeg-v -->

This example is in markdown, but any format that supports inline comments will work.

## Usage

**Step 1:** Copy [update_readme_dependencies.sh](update_readme_dependencies.sh) to your project.

**Step 2:** In your README (or other docs file), surround each instance of a version dependency with an inline comment marking the start and end of where the version number should be. An example for markdown is below:

```markdown
- Python version >= <!-- python-v -->3.13.1<!-- /python-v -->
- Docker version >= <!-- docker-v -->27.4.0<!-- /docker-v -->
- FFmpeg version >= <!-- ffmpeg-v -->7.1<!-- /ffmpeg-v -->
```

You can use any comment syntax you want (as long as it's inline), and you can use any start and end key syntax you feel like is convenient for you.

**Step 3:** Make the following updates to `update_readme_dependencies.sh`:

- Set `README_PATH` to the path to your README file (or wherever your dependencies are documented).
- For each dependency, add a variable `DEPENDENCY_CMD` with the command to get its version, and `DEPENDENCY_KEY_START` and `DEPENDENCY_KEY_END` with the start and end keys (examples for python, docker and ffmpeg are given in the script).
- Ensure the calls to `update_version` at the bottom are updated with your dependencies.

Now you can run that script whenever you want to ensure your dependencies are up to date, and whenever you want to add a new dependency, repeat the above steps for the new one.

It's designed to work on both macOS and Linux, but I only tested it on macOS so let me know if it doesn't work on Linux.
