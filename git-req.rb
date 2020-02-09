class GitReq < Formula
  desc "Check out merge requests from GitLab/GitHub repositories with ease!"
  homepage "https://arusahni.github.io/git-req/"
  url "https://github.com/arusahni/git-req/archive/v2.2.0-rc.0.tar.gz"
  sha256 "deac9a0942f2ad4d9294b1b44fa7c018cd0a15bd23f7769779720e21ef643c8c"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--root", prefix, "--path", "."
    man.mkpath
    man1.install "target/release/git-req.man"
  end

  test do
    assert_match /git-req 2.2.0-rc.0/, shell_output("#{bin}/git-req --version")
  end
end
