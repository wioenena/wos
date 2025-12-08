{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    profiles = {
      default.enableExtensionUpdateCheck = true;
      nixos = {
        extensions =
          (with pkgs.vscode-extensions; [
            miguelsolorio.min-theme
            github.copilot
            github.copilot-chat
            vscodevim.vim
            ms-azuretools.vscode-containers
            redhat.vscode-yaml
            bradlc.vscode-tailwindcss
            ms-vscode-remote.remote-containers
            mikestead.dotenv
            yoavbls.pretty-ts-errors
            aaron-bond.better-comments
            gruntfuggly.todo-tree
            streetsidesoftware.code-spell-checker
            vue.volar
            tamasfe.even-better-toml
            rust-lang.rust-analyzer
            ms-kubernetes-tools.vscode-kubernetes-tools
            golang.go
            prisma.prisma
          ])
          ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
            {
              name = "fluent-icons";
              publisher = "miguelsolorio";
              version = "0.0.19";
              sha256 = "sha256-OfPSh0SapT+YOfi0cz3ep8hEhgCTHpjs1FfmgAyjN58=";
            }
            {
              name = "symbols";
              publisher = "miguelsolorio";
              version = "0.0.25";
              sha256 = "sha256-nhymeLPfgGKyg3krHqRYs2iWNINF6IFBtTAp5HcwMs8=";
            }
          ];
        globalSnippets = { };
        keybindings = [ ];
        languageSnippets = { };
        userSettings = {
          window.zoomLevel = 0.75;
          editor = {
            formatOnSave = true;
            fontSize = 16;
            fontLigatures = true;
            fontFamily = "JetBrains Mono";
            cursorStyle = "line";
            cursorBlinking = "smooth";
            cursorSmoothCaretAnimation = "on";
            minimap.autohide = "mouseover";
            wordWrap = "on";
            unicodeHighlight.allowedLocales.tr = true;
          };
          files = {
            autoSave = "afterDelay";
            autoSaveDelay = 5000;
          };
          workbench = {
            secondarySideBar.defaultVisibility = "hidden";
            activityBar.location = "top";
            productIconTheme = "fluent-icons";
            iconTheme = "symbols";
            colorTheme = "Min Dark";
          };
          debug.allowBreakpointsEverywhere = true;
          "[rust]" = {
            editor.defaultFormatter = "rust-lang.rust-analyzer";
          };
          "[typescript][typescriptreact]" = {
            editor.defaultFormatter = "esbenp.prettier-vscode";
          };
          "[json][jsonc]" = {
            editor.defaultFormatter = "esbenp.prettier-vscode";
          };
          github.copilot.chat.commitMessageGeneration.instructions = [
            {
              "text" =
                "# 🌍 Global Copilot Instructions\n\n## 🎯 Purpose\nThese global instructions ensure GitHub Copilot always generates commit messages compliant with **Conventional Commits**.";
            }
            {
              "text" =
                "## 🧱 Conventional Commits Format\n\nEach commit message MUST follow this structure:\n\n<type>(<scope>): <short description>\n\n[optional body]\n[optional footer(s)]";
            }
            {
              "text" =
                "### Allowed <type> values\n\nfeat — Introduces a new feature\nfix — Fixes a bug\ndocs — Documentation changes only\nstyle — Style/format changes\nrefactor — Refactors without behavior change\nperf — Performance improvements\ntest — Test additions/updates\nbuild — Build/dependency changes\nci — CI configuration\nchore — Maintenance tasks\nrevert — Reverts a commit";
            }
            {
              "text" =
                "## 🧠 Commit Message Rules\n\n1. Always use lowercase for type and scope.\n2. Keep subject under 70 characters.\n3. Use imperative mood (e.g., add, not added).\n4. Do not end subject with a period.\n5. Separate body/footer with blank lines.\n6. Use 'general' as default scope.\n7. Prefer multiple commits for multiple logical changes.";
            }
            {
              "text" =
                "### Examples\n\nfeat(auth): add JWT authentication\nfix(api): handle null pointer in user endpoint\ndocs(readme): update usage instructions\nrefactor(core): simplify data validation logic\nchore(deps): bump express to v5.0.0";
            }
            {
              "text" =
                "## 🧭 Enhancements\n\nFor issue references:\nfix(ui): align header on mobile\n\ncloses #123\n\nFor breaking changes:\nfeat(core): update API response format\n\nBREAKING CHANGE: response fields renamed";
            }
            {
              "text" =
                "## 🛠️ Developer Notes\n\n- Avoid vague commit text.\n- One logical change per commit.\n- Use descriptive scopes (api, ui, auth, core, docs).";
            }
            {
              "text" =
                "## 🎯 Copilot Objective\n\nCopilot must ALWAYS generate commit messages strictly following the **Conventional Commits** standard.";
            }
            {
              "text" =
                "## When creating commit messages, be sure to use simple, minimalist descriptions. Commit messages shouldn't be too long.";
            }
          ];
        };
        userTasks = { };
      };
    };
  };
}
