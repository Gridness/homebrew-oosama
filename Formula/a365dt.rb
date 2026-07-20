class A365dt < Formula
  desc "Download Anime365 episodes without guessing translations"
  homepage "https://github.com/Gridness/a365dt"
  version "0.2.0"
  license "Apache-2.0"
  depends_on "ffmpeg-full" => :optional
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.2.0/a365dt-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "4ac4ffdc835fb1099779bcbcf92fbd0193d557296976d76a148794ac483725da"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.2.0/a365dt-v0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "34bfc637a60f96de486e55dfa50f1c9c66222e2902f4aff3c7ab841b15a97763"
    end
    on_intel do
      url "https://github.com/Gridness/a365dt/releases/download/v0.2.0/a365dt-v0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "24c35b4b3f8ebedcf1c94bdab06bb016087e26eab7e5a7ab825621d1393b38d4"
    end
  end
  def install
    bin.install "a365dt"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/a365dt --version")
  end
end
