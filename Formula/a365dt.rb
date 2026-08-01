class A365dt < Formula
  desc "Download Anime365 episodes without guessing translations"
  homepage "https://github.com/Gridness/a365dt"
  version "1.1.0"
  license "Apache-2.0"
  depends_on "ffmpeg-full" => :optional
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v1.1.0/a365dt-v1.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "5021bd5487f2e5bab11a4cd01c47901a44019bfdaa716b9b89776d0fe444a224"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v1.1.0/a365dt-v1.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9580e3fa44c6271e67593bcbfc0f15455495da06c490f7a8a6cd064a1cc79a19"
    end
    on_intel do
      url "https://github.com/Gridness/a365dt/releases/download/v1.1.0/a365dt-v1.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fad4f832aca9287023b248e5656d1fe931412acd44aeec8b5d9d99cbea69cec3"
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
