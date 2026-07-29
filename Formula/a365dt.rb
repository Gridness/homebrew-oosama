class A365dt < Formula
  desc "Download Anime365 episodes without guessing translations"
  homepage "https://github.com/Gridness/a365dt"
  version "0.8.1"
  license "Apache-2.0"
  depends_on "ffmpeg-full" => :optional
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.8.1/a365dt-v0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "0f60718f3fb14412a8732960f321e115a555786ea55e0f7c5af9aeabb5283f45"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.8.1/a365dt-v0.8.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5d254e7ff0f3869c24de689cad2adf809e0c4abcd6339489388475fee8aaa223"
    end
    on_intel do
      url "https://github.com/Gridness/a365dt/releases/download/v0.8.1/a365dt-v0.8.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "80093cac1c90386a1e54be37c5cb10caae43d84bdb6232fdbea0c580750ccc03"
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
