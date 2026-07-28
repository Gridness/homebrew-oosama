class A365dt < Formula
  desc "Download Anime365 episodes without guessing translations"
  homepage "https://github.com/Gridness/a365dt"
  version "0.6.3"
  license "Apache-2.0"
  depends_on "ffmpeg-full" => :optional
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.6.3/a365dt-v0.6.3-aarch64-apple-darwin.tar.gz"
      sha256 "0bfb130ddcf1663d14348d8c7b2d3f9052e645e9b748e5f7db5a8dd137a4f4cd"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.6.3/a365dt-v0.6.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "29b3a75cdd0f0e4d67cf8adb7a9654d174239d6fc852e869134147e53f3a42fe"
    end
    on_intel do
      url "https://github.com/Gridness/a365dt/releases/download/v0.6.3/a365dt-v0.6.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8d946b0626a2dd6b5b09ee2203419760cea1958cff377178bcccec7b8811bae4"
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
