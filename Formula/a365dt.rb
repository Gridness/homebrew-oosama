class A365dt < Formula
  desc "Download Anime365 episodes without guessing translations"
  homepage "https://github.com/Gridness/a365dt"
  version "0.7.2"
  license "Apache-2.0"
  depends_on "ffmpeg-full" => :optional
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.7.2/a365dt-v0.7.2-aarch64-apple-darwin.tar.gz"
      sha256 "5c2791966b07b3ca596059f1d052234a146d773255ae3106d0172114d2be42dc"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.7.2/a365dt-v0.7.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ef7000da9682c5fbebf93141359879859def1b11036428ff2797337b49c2b787"
    end
    on_intel do
      url "https://github.com/Gridness/a365dt/releases/download/v0.7.2/a365dt-v0.7.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c2a6099a469e4730a16e765873a9231e5d3b801e0944867c9a434337085b245b"
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
