class A365dt < Formula
  desc "Download Anime365 episodes without guessing translations"
  homepage "https://github.com/Gridness/a365dt"
  version "1.0.1"
  license "Apache-2.0"
  depends_on "ffmpeg-full" => :optional
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v1.0.1/a365dt-v1.0.1-aarch64-apple-darwin.tar.gz"
      sha256 "c77f8b14a079f2d5fb24af8edc176364cacbd9d6988bf682ab7e7465933e095e"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v1.0.1/a365dt-v1.0.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a74eacdab37e08cdeb16fc6fe7e308a90c6038703b3140450f8ccdd703dd3e71"
    end
    on_intel do
      url "https://github.com/Gridness/a365dt/releases/download/v1.0.1/a365dt-v1.0.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e6c603eb265cc039ed848b8f0565246465719aa8d9e24420bb893f412891781d"
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
