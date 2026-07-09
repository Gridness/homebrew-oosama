class IinaRequirement < Requirement
  fatal true

  satisfy(build_env: false) do
    File.exist?("/Applications/IINA.app") ||
    File.exist?(File.expand_path("~/Applications/IINA.app"))
  end

  def message
    "IINA is required by anicli on macOS. Please install it with:\n  brew install --cask iina"
  end
end

class Anicli < Formula
  desc "Find your favorite anime titles in the terminal and watch them with mpv"
  homepage "https://github.com/Gridness/anicli"
  license "AGPL-3.0-or-later"
  version "0.3.0"
  depends_on :macos

  deprecate! date: "2026-07-09", because: :unmaintained

  on_macos do
    depends_on IinaRequirement

    if Hardware::CPU.arm?
      url "https://github.com/Gridness/anicli/releases/download/v0.3.0/anicli-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "6273d028df4eb705ae306e6431b8c519575d8e222987bc6e7b2756546ba6fe9e"
    else
      url "https://github.com/Gridness/anicli/releases/download/v0.3.0/anicli-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "a5e2da9ee825fc645f98666357628e8ae1795a4bad83f3e7e9269164e2016b65"
    end
  end

  def install
    bin.install "anicli"
  end

  test do
    assert_equal "anicli", shell_output("#{bin}/anicli --version").chomp
  end
end
