class A365dt < Formula
  desc "Download Anime365 episodes without guessing translations"
  homepage "https://github.com/Gridness/a365dt"
  version "1.0.0"
  license "Apache-2.0"
  depends_on "ffmpeg-full" => :optional
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v1.0.0/a365dt-v1.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "fb2756197c8438ff76acbb58c9cb447f11dcb075aa6fb5c05b70dd2e271270f1"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v1.0.0/a365dt-v1.0.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7c770bf41f00c7ec16b5343a46bdfd882cccb98070564ca560e14e30f4828a1b"
    end
    on_intel do
      url "https://github.com/Gridness/a365dt/releases/download/v1.0.0/a365dt-v1.0.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fdebd24d6204b0f7ca19e14aa30838a2ece3a79c12005ed97e009aff3ae10597"
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
