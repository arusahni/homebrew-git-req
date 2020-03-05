class GitReq < Formula
  desc "Switch between merge/pull requests in your GitLab and GitHub repositories with just the request ID."
  homepage "https://arusahni.github.io/git-req/"
  url "https://github.com/arusahni/git-req/archive/v2.2.0.tar.gz"
  sha256 "9ac96c2dbdcdc591218a09d2c35bc8d663f2f913467b0f229bc3e4fa5903b04c"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--root", prefix, "--path", "."
    man.mkpath
    man1.install "target/release/git-req.1"
  end

  test do
    assert_match /git-req 2.2.0/, shell_output("#{bin}/git-req --version")
  end
end
