# My collection of dotfiles. (WIP)

## Setup

All steps are based on (mac)OS (X) with [Xcode](https://developer.apple.com/xcode/) with installed Commandline Tools and [Homebrew](http://brew.sh) installed

Additionally you need SDKMan:

    curl -s "https://get.sdkman.io" | bash

### Short way, if /bin/sh does link to bash:

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/cwr10010/dotfiles/master/install.sh)"

### What will be installed with several plugins and extensions:

- [Alacritty](https://github.com/alacritty/alacritty)
- [fish shell](https://fishshell.com)
- [tmux](https://github.com/tmux/tmux)
- [neovim](https://neovim.io)
- And the font:

  MesloLGS Nerd Font (https://www.nerdfonts.com/font-downloads)

### Optional / Final Things

Make Fish the standard shell:
echo (which fish) | sudo tee -a /etc/shells
chsh -s (which fish)

Initialize vale:
~/.local/share/nvim/mason/packages/vale/vale --config=$HOME/.config/vale/.vale.ini sync

### LaTeX Letter Template

You can create a Scrlttr2 Letter with ease and a nice layout. These dotfiles provide Scrlttr2 .lco for that. Simply create a me.lco with your address data in the directory your .tex file of the letter will be, with the following content

    \newcommand{\myFirstname}{FIRSTNAME}
    \newcommand{\myFamilyname}{FAMILYNAME}
    \newcommand{\myStreet}{STREET AND NUMBER}
    \newcommand{\myTown}{TOWN}
    \newcommand{\myZipcode}{ZIPCODE}
    \newcommand{\myCell}{CELLPHONENUMBER}
    \newcommand{\myPhone}{PHONENUMBER}
    % \newcommand{\myFax}{}
    \newcommand{\myMail}{me@mail.com}
    % \newcommand{\myExtrainfo}{foobar}

    \LoadLetterOption{LetterEnclosure}

And then you can use that simply by creating your TeX file

    \documentclass[MyLetter]{scrlttr2}
    %---------------------------------------------------------------------------
    \begin{document}
    %---------------------------------------------------------------------------
    \LoadLetterOptions{KOMAold,me} % replace me with the name of your lco file
    %---------------------------------------------------------------------------
    \begin{letter}{Vorname Nachname\\
      Beispielstr. 1\\
    12345 Berlin\\
    Deutschland}
    %---------------------------------------------------------------------------
    % Further options
    \KOMAoptions{%%
    }
    %---------------------------------------------------------------------------
    \setkomavar{subject}{MEIN BETREFF}
    %---------------------------------------------------------------------------
    \opening{Sehr geehrte Damen und Herren,}

    TEXT5

    \closing{Mit freundlichen Grüßen}

    %---------------------------------------------------------------------------
    % \ps{PS:}

    %\encl{Lebenslauf\\Zeugnisse}
    % \cc{}
    %---------------------------------------------------------------------------
    \end{letter}
    %---------------------------------------------------------------------------
    \end{document}
    %---------------------------------------------------------------------------

and replace 'me' with the name of your .lco file (without the extention)
