class A365dt < Formula
  desc "Download Anime365 episodes without guessing translations"
  homepage "https://github.com/Gridness/a365dt"
  version "0.12.0"
  license "Apache-2.0"
  depends_on "ffmpeg-full" => :optional
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.12.0/a365dt-v0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "1e4c280b76152ded5b406c95432810fbeebbb2f8a072f70f8290e714538ae2bd"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.12.0/a365dt-v0.12.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "73c381e66a8a31fc2264b608b012e5e1466cddf40d0a271cf1c2f1322d92f2e6"
    end
    on_intel do
      url "https://github.com/Gridness/a365dt/releases/download/v0.12.0/a365dt-v0.12.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3ebf92c0c022f5404e24661e4292e36793c2f0c522e9b2ddb2dc2cd94ae3ef8a"
    end
  end
  def install
    bin.install "a365dt"
    generate_completions_from_executable bin/"a365dt", "completions"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/a365dt --version")
  end
end
