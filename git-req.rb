class GitReq < Formula
  desc "Switch between merge/pull requests in your GitLab and GitHub repositories with just the request ID."
  homepage "https://arusahni.github.io/git-req/"
  url "https://github.com/arusahni/git-req/archive/v2.5.0.tar.gz"
  sha256 "fbdcde595a8575bec00e703ce6fc9253270a591facb7c5688ef548eaeb70b705"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--root", prefix, "--path", "."
    man.mkpath
    man1.install "target/release/git-req.1"
  end

  test do
    assert_match /git-req 2.5.0/, shell_output("#{bin}/git-req --version")
  end
end
