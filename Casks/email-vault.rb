cask "email-vault" do
  version "1.1.0"
  sha256 "d7f77fb54e00b10c1f7339ce23f2131814ebac20ec89d8e617e8fb30b7d6133e"

  url "https://github.com/mortalxu98/email-vault/releases/download/v#{version}/EmailVault-#{version}.dmg"
  name "Email Vault"
  desc "Offline, encrypted password vault that organizes accounts by email"
  homepage "https://github.com/mortalxu98/email-vault"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Email Vault.app"

  # The vault itself (~/.local/share/email-vault) is deliberately not zapped.
  zap trash: "~/Library/Preferences/local.email-vault.plist"

  caveats <<~EOS
    Email Vault is not notarized by Apple. On first launch macOS will say it
    cannot verify the developer: click Done, then open
    System Settings → Privacy & Security and click "Open Anyway".

    Your vault lives in ~/.local/share/email-vault and is never removed by
    uninstalling, even with --zap.
  EOS
end
