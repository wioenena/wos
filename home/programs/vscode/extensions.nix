{ pkgs, ... }:
with pkgs;
{
  programs.vscode.extensions =
    with pkgs.vscode-extensions;
    [ ms-vscode.cpptools ]
    ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      # Theming
      {
        name = "material-icon-theme";
        publisher = "PKief";
        version = "5.4.2";
        sha256 = "sha256-Akb8JeNLs/7B0FXFeHjEXZSs5P34gIzXlpiOwDYzfKk=";
      }
      {
        name = "vsc-material-theme";
        publisher = "equinusocio";
        version = "34.4.0";
        sha256 = "sha256-q5GgMVEak9KhY1LwPkIPHgz/j2AMZuz2QQWzLAKkIdU=";
      }
      {
        name = "fluent-icons";
        publisher = "miguelsolorio";
        version = "0.0.18";
        sha256 = "sha256-sE0A441QPwokBoLoCqtImDHmlAXd66fj8zsJR7Ci+Qs=";
      }
      {
        name = "vscode-symbols-icon-theme";
        publisher = "wilfriedago";
        version = "0.0.1";
        sha256 = "sha256-V3hJu+ekCsx9qEF3MoG0RUpmJpgZOo8qhU43BwIMC7c=";
      }
      {
        name = "shades-of-cyan-theme";
        publisher = "moondevaa";
        version = "0.1.1";
        sha256 = "sha256-Q69S2z2vTSErAb4WENrq2TSkz1Z91wKeIa5muwlyCKM=";
      }
      {
        name = "tokyo-night";
        publisher = "enkia";
        version = "1.0.6";
        sha256 = "sha256-VWdUAU6SC7/dNDIOJmSGuIeffbwmcfeGhuSDmUE7Dig=";
      }
      {
        name = "vscode-bee-theme";
        publisher = "ttrodrigues";
        version = "0.0.3";
        sha256 = "sha256-I/j2zaZUuk6UBbIU4f/F8bDQ9ukqAF/v5xrUtYRyXrM=";
      }

      # Javascript + Typescript + HTML + CSS
      {
        publisher = "dbaeumer";
        name = "vscode-eslint";
        version = "3.0.10";
        sha256 = "sha256-EVmexnTIQQDmj25/rql3eCfJd47zRui3TpHol6l0Vgs=";
      }
      {
        name = "auto-rename-tag";
        publisher = "formulahendry";
        version = "0.1.10";
        sha256 = "sha256-uXqWebxnDwaUVLFG6MUh4bZ7jw5d2rTHRm5NoR2n0Vs=";
      }
      {
        name = "prettier-vscode";
        publisher = "esbenp";
        version = "10.4.0";
        sha256 = "sha256-8+90cZpqyH+wBgPFaX5GaU6E02yBWUoB+T9C2z2Ix8c=";
      }
      {
        name = "sass-indented";
        publisher = "syler";
        version = "1.8.29";
        sha256 = "sha256-6RYI6Gu5UePTicmKm85ZnN5C19hQASc/t5lHWoKjpYk=";
      }
      {
        name = "pretty-ts-errors";
        publisher = "yoavbls";
        version = "0.5.4";
        sha256 = "sha256-JSCyTzz10eoUNu76wNUuvPVVKq4KaVKobS1CAPqgXUA=";
      }
      {
        name = "vscode-tailwindcss";
        publisher = "bradlc";
        version = "0.11.75";
        sha256 = "sha256-Ib4is73KyP1O0MNYi6sHZ41Xmad3wdCIo9zyTtTX1qk=";
      }
      {
        name = "vscode-typescript-next";
        publisher = "ms-vscode";
        version = "5.6.20240619";
        sha256 = "sha256-Em1sHoKz9/HELu6CzlUgS3kVUW7LrDwKGqJP6WFmIMg=";
      }

      # C/C++
      {
        name = "better-cpp-syntax";
        publisher = "jeff-hykin";
        version = "1.17.2";
        sha256 = "sha256-p3SKu9FbtuP6in2dSsr5a0aB5W+YNQ0kMgMJoDYrhcU=";
      }
      {
        name = "cpptools-themes";
        publisher = "ms-vscode";
        version = "2.0.0";
        sha256 = "sha256-YWA5UsA+cgvI66uB9d9smwghmsqf3vZPFNpSCK+DJxc=";
      }
      {
        name = "cmake";
        publisher = "twxs";
        version = "0.0.17";
        sha256 = "sha256-CFiva1AO/oHpszbpd7lLtDzbv1Yi55yQOQPP/kCTH4Y=";
      }
      {
        name = "cmake-tools";
        publisher = "ms-vscode";
        version = "1.19.10";
        sha256 = "sha256-FeDmF8TkbT89N+L2lOvXVQzhEPkzmmmYIgsjVZmkPsE=";
      }

      # Python
      {
        name = "python";
        publisher = "ms-python";
        version = "2024.9.11711009";
        sha256 = "sha256-CiEac9BKiHuPjjpAzQImezhLzoDVcalDlEH3uD2IcMI=";
      }
      {
        name = "debugpy";
        publisher = "ms-python";
        version = "2024.7.11591015";
        sha256 = "sha256-JrbxykbZR4+WWnVhEyxgYFnWHITrJvORaUG6MT7PZIk=";
      }
      {
        name = "vscode-pylance";
        publisher = "ms-python";
        version = "2024.6.100";
        sha256 = "sha256-SXq6rCk8VtfVu3Ga+H4Nl3UHeX6Jtcqk4RkJBCohVB0=";
      }
      {
        name = "autodocstring";
        publisher = "njpwerner";
        version = "0.6.1";
        sha256 = "sha256-NI0cbjsZPW8n6qRTRKoqznSDhLZRUguP7Sa/d0feeoc=";
      }
      {
        name = "isort";
        publisher = "ms-python";
        version = "2023.13.11511010";
        sha256 = "sha256-X1o+7KzhHotTzohzUGtGlpJPbfiUrVBwkenRcJUAQrQ=";
      }
      {
        name = "pylint";
        publisher = "ms-python";
        version = "2023.11.13481007";
        sha256 = "sha256-rn+6vT1ZNpjzHwIy6ACkWVvQVCEUWG2abCoirkkpJts=";
      }

      # Node + NPM
      {
        name = "npm-intellisense";
        publisher = "christian-kohler";
        version = "1.4.5";
        sha256 = "sha256-liuFGnyvvVHzSv60oLkemFyv85R+RiGKErRIUz2PYKs=";
      }
      {
        name = "npm";
        publisher = "idered";
        version = "1.7.4";
        sha256 = "sha256-Nf3IOPRNAq+USNIn1CZAvyIPFCyQ5VK5NW6HJvpG5Us=";
      }
      ## React
      {
        name = "es7-react-js-snippets";
        publisher = "dsznajder";
        version = "4.4.3";
        sha256 = "sha256-QF950JhvVIathAygva3wwUOzBLjBm7HE3Sgcp7f20Pc=";

      }

      # Nix
      {
        name = "nix-ide";
        publisher = "jnoortheen";
        version = "0.3.1";
        sha256 = "sha256-05oMDHvFM/dTXB6T3rcDK3EiNG2T0tBN9Au9b+Bk7rI=";
      }
      {
        name = "nix-env-selector";
        publisher = "arrterian";
        version = "1.0.11";
        sha256 = "sha256-dK0aIH8tkG/9UGblNO0WwxJABBEEKEy4nSmIwdDpf4Q=";
      }

      # Go
      {
        name = "go";
        publisher = "golang";
        version = "0.41.4";
        sha256 = "sha256-ntrEI/l+UjzqGJmtyfVf/+sZJstZy3fm/PSWKTd7/Q0=";
      }

      # Rust
      {
        name = "rust-analyzer";
        publisher = "rust-lang";
        version = "0.4.2005";
        sha256 = "sha256-OQORzKPk9ccuUhj7i1JKEIkaTnyWSlLnTVA1eoY+wGk=";
      }
      {
        name = "even-better-toml";
        publisher = "tamasfe";
        version = "0.19.2";
        sha256 = "sha256-JKj6noi2dTe02PxX/kS117ZhW8u7Bhj4QowZQiJKP2E=";
      }

      # Nim
      {
        name = "nim";
        publisher = "kosz78";
        version = "0.6.6";
        sha256 = "sha256-sNW6Lvfyep8Hvas6cSufuRmol3q4mCyX8c/K78y8Nug=";
      }

      # Others
      {
        name = "copilot";
        publisher = "Github";
        version = "1.204.942";
        sha256 = "sha256-wEMuxeTHJGRKEoZWb0n68MzNN+icDtyW2VhpFtX2PQ4=";
      }
      {
        name = "copilot-chat";
        publisher = "Github";
        version = "0.17.2024061901";
        sha256 = "sha256-XuWRaaXyxclRiupSfW0gwu4CGPUoZaFTn1D6nxiDM7c=";
      }
      {
        name = "vscodeintellicode";
        publisher = "VisualStudioExptTeam";
        version = "1.3.1";
        sha256 = "sha256-ZMNQQO1CyyQPg2WJgxKAuk/a1K1miGdCxCqZE0uFg34=";
      }
      {
        name = "intellicode-api-usage-examples";
        publisher = "VisualStudioExptTeam";
        version = "0.2.8";
        sha256 = "sha256-aXAS3QX+mrX0kJqf1LUsvguqRxxC0o+jj1bKQteXPNA=";
      }
      {
        name = "vscodeintellicode-completions";
        publisher = "VisualStudioExptTeam";
        version = "2.0.0";
        sha256 = "sha256-q+OB9IQ/lI56tYbPGp//M95uCH7OnLaA09UtklcILjs=";
      }
      {
        name = "vscodeintellicode-insiders";
        publisher = "VisualStudioExptTeam";
        version = "1.1.10";
        sha256 = "sha256-BwxXdObHrqeHK+B5+TgyUoByyrSNl1niNGTMV2rbx80=";
      }
      {
        name = "EditorConfig";
        publisher = "EditorConfig";
        version = "0.16.4";
        sha256 = "sha256-j+P2oprpH0rzqI0VKt0JbZG19EDE7e7+kAb3MGGCRDk=";
      }
      {
        name = "dotenv";
        publisher = "mikestead";
        version = "1.0.1";
        sha256 = "sha256-dieCzNOIcZiTGu4Mv5zYlG7jLhaEsJR05qbzzzQ7RWc=";
      }
      {
        name = "gitignore";
        publisher = "codezombiech";
        version = "0.9.0";
        sha256 = "sha256-IHoF+c8Rsi6WnXoCX7x3wKyuMwLh14nbL9sNVJHogHM=";
      }
      {
        name = "codesnap";
        publisher = "adpyke";
        version = "1.3.4";
        sha256 = "sha256-dR6qODSTK377OJpmUqG9R85l1sf9fvJJACjrYhSRWgQ=";
      }
      {
        name = "code-spell-checker";
        publisher = "streetsidesoftware";
        version = "4.0.3";
        sha256 = "sha256-CEGwbw5RpFsfB/g2inScIqWB7/3oxgxz7Yuc6V3OiHg=";
      }

      {
        name = "better-comments";
        publisher = "aaron-bond";
        version = "3.0.2";
        sha256 = "sha256-hQmA8PWjf2Nd60v5EAuqqD8LIEu7slrNs8luc3ePgZc=";
      }
      {
        name = "LiveServer";
        publisher = "ritwickdey";
        version = "5.7.9";
        sha256 = "sha256-w0CYSEOdltwMFzm5ZhOxSrxqQ1y4+gLfB8L+EFFgzDc=";
      }
      {
        name = "vim";
        publisher = "vscodevim";
        version = "1.27.3";
        sha256 = "sha256-nuNG5rPjuH0m1ScuIReQ1NcO++M63mwQsI5quhxjusw=";
      }
      {
        name = "vscode-todo-highlight";
        publisher = "wayou";
        version = "1.0.5";
        sha256 = "sha256-CQVtMdt/fZcNIbH/KybJixnLqCsz5iF1U0k+GfL65Ok=";
      }
      {
        name = "hexeditor";
        publisher = "ms-vscode";
        version = "1.10.0";
        sha256 = "sha256-EDUspQrqVvIq4CkPjO6+Mnw5fvepahUM1TS6rnxekVY=";
      }
      {
        name = "errorlens";
        publisher = "usernamehw";
        version = "3.18.0";
        sha256 = "sha256-sRZRBUne9IqDBSe4BXyqBqirIyjeP03B2w9+ptNrJl0=";
      }
      {
        name = "gitlens-insiders";
        publisher = "eamodio";
        version = "2023.3.1104";
        sha256 = "sha256-6VCkw0iPdreuLGUDdjp1zukB4MLJUcaoXmPP4HkQUgY=";
      }
      {
        name = "vscord";
        publisher = "LeonardSSH";
        version = "5.2.12";
        sha256 = "sha256-WGDEizYG6UAqe1jnhvjfFouXDA9Yr5P+BjxPahAIsTE=";
      }
      {
        name = "direnv";
        publisher = "mkhl";
        version = "0.17.0";
        sha256 = "sha256-9sFcfTMeLBGw2ET1snqQ6Uk//D/vcD9AVsZfnUNrWNg=";
      }
    ];
}
