class A365dt < Formula
  desc "Download Anime365 episodes without guessing translations"
  homepage "https://github.com/Gridness/a365dt"
  version "0.10.0"
  license "Apache-2.0"
  depends_on "ffmpeg-full" => :optional
  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.10.0/a365dt-v0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "50805d0830e713551687dc41a43fb060c2ac11411edd56b7bd02e550aca9470d"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/Gridness/a365dt/releases/download/v0.10.0/a365dt-v0.10.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bdaed939f8657f2fff3258f8b5bf3fceda009be1eb09a097cee7d9a03f2330f4"
    end
    on_intel do
      url "https://github.com/Gridness/a365dt/releases/download/v0.10.0/a365dt-v0.10.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e1dac4e75cb81cb3ef0d039c913c7c2749b50c86cf3e782aacd5fecd0011cdaa"
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
