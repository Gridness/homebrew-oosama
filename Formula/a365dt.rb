class A365dt < Formula
  desc "Download Anime365 episodes without guessing translations"
  homepage "https://github.com/Gridness/a365dt"
  version "0.8.0"
  license "Apache-2.0"
  depends_on "ffmpeg-full" => :optional
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.8.0/a365dt-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "a2e5c0f49dba775985ecc94909af3eb8d5e685d3f64db42f6fc98bbd46766307"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.8.0/a365dt-v0.8.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c568cfcb1e5344f100554f20ebeb251d3721ee2295639ac0210af64e17c18f1a"
    end
    on_intel do
      url "https://github.com/Gridness/a365dt/releases/download/v0.8.0/a365dt-v0.8.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "206c2b02a80f08f2a37b9f0af7bb732ba2edc2ce3c4e8ce8f9348b0cde7e6bbe"
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
