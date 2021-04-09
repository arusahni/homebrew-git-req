class GitReq < Formula
  desc "Switch between merge/pull requests in your GitLab and GitHub repositories with just the request ID."
  homepage "https://arusahni.github.io/git-req/"
  url "https://github.com/arusahni/git-req/archive/v2.3.0.tar.gz"
  sha256 "e963f45677e459d62ea6e3e6e42190aa5cb2a54719034699cab75e86d1316499"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--root", prefix, "--path", "."
    man.mkpath
    man1.install "target/release/git-req.1"
  end

  test do
    assert_match /git-req 2.3.0/, shell_output("#{bin}/git-req --version")
  end
end
