# My collection of dotfiles. (WIP)

based on parts of [https://github.com/nicknisi/dotfiles]

## Setup
All steps are based on (mac)OS (X) with [Xcode](https://developer.apple.com/xcode/) with installed Commandline Tools, [iTerm2](https://www.iterm2.com), [Oh-My-Zsh](http://ohmyz.sh) and [Homebrew](http://brew.sh) installed

### Short way, if /bin/sh does link to bash:
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/cwr10010/dotfiles/master/install.sh)"

### Long way

    $> brew install macvim --with-override-system-vim --with-lua --with-luajit --with-luajit --with-cscope
    $> brew install python libevent tmux git reattach-to-user-namespace maven \
       tree grep ssh-copy-id wakeonlan wget xz sqlite urlview uptime psutils cmake
    $> git clone https://github.com/cwr10010/dotfiles.git ~/.dotfiles
    $> ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
    $> ln -s ~/.dotfiles/vimrc ~/.vimrc
    $> ln -s ~/.dotfiles/zshrc ~/.zshrc
    $> ln -s ~/.dotfiles/config/powerline ~/.config/powerline
    $> ln -s ~/.dotfiles/zsh_custom/themes ~/.oh-my-zsh/custom/themes
    $> pip install --user git+git://github.com/powerline/powerline
    $> git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    $> vim +PluginInstall +qall
    $> git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    $> ~/.tmux/plugins/tpm/bin/install_plugins # may fail if sh does not link to bash

### Applications and fonts
* Import settings from ~/.dotfiles/iterm2/Solarized Dark.itermcolors into iTerm2
* Install fonts from ~/.dotfiles/fonts
* Setup iTerm2 to use Powerline-Font (Currently *12 pt Meslo LG S Regular for Powerline*)

### Additional setup
Some local setup can be stored in zshrc.local, like:

    alias wake_server="wakeonlan <MAC_ADDRESS>"
    export HOMEBREW_GITHUB_API_TOKEN=<API-TOKEN>
    BULLETTRAIN_CONTEXT_DEFAULT_USER=<ssh default user>

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

## TODO / Bugs
* [FIXME] Tmux config seems to hide <prefix>+j for going buffer down in VIM
* Wrap setup into one single shell-script
