class A365dt < Formula
  desc "Download Anime365 episodes without guessing translations"
  homepage "https://github.com/Gridness/a365dt"
  version "2.0.0"
  license "Apache-2.0"
  depends_on "ffmpeg-full" => :optional
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v2.0.0/a365dt-v2.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "99602550afd6a5ee1c2137fc760a25a4c0d9541aa25bbde8ae6520e96e6b16bb"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v2.0.0/a365dt-v2.0.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6e7ec236d834d958a9a25a3363329dbb90894d4e93e4d57565ac713d8880171b"
    end
    on_intel do
      url "https://github.com/Gridness/a365dt/releases/download/v2.0.0/a365dt-v2.0.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1d41d6867c8b6a6b72a1cc39acc9ef304cd4f9645945555a2c5617b1cbda429b"
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
