class Spacetime < Formula
  desc "Command-line interface for SpacetimeDB"
  homepage "https://spacetimedb.com"
  version "2.8.0"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/clockworklabs/SpacetimeDB/releases/download/v2.8.0/spacetime-aarch64-apple-darwin.tar.gz"
    sha256 "5a8bf1efa0d10c113805843e477079ea24cd1cd045049e39252531c0097bf517"
  else
    url "https://github.com/clockworklabs/SpacetimeDB/releases/download/v2.8.0/spacetime-x86_64-apple-darwin.tar.gz"
    sha256 "c52b759ed1048c52a1ca66030ac29ca078df00dcb13f516ef98e15b2b459322f"
  end

  def install
    bin.install "spacetimedb-cli" => "spacetime"
    bin.install "spacetimedb-standalone"
  end

  def caveats
    <<~EOS
      This formula uses Homebrew for SpacetimeDB version management.
      Upgrade with:

        brew upgrade spacetime

      SpacetimeDB stores user configuration and local database data
      outside the Homebrew prefix. These are intentionally preserved
      when the formula is uninstalled.

      Default locations:

        ~/.config/spacetime
        ~/.local/share/spacetime/data

      If you previously used the official SpacetimeDB installer, it may
      also have installed version-managed binaries under:

        ~/.local/share/spacetime/bin
        ~/.local/bin/spacetime
    EOS
  end

  test do
    system bin/"spacetime", "--version"
  end
end
