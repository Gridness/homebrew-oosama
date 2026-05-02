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
  version "0.2.0"
  depends_on :macos

  on_macos do
    depends_on IinaRequirement

    if Hardware::CPU.arm?
      url "https://github.com/Gridness/anicli/releases/download/v0.2.0/anicli-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "3eab414734f158faaf64add7be6dc692dcea5250b88d1b5fcbe57fc094c47495"
    else
      url "https://github.com/Gridness/anicli/releases/download/v0.2.0/anicli-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "33890bae6354c4398a4478b26fe1dcdc6a1eaccedd868f837d856816817d56ea"
    end
  end

  def install
    bin.install "anicli"
  end

  test do
    assert_equal "anicli", shell_output("#{bin}/anicli --version").chomp
  end
end
