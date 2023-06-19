cask "glpi-agent" do
  arch arm: "arm64", intel: "x86_64"

  version "1.4"
  sha256 arm:   "4d92fafe04f087d7ed11644b96c018c63fe6e2ddc843f02ba9ac299a9e4b97a1",
         intel: "b328b43cc5b663fca3ecde77ef06d7af5d227822fa77524b3da9a6b705c7f119"

  url "https://github.com/glpi-project/glpi-agent/releases/download/#{version}/GLPI-Agent-#{version}_#{arch}.pkg"
  name "GLPI Agent"
  desc "Inventory Agent for GLPI"
  homepage "https://github.com/glpi-project/glpi-agent"

  pkg "GLPI-Agent-#{version}_#{arch}.pkg"

  uninstall script:  {
              executable:   "/Applications/GLPI-Agent/uninstaller.sh",
              must_succeed: false,
              sudo:         true,
            },
            pkgutil: "org.glpi-project.glpi-agent",
            delete:  "/Applications/GLPI-Agent"

  caveats <<~EOS
    #{token} requires manual configuration before use.
    See online documentation: https://glpi-agent.readthedocs.io/en/latest/installation/#macos
  EOS
end
