{ config, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = (pkgs.vscode.override { }).overrideAttrs (oldAttrs: rec {
      src = (
        builtins.fetchTarball {
          url = "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64";
          sha256 = "sha256:1qpl0spiv98ra8dqa4chj0xs9ib2rsqccf4bgai84izda1nfvrxs";
        }
      );
      version = "latest-release";
    });
    mutableExtensionsDir = true;

    profiles.default = {
      userSettings = {
        window = {
          titleBarStyle = "custom";
          zoomLevel = 0;
          customTitleBarVisibility = "auto";
        };

        editor = {
          fontSize = 16;
          cursorStyle = "block";
          cursorBlinking = "smooth";
          cursorSmoothCaretAnimation = "on";
          minimap.autohide = true;
          wordWrap = "on";
        };

        workbench.activityBar.location = "top";

        # Extensions
        zig.zls.path = "zls";
      };

      extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "vscode-zig";
          publisher = "ziglang";
          version = "0.6.11";
          sha256 = "sha256-yJrU47C/cJKmVcPoI1ibsBAiA0zSyP0AE6p87DUl28M=";
        }
        {
          name = "fluent-icons";
          publisher = "miguelsolorio";
          version = "0.0.19";
          sha256 = "sha256-OfPSh0SapT+YOfi0cz3ep8hEhgCTHpjs1FfmgAyjN58=";
        }
        {
          name = "min-theme";
          publisher = "miguelsolorio";
          version = "1.5.0";
          sha256 = "sha256-DF/9OlWmjmnZNRBs2hk0qEWN38RcgacdVl9e75N8ZMY=";
        }
        {
          name = "tsoding-emacs-gruber-minimal";
          publisher = "Anksio";
          version = "1.1.4";
          sha256 = "sha256-A/Dfr/zn3VdVcsFtF8bIfRBWGl9qpcZ2gc4r5/1Wn3E=";
        }
        {
          name = "vscode-bee-theme";
          publisher = "ttrodrigues";
          version = "0.0.3";
          sha256 = "sha256-I/j2zaZUuk6UBbIU4f/F8bDQ9ukqAF/v5xrUtYRyXrM=";
        }
        {
          name = "vscode-eslint";
          publisher = "dbaeumer";
          version = "3.0.15";
          sha256 = "sha256-oeudNCBrHO3yvw3FrFA4EZk1yODcRRfF/y3U5tdEz4I=";
        }
        {
          name = "monodark";
          publisher = "yoavbls";
          version = "1.0.1";
          sha256 = "sha256-AYxUNNB/7z4hoST8cHQOgF8nH4ou5KsA1W/h3N/oJVA=";
        }
        {
          name = "cpptools-themes";
          publisher = "ms-vscode";
          version = "2.0.0";
          sha256 = "sha256-YWA5UsA+cgvI66uB9d9smwghmsqf3vZPFNpSCK+DJxc=";
        }
        {
          name = "cmake-tools";
          publisher = "ms-vscode";
          version = "1.21.35";
          sha256 = "sha256-jNC8guYcqrF+R0KOIrWB+fX/f4TPgegXNfR4zRIBMno=";
        }
        {
          name = "cpptools";
          publisher = "ms-vscode";
          version = "1.26.3";
          sha256 = "sha256-f+7GTLxeBVUxuICbJm5H6pjNh1jzqq4x/Mi+Oje8YrU=";
        }
        {
          name = "python";
          publisher = "ms-python";
          version = "2025.9.2025070301";
          sha256 = "sha256-SBu6uKAUVPFYdBQKQJ4qvOEMhCOhwo4kBwjjPtbCsD4=";
        }
        {
          name = "debugpy";
          publisher = "ms-python";
          version = "2025.11.2025070101";
          sha256 = "sha256-HDzzrDO/Kp6MQ5DL9Rv8HIzWbGgPJ9Hi8FBmuJyr+9k=";
        }
        {
          name = "isort";
          publisher = "ms-python";
          version = "2025.1.11821009";
          sha256 = "sha256-bEySeM/TuDr7rN141w/UesIWZ+afXAErSANfvatR8nE=";
        }
        {
          name = "pylint";
          publisher = "ms-python";
          version = "2025.3.11821009";
          sha256 = "sha256-uxBlLerkVrOymdlomEsXy3w+pnlVU8KeoYUMesA4aTQ=";
        }
        {
          name = "vscode-pylance";
          publisher = "ms-python";
          version = "2025.6.101";
          sha256 = "sha256-JE2K3pNc81AFQfvnGe62XxAfajHOZy/G0gylJh/GClo=";
        }
        {
          name = "github-vscode-theme";
          publisher = "github";
          version = "6.3.5";
          sha256 = "sha256-dOadoYBPcYrpzmqOpJwG+/nPwTfJtlsOFDU3FctdR0o=";
        }
        {
          name = "intellicode-api-usage-examples";
          publisher = "visualstudioexptteam";
          version = "0.2.9";
          sha256 = "sha256-8xBD+WLBaxYt8v3+8lvV2SiqV89iE4jeQod2kH7LNHU=";
        }
        {
          name = "editorconfig";
          publisher = "editorconfig";
          version = "0.17.4";
          sha256 = "sha256-MYPYhSKAxgaZ0UijxU+xiO4HDPLtXGymhN+2YmTev8M=";
        }
        {
          name = "vscodeintellicode-insiders";
          publisher = "visualstudioexptteam";
          version = "1.1.10";
          sha256 = "sha256-BwxXdObHrqeHK+B5+TgyUoByyrSNl1niNGTMV2rbx80=";
        }
        {
          name = "codesnap";
          publisher = "adpyke";
          version = "1.3.4";
          sha256 = "sha256-dR6qODSTK377OJpmUqG9R85l1sf9fvJJACjrYhSRWgQ=";
        }
        {
          name = "hexeditor";
          publisher = "ms-vscode";
          version = "1.11.1";
          sha256 = "sha256-RB5YOp30tfMEzGyXpOwPIHzXqZlRGc+pXiJ3foego7Y=";
        }
        {
          name = "vscodeintellicode-completions";
          publisher = "visualstudioexptteam";
          version = "2.0.1";
          sha256 = "sha256-0LZxtcuEIQC3nqC1GcODc1t9J1tzjA6bXSBIsidUr4M=";
        }
        {
          name = "tokyo-night";
          publisher = "enkia";
          version = "1.1.2";
          sha256 = "sha256-oW0bkLKimpcjzxTb/yjShagjyVTUFEg198oPbY5J2hM=";
        }
        {
          name = "vscodeintellicode";
          publisher = "visualstudioexptteam";
          version = "1.3.2";
          sha256 = "sha256-2zexyX1YKD5jgtsvDx7/z3luh5We71ys+XRlVcNywfs=";
        }
        {
          name = "vsc-vira-theme";
          publisher = "vira";
          version = "1.6.2";
          sha256 = "sha256-dcEw81ZOAa5g6GZxASGP0woTcK//3+pmHQA7/IWxa08=";
        }
        {
          name = "prettier-vscode";
          publisher = "esbenp";
          version = "11.0.0";
          sha256 = "sha256-pNjkJhof19cuK0PsXJ/Q/Zb2H7eoIkfXJMLZJ4lDn7k=";
        }
        {
          name = "go";
          publisher = "golang";
          version = "0.48.0";
          sha256 = "sha256-W+GsieGOn9UhOB49v/NqsHCoOm4VNaZotipIN2E4N9k=";
        }
        {
          name = "makefile-tools";
          publisher = "ms-vscode";
          version = "0.13.7";
          sha256 = "sha256-SLFqY2RCsCM1yNg4A/aKU0xM2BMRZSq81jT9Do4LSZE=";
        }
        {
          name = "symbols";
          publisher = "miguelsolorio";
          version = "0.0.24";
          sha256 = "sha256-yEE6G2e/a2/DcKq1+Vtv0YIAtWZG5LyXfZ6cbheRV1g=";
        }
        {
          name = "even-better-toml";
          publisher = "tamasfe";
          version = "0.21.2";
          sha256 = "sha256-IbjWavQoXu4x4hpEkvkhqzbf/NhZpn8RFdKTAnRlCAg=";
        }
        {
          name = "vscode-deno";
          publisher = "denoland";
          version = "3.44.2";
          sha256 = "sha256-fwQvAqyYXg2oAUXUef9nW/WzZGillx0XRyXd/cMy7Ho=";
        }
        {
          name = "code-spell-checker";
          publisher = "streetsidesoftware";
          version = "4.2.0";
          sha256 = "sha256-1O8hTE06TkYoXAC8vTv1UeaLqYNGyc9U6i80iCsNypI=";
        }
        {
          name = "vscode-tailwindcss";
          publisher = "bradlc";
          version = "0.14.24";
          sha256 = "sha256-/JZ38KVIzxv3w6czb/9MNt2WcKuqBb1i2c4D2BYBSFU=";
        }
        {
          name = "volar";
          publisher = "vue";
          version = "3.0.1";
          sha256 = "sha256-nv9DmW7DuYVVsibpSJ8A7AawsL9cySgp2r5xgpE0WYM=";
        }
        {
          name = "vim";
          publisher = "vscodevim";
          version = "1.30.1";
          sha256 = "sha256-cKdVQTGj7R37YefQAaTspF1RVul/9wv7u9b5TpGZN5k=";
        }
        {
          name = "lldb-dap";
          publisher = "llvm-vs-code-extensions";
          version = "0.2.15";
          sha256 = "sha256-Xr/TUpte9JqdvQ8eoD0l8ztg0tR8qwX/Ju1eVU6Xc0s=";
        }
        {
          name = "vscode-typescript-next";
          publisher = "ms-vscode";
          version = "5.9.20250706";
          sha256 = "sha256-RoP1GC9LL1ftpIrxzyh3yY0HHFKxO90zCL21UM3zhKc=";
        }
        {
          name = "copilot-chat";
          publisher = "GitHub";
          version = "0.29.2025070403";
          sha256 = "sha256-A1/oDMHclxXWYViZACGj82fCSgxqZfqWH469CbByUyQ=";
        }
        {
          name = "copilot";
          publisher = "GitHub";
          version = "1.339.1660";
          sha256 = "sha256-6yp785LKyLDzJnqcBto26GBgE2QHykBArj0lGu/+bhE=";
        }
        {
          name = "rust-analyzer";
          publisher = "rust-lang";
          version = "0.4.2526";
          sha256 = "sha256-RsKWq5Nxi0UbLaESUD8YWPcr1X58g0Q+O9LthH7Q5B0=";
        }
      ];
    };
  };
}
