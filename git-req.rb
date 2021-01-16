class GitReq < Formula
  desc "Switch between merge/pull requests in your GitLab and GitHub repositories with just the request ID."
  homepage "https://arusahni.github.io/git-req/"
  url "https://github.com/arusahni/git-req/archive/v2.2.1.tar.gz"
  sha256 "074a41e2246eb44d6a44d5615d441dd300078080bd013a9c2346e4c7cb93e17a"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--root", prefix, "--path", "."
    man.mkpath
    man1.install "target/release/git-req.1"
  end

  test do
    assert_match /git-req 2.2.1/, shell_output("#{bin}/git-req --version")
  end
end
