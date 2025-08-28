class Meow < Formula
  desc "Print ASCII cats to your terminal"
  homepage "https://github.com/PixelSergey/meow"
  url "https://github.com/PixelSergey/meow/archive/refs/tags/v2.1.5.tar.gz"
  sha256 "00ba73786c02e7726f5143c95672d69adbc5595f4afb4841e6e33e5fc7b9c511"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    bin.install bin/"meow-cli" => "meow"
  end

  test do
    assert_match(/^Print ASCII cats to your terminal/, shell_output("#{bin}/meow --help"))
    assert_match(/^meow/, shell_output("#{bin}/meow -V"))
  end
end
